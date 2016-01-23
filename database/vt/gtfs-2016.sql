--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.18
-- Dumped by pg_dump version 9.1.18
-- Started on 2016-01-23 14:54:35

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 198 (class 3079 OID 11639)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 198
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET search_path = "public", pg_catalog;

--
-- TOC entry 1302 (class 0 OID 0)
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "box2d";


--
-- TOC entry 199 (class 1255 OID 17332)
-- Dependencies: 6 1302
-- Name: box2d_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box2d_in"("cstring") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_in';


ALTER FUNCTION "public"."box2d_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 203 (class 1255 OID 17333)
-- Dependencies: 6 1302
-- Name: box2d_out("box2d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box2d_out"("box2d") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_out';


ALTER FUNCTION "public"."box2d_out"("box2d") OWNER TO "postgres";

--
-- TOC entry 1301 (class 1247 OID 17331)
-- Dependencies: 203 199 6
-- Name: box2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "box2d" (
    INTERNALLENGTH = 16,
    INPUT = "box2d_in",
    OUTPUT = "box2d_out",
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE "public"."box2d" OWNER TO "postgres";

--
-- TOC entry 1306 (class 0 OID 0)
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "box3d";


--
-- TOC entry 212 (class 1255 OID 17336)
-- Dependencies: 6 1306
-- Name: box3d_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d_in"("cstring") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


ALTER FUNCTION "public"."box3d_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 213 (class 1255 OID 17337)
-- Dependencies: 6 1306
-- Name: box3d_out("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d_out"("box3d") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_out';


ALTER FUNCTION "public"."box3d_out"("box3d") OWNER TO "postgres";

--
-- TOC entry 1305 (class 1247 OID 17335)
-- Dependencies: 6 212 213
-- Name: box3d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "box3d" (
    INTERNALLENGTH = 48,
    INPUT = "box3d_in",
    OUTPUT = "box3d_out",
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE "public"."box3d" OWNER TO "postgres";

--
-- TOC entry 1310 (class 0 OID 0)
-- Name: box3d_extent; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "box3d_extent";


--
-- TOC entry 214 (class 1255 OID 17340)
-- Dependencies: 6 1310
-- Name: box3d_extent_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d_extent_in"("cstring") RETURNS "box3d_extent"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


ALTER FUNCTION "public"."box3d_extent_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 215 (class 1255 OID 17341)
-- Dependencies: 6 1310
-- Name: box3d_extent_out("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d_extent_out"("box3d_extent") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_out';


ALTER FUNCTION "public"."box3d_extent_out"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 1309 (class 1247 OID 17339)
-- Dependencies: 6 215 214
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "box3d_extent" (
    INTERNALLENGTH = 48,
    INPUT = "box3d_extent_in",
    OUTPUT = "box3d_extent_out",
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE "public"."box3d_extent" OWNER TO "postgres";

--
-- TOC entry 1314 (class 0 OID 0)
-- Name: chip; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "chip";


--
-- TOC entry 216 (class 1255 OID 17344)
-- Dependencies: 6 1314
-- Name: chip_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "chip_in"("cstring") RETURNS "chip"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_in';


ALTER FUNCTION "public"."chip_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 217 (class 1255 OID 17345)
-- Dependencies: 6 1314
-- Name: chip_out("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "chip_out"("chip") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_out';


ALTER FUNCTION "public"."chip_out"("chip") OWNER TO "postgres";

--
-- TOC entry 1313 (class 1247 OID 17343)
-- Dependencies: 216 217 6
-- Name: chip; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "chip" (
    INTERNALLENGTH = variable,
    INPUT = "chip_in",
    OUTPUT = "chip_out",
    ALIGNMENT = double,
    STORAGE = extended
);


ALTER TYPE "public"."chip" OWNER TO "postgres";

--
-- TOC entry 1318 (class 0 OID 0)
-- Name: geography; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "geography";


--
-- TOC entry 218 (class 1255 OID 17348)
-- Dependencies: 6
-- Name: geography_analyze("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_analyze"("internal") RETURNS boolean
    LANGUAGE "c" STRICT
    AS '$libdir/postgis-1.5', 'geography_analyze';


ALTER FUNCTION "public"."geography_analyze"("internal") OWNER TO "postgres";

--
-- TOC entry 219 (class 1255 OID 17349)
-- Dependencies: 6 1318
-- Name: geography_in("cstring", "oid", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_in"("cstring", "oid", integer) RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_in';


ALTER FUNCTION "public"."geography_in"("cstring", "oid", integer) OWNER TO "postgres";

--
-- TOC entry 220 (class 1255 OID 17350)
-- Dependencies: 6 1318
-- Name: geography_out("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_out"("geography") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_out';


ALTER FUNCTION "public"."geography_out"("geography") OWNER TO "postgres";

--
-- TOC entry 221 (class 1255 OID 17351)
-- Dependencies: 6
-- Name: geography_typmod_in("cstring"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_typmod_in"("cstring"[]) RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_in';


ALTER FUNCTION "public"."geography_typmod_in"("cstring"[]) OWNER TO "postgres";

--
-- TOC entry 222 (class 1255 OID 17352)
-- Dependencies: 6
-- Name: geography_typmod_out(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_typmod_out"(integer) RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_out';


ALTER FUNCTION "public"."geography_typmod_out"(integer) OWNER TO "postgres";

--
-- TOC entry 1317 (class 1247 OID 17347)
-- Dependencies: 6 219 220 221 222 218
-- Name: geography; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "geography" (
    INTERNALLENGTH = variable,
    INPUT = "geography_in",
    OUTPUT = "geography_out",
    TYPMOD_IN = "geography_typmod_in",
    TYPMOD_OUT = "geography_typmod_out",
    ANALYZE = "geography_analyze",
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE "public"."geography" OWNER TO "postgres";

--
-- TOC entry 1322 (class 0 OID 0)
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "geometry";


--
-- TOC entry 223 (class 1255 OID 17355)
-- Dependencies: 6
-- Name: geometry_analyze("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_analyze"("internal") RETURNS boolean
    LANGUAGE "c" STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_analyze';


ALTER FUNCTION "public"."geometry_analyze"("internal") OWNER TO "postgres";

--
-- TOC entry 224 (class 1255 OID 17356)
-- Dependencies: 6 1322
-- Name: geometry_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_in"("cstring") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_in';


ALTER FUNCTION "public"."geometry_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 225 (class 1255 OID 17357)
-- Dependencies: 6 1322
-- Name: geometry_out("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_out"("geometry") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_out';


ALTER FUNCTION "public"."geometry_out"("geometry") OWNER TO "postgres";

--
-- TOC entry 226 (class 1255 OID 17358)
-- Dependencies: 6 1322
-- Name: geometry_recv("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_recv"("internal") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_recv';


ALTER FUNCTION "public"."geometry_recv"("internal") OWNER TO "postgres";

--
-- TOC entry 227 (class 1255 OID 17359)
-- Dependencies: 6 1322
-- Name: geometry_send("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_send"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_send';


ALTER FUNCTION "public"."geometry_send"("geometry") OWNER TO "postgres";

--
-- TOC entry 1321 (class 1247 OID 17354)
-- Dependencies: 6 224 225 226 227 223
-- Name: geometry; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "geometry" (
    INTERNALLENGTH = variable,
    INPUT = "geometry_in",
    OUTPUT = "geometry_out",
    RECEIVE = "geometry_recv",
    SEND = "geometry_send",
    ANALYZE = "geometry_analyze",
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


ALTER TYPE "public"."geometry" OWNER TO "postgres";

--
-- TOC entry 1325 (class 1247 OID 17363)
-- Dependencies: 6 161
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "geometry_dump" AS (
	"path" integer[],
	"geom" "geometry"
);


ALTER TYPE "public"."geometry_dump" OWNER TO "postgres";

--
-- TOC entry 1329 (class 0 OID 0)
-- Name: gidx; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "gidx";


--
-- TOC entry 228 (class 1255 OID 17365)
-- Dependencies: 6 1329
-- Name: gidx_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "gidx_in"("cstring") RETURNS "gidx"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'gidx_in';


ALTER FUNCTION "public"."gidx_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 229 (class 1255 OID 17366)
-- Dependencies: 6 1329
-- Name: gidx_out("gidx"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "gidx_out"("gidx") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'gidx_out';


ALTER FUNCTION "public"."gidx_out"("gidx") OWNER TO "postgres";

--
-- TOC entry 1328 (class 1247 OID 17364)
-- Dependencies: 229 228 6
-- Name: gidx; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "gidx" (
    INTERNALLENGTH = variable,
    INPUT = "gidx_in",
    OUTPUT = "gidx_out",
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE "public"."gidx" OWNER TO "postgres";

--
-- TOC entry 1333 (class 0 OID 0)
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "pgis_abs";


--
-- TOC entry 230 (class 1255 OID 17369)
-- Dependencies: 6 1333
-- Name: pgis_abs_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_abs_in"("cstring") RETURNS "pgis_abs"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_abs_in';


ALTER FUNCTION "public"."pgis_abs_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 231 (class 1255 OID 17370)
-- Dependencies: 6 1333
-- Name: pgis_abs_out("pgis_abs"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_abs_out"("pgis_abs") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_abs_out';


ALTER FUNCTION "public"."pgis_abs_out"("pgis_abs") OWNER TO "postgres";

--
-- TOC entry 1332 (class 1247 OID 17368)
-- Dependencies: 6 230 231
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "pgis_abs" (
    INTERNALLENGTH = 8,
    INPUT = "pgis_abs_in",
    OUTPUT = "pgis_abs_out",
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE "public"."pgis_abs" OWNER TO "postgres";

--
-- TOC entry 1337 (class 0 OID 0)
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "spheroid";


--
-- TOC entry 232 (class 1255 OID 17373)
-- Dependencies: 6 1337
-- Name: spheroid_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "spheroid_in"("cstring") RETURNS "spheroid"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_in';


ALTER FUNCTION "public"."spheroid_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 233 (class 1255 OID 17374)
-- Dependencies: 6 1337
-- Name: spheroid_out("spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "spheroid_out"("spheroid") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_out';


ALTER FUNCTION "public"."spheroid_out"("spheroid") OWNER TO "postgres";

--
-- TOC entry 1336 (class 1247 OID 17372)
-- Dependencies: 6 233 232
-- Name: spheroid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE "spheroid" (
    INTERNALLENGTH = 65,
    INPUT = "spheroid_in",
    OUTPUT = "spheroid_out",
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE "public"."spheroid" OWNER TO "postgres";

--
-- TOC entry 234 (class 1255 OID 17376)
-- Dependencies: 1321 6
-- Name: _st_asgeojson(integer, "geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_asgeojson"(integer, "geometry", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asGeoJson';


ALTER FUNCTION "public"."_st_asgeojson"(integer, "geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 235 (class 1255 OID 17377)
-- Dependencies: 6 1317
-- Name: _st_asgeojson(integer, "geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_asgeojson"(integer, "geography", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_geojson';


ALTER FUNCTION "public"."_st_asgeojson"(integer, "geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 236 (class 1255 OID 17378)
-- Dependencies: 6 1321
-- Name: _st_asgml(integer, "geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_asgml"(integer, "geometry", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asGML';


ALTER FUNCTION "public"."_st_asgml"(integer, "geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 237 (class 1255 OID 17379)
-- Dependencies: 6 1317
-- Name: _st_asgml(integer, "geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_asgml"(integer, "geography", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_gml';


ALTER FUNCTION "public"."_st_asgml"(integer, "geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 238 (class 1255 OID 17380)
-- Dependencies: 6 1321
-- Name: _st_askml(integer, "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_askml"(integer, "geometry", integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asKML';


ALTER FUNCTION "public"."_st_askml"(integer, "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 239 (class 1255 OID 17381)
-- Dependencies: 1317 6
-- Name: _st_askml(integer, "geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_askml"(integer, "geography", integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_kml';


ALTER FUNCTION "public"."_st_askml"(integer, "geography", integer) OWNER TO "postgres";

--
-- TOC entry 240 (class 1255 OID 17382)
-- Dependencies: 6 1317
-- Name: _st_bestsrid("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_bestsrid"("geography") RETURNS integer
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_BestSRID($1,$1)$_$;


ALTER FUNCTION "public"."_st_bestsrid"("geography") OWNER TO "postgres";

--
-- TOC entry 241 (class 1255 OID 17383)
-- Dependencies: 1317 6 1317
-- Name: _st_bestsrid("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_bestsrid"("geography", "geography") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_bestsrid';


ALTER FUNCTION "public"."_st_bestsrid"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 242 (class 1255 OID 17384)
-- Dependencies: 1321 1321 6
-- Name: _st_buffer("geometry", double precision, "cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_buffer"("geometry", double precision, "cstring") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'buffer';


ALTER FUNCTION "public"."_st_buffer"("geometry", double precision, "cstring") OWNER TO "postgres";

--
-- TOC entry 243 (class 1255 OID 17385)
-- Dependencies: 1321 1321 6
-- Name: _st_contains("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_contains"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'contains';


ALTER FUNCTION "public"."_st_contains"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 244 (class 1255 OID 17386)
-- Dependencies: 1321 1321 6
-- Name: _st_containsproperly("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_containsproperly"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'containsproperly';


ALTER FUNCTION "public"."_st_containsproperly"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 245 (class 1255 OID 17387)
-- Dependencies: 6 1321 1321
-- Name: _st_coveredby("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_coveredby"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'coveredby';


ALTER FUNCTION "public"."_st_coveredby"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 246 (class 1255 OID 17388)
-- Dependencies: 1321 1321 6
-- Name: _st_covers("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_covers"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'covers';


ALTER FUNCTION "public"."_st_covers"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 247 (class 1255 OID 17389)
-- Dependencies: 1317 1317 6
-- Name: _st_covers("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_covers"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_covers';


ALTER FUNCTION "public"."_st_covers"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 248 (class 1255 OID 17390)
-- Dependencies: 1321 6 1321
-- Name: _st_crosses("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_crosses"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'crosses';


ALTER FUNCTION "public"."_st_crosses"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 249 (class 1255 OID 17391)
-- Dependencies: 1321 6 1321
-- Name: _st_dfullywithin("geometry", "geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_dfullywithin"("geometry", "geometry", double precision) RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dfullywithin';


ALTER FUNCTION "public"."_st_dfullywithin"("geometry", "geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 250 (class 1255 OID 17392)
-- Dependencies: 6 1317 1317
-- Name: _st_distance("geography", "geography", double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_distance"("geography", "geography", double precision, boolean) RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_distance';


ALTER FUNCTION "public"."_st_distance"("geography", "geography", double precision, boolean) OWNER TO "postgres";

--
-- TOC entry 251 (class 1255 OID 17393)
-- Dependencies: 1325 1474 1321 6
-- Name: _st_dumppoints("geometry", integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_dumppoints"("the_geom" "geometry", "cur_path" integer[]) RETURNS SETOF "geometry_dump"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
  tmp geometry_dump;
  tmp2 geometry_dump;
  nb_points integer;
  nb_geom integer;
  i integer;
  j integer;
  g geometry;
  
BEGIN
  
  RAISE DEBUG '%,%', cur_path, ST_GeometryType(the_geom);

  -- Special case (MULTI* OR GEOMETRYCOLLECTION) : iterate and return the DumpPoints of the geometries
  SELECT ST_NumGeometries(the_geom) INTO nb_geom;

  IF (nb_geom IS NOT NULL) THEN
    
    i = 1;
    FOR tmp2 IN SELECT (ST_Dump(the_geom)).* LOOP

      FOR tmp IN SELECT * FROM _ST_DumpPoints(tmp2.geom, cur_path || tmp2.path) LOOP
	    RETURN NEXT tmp;
      END LOOP;
      i = i + 1;
      
    END LOOP;

    RETURN;
  END IF;
  

  -- Special case (POLYGON) : return the points of the rings of a polygon
  IF (ST_GeometryType(the_geom) = 'ST_Polygon') THEN

    FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_ExteriorRing(the_geom), cur_path || ARRAY[1]) LOOP
      RETURN NEXT tmp;
    END LOOP;
    
    j := ST_NumInteriorRings(the_geom);
    FOR i IN 1..j LOOP
        FOR tmp IN SELECT * FROM _ST_DumpPoints(ST_InteriorRingN(the_geom, i), cur_path || ARRAY[i+1]) LOOP
          RETURN NEXT tmp;
        END LOOP;
    END LOOP;
    
    RETURN;
  END IF;

    
  -- Special case (POINT) : return the point
  IF (ST_GeometryType(the_geom) = 'ST_Point') THEN

    tmp.path = cur_path || ARRAY[1];
    tmp.geom = the_geom;

    RETURN NEXT tmp;
    RETURN;

  END IF;


  -- Use ST_NumPoints rather than ST_NPoints to have a NULL value if the_geom isn't
  -- a LINESTRING or CIRCULARSTRING.
  SELECT ST_NumPoints(the_geom) INTO nb_points;

  -- This should never happen
  IF (nb_points IS NULL) THEN
    RAISE EXCEPTION 'Unexpected error while dumping geometry %', ST_AsText(the_geom);
  END IF;

  FOR i IN 1..nb_points LOOP
    tmp.path = cur_path || ARRAY[i];
    tmp.geom := ST_PointN(the_geom, i);
    RETURN NEXT tmp;
  END LOOP;
   
END
$$;


ALTER FUNCTION "public"."_st_dumppoints"("the_geom" "geometry", "cur_path" integer[]) OWNER TO "postgres";

--
-- TOC entry 252 (class 1255 OID 17394)
-- Dependencies: 6 1321 1321
-- Name: _st_dwithin("geometry", "geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_dwithin"("geometry", "geometry", double precision) RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_dwithin';


ALTER FUNCTION "public"."_st_dwithin"("geometry", "geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 253 (class 1255 OID 17395)
-- Dependencies: 1317 6 1317
-- Name: _st_dwithin("geography", "geography", double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_dwithin"("geography", "geography", double precision, boolean) RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_dwithin';


ALTER FUNCTION "public"."_st_dwithin"("geography", "geography", double precision, boolean) OWNER TO "postgres";

--
-- TOC entry 254 (class 1255 OID 17396)
-- Dependencies: 1321 1321 6
-- Name: _st_equals("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_equals"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geomequals';


ALTER FUNCTION "public"."_st_equals"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 255 (class 1255 OID 17397)
-- Dependencies: 6 1317 1317
-- Name: _st_expand("geography", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_expand"("geography", double precision) RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_expand';


ALTER FUNCTION "public"."_st_expand"("geography", double precision) OWNER TO "postgres";

--
-- TOC entry 256 (class 1255 OID 17398)
-- Dependencies: 1321 1321 6
-- Name: _st_intersects("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_intersects"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'intersects';


ALTER FUNCTION "public"."_st_intersects"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 257 (class 1255 OID 17399)
-- Dependencies: 1321 6 1321
-- Name: _st_linecrossingdirection("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_linecrossingdirection"("geometry", "geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'ST_LineCrossingDirection';


ALTER FUNCTION "public"."_st_linecrossingdirection"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 258 (class 1255 OID 17400)
-- Dependencies: 1321 6 1321 1321
-- Name: _st_longestline("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_longestline"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longestline2d';


ALTER FUNCTION "public"."_st_longestline"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 259 (class 1255 OID 17401)
-- Dependencies: 1321 6 1321
-- Name: _st_maxdistance("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_maxdistance"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_maxdistance2d_linestring';


ALTER FUNCTION "public"."_st_maxdistance"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 260 (class 1255 OID 17402)
-- Dependencies: 1321 6 1321
-- Name: _st_orderingequals("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_orderingequals"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_same';


ALTER FUNCTION "public"."_st_orderingequals"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 261 (class 1255 OID 17403)
-- Dependencies: 1321 6 1321
-- Name: _st_overlaps("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_overlaps"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'overlaps';


ALTER FUNCTION "public"."_st_overlaps"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 262 (class 1255 OID 17404)
-- Dependencies: 1317 6 1317
-- Name: _st_pointoutside("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_pointoutside"("geography") RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_point_outside';


ALTER FUNCTION "public"."_st_pointoutside"("geography") OWNER TO "postgres";

--
-- TOC entry 263 (class 1255 OID 17405)
-- Dependencies: 1321 6 1321
-- Name: _st_touches("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_touches"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'touches';


ALTER FUNCTION "public"."_st_touches"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 264 (class 1255 OID 17406)
-- Dependencies: 1321 6 1321
-- Name: _st_within("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "_st_within"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'within';


ALTER FUNCTION "public"."_st_within"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 265 (class 1255 OID 17407)
-- Dependencies: 6 1474
-- Name: addauth("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addauth"("text") RETURNS boolean
    LANGUAGE "plpgsql"
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$;


ALTER FUNCTION "public"."addauth"("text") OWNER TO "postgres";

--
-- TOC entry 266 (class 1255 OID 17408)
-- Dependencies: 1321 6 1321
-- Name: addbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addbbox"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addBBOX';


ALTER FUNCTION "public"."addbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 267 (class 1255 OID 17409)
-- Dependencies: 6 1474
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addgeometrycolumn"(character varying, character varying, integer, character varying, integer) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."addgeometrycolumn"(character varying, character varying, integer, character varying, integer) OWNER TO "postgres";

--
-- TOC entry 268 (class 1255 OID 17410)
-- Dependencies: 6 1474
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addgeometrycolumn"(character varying, character varying, character varying, integer, character varying, integer) RETURNS "text"
    LANGUAGE "plpgsql" STABLE STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."addgeometrycolumn"(character varying, character varying, character varying, integer, character varying, integer) OWNER TO "postgres";

--
-- TOC entry 269 (class 1255 OID 17411)
-- Dependencies: 6 1474
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addgeometrycolumn"(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;

BEGIN

	-- Verify geometry type
	IF ( NOT ( (new_type = 'GEOMETRY') OR
			   (new_type = 'GEOMETRYCOLLECTION') OR
			   (new_type = 'POINT') OR
			   (new_type = 'MULTIPOINT') OR
			   (new_type = 'POLYGON') OR
			   (new_type = 'MULTIPOLYGON') OR
			   (new_type = 'LINESTRING') OR
			   (new_type = 'MULTILINESTRING') OR
			   (new_type = 'GEOMETRYCOLLECTIONM') OR
			   (new_type = 'POINTM') OR
			   (new_type = 'MULTIPOINTM') OR
			   (new_type = 'POLYGONM') OR
			   (new_type = 'MULTIPOLYGONM') OR
			   (new_type = 'LINESTRINGM') OR
			   (new_type = 'MULTILINESTRINGM') OR
			   (new_type = 'CIRCULARSTRING') OR
			   (new_type = 'CIRCULARSTRINGM') OR
			   (new_type = 'COMPOUNDCURVE') OR
			   (new_type = 'COMPOUNDCURVEM') OR
			   (new_type = 'CURVEPOLYGON') OR
			   (new_type = 'CURVEPOLYGONM') OR
			   (new_type = 'MULTICURVE') OR
			   (new_type = 'MULTICURVEM') OR
			   (new_type = 'MULTISURFACE') OR
			   (new_type = 'MULTISURFACEM')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM,
	or GEOMETRYCOLLECTIONM';
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid != -1 ) THEN
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumns() - invalid SRID';
			RETURN 'fail';
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;


	-- Add geometry column to table
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD COLUMN ' || quote_ident(column_name) ||
		' geometry ';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Delete stale record in geometry_columns (if any)
	sql := 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') ||
		' AND f_table_schema = ' ||
		quote_literal(real_schema) ||
		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add record in geometry_columns
	sql := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema,f_table_name,' ||
										  'f_geometry_column,coord_dimension,srid,type)' ||
		' VALUES (' ||
		quote_literal('') || ',' ||
		quote_literal(real_schema) || ',' ||
		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim::text || ',' ||
		new_srid::text || ',' ||
		quote_literal(new_type) || ')';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add table CHECKs
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_srid_' || column_name)
		|| ' CHECK (ST_SRID(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_dims_' || column_name)
		|| ' CHECK (ST_NDims(' || quote_ident(column_name) ||
		') = ' || new_dim::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	IF ( NOT (new_type = 'GEOMETRY')) THEN
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
			quote_ident('enforce_geotype_' || column_name) ||
			' CHECK (GeometryType(' ||
			quote_ident(column_name) || ')=' ||
			quote_literal(new_type) || ' OR (' ||
			quote_ident(column_name) || ') is null)';
		RAISE DEBUG '%', sql;
		EXECUTE sql;
	END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$_$;


ALTER FUNCTION "public"."addgeometrycolumn"(character varying, character varying, character varying, character varying, integer, character varying, integer) OWNER TO "postgres";

--
-- TOC entry 270 (class 1255 OID 17412)
-- Dependencies: 1321 1321 1321 6
-- Name: addpoint("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addpoint"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


ALTER FUNCTION "public"."addpoint"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 271 (class 1255 OID 17413)
-- Dependencies: 1321 6 1321 1321
-- Name: addpoint("geometry", "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "addpoint"("geometry", "geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


ALTER FUNCTION "public"."addpoint"("geometry", "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 272 (class 1255 OID 17414)
-- Dependencies: 1321 6 1321
-- Name: affine("geometry", double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


ALTER FUNCTION "public"."affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 273 (class 1255 OID 17415)
-- Dependencies: 1321 6 1321
-- Name: affine("geometry", double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_affine';


ALTER FUNCTION "public"."affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 274 (class 1255 OID 17416)
-- Dependencies: 6 1321
-- Name: area("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "area"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


ALTER FUNCTION "public"."area"("geometry") OWNER TO "postgres";

--
-- TOC entry 275 (class 1255 OID 17417)
-- Dependencies: 6 1321
-- Name: area2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "area2d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


ALTER FUNCTION "public"."area2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 276 (class 1255 OID 17418)
-- Dependencies: 6 1321
-- Name: asbinary("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asbinary"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


ALTER FUNCTION "public"."asbinary"("geometry") OWNER TO "postgres";

--
-- TOC entry 277 (class 1255 OID 17419)
-- Dependencies: 6 1321
-- Name: asbinary("geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asbinary"("geometry", "text") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


ALTER FUNCTION "public"."asbinary"("geometry", "text") OWNER TO "postgres";

--
-- TOC entry 278 (class 1255 OID 17420)
-- Dependencies: 6 1321
-- Name: asewkb("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asewkb"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


ALTER FUNCTION "public"."asewkb"("geometry") OWNER TO "postgres";

--
-- TOC entry 279 (class 1255 OID 17421)
-- Dependencies: 6 1321
-- Name: asewkb("geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asewkb"("geometry", "text") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


ALTER FUNCTION "public"."asewkb"("geometry", "text") OWNER TO "postgres";

--
-- TOC entry 280 (class 1255 OID 17422)
-- Dependencies: 6 1321
-- Name: asewkt("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asewkt"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asEWKT';


ALTER FUNCTION "public"."asewkt"("geometry") OWNER TO "postgres";

--
-- TOC entry 281 (class 1255 OID 17423)
-- Dependencies: 1321 6
-- Name: asgml("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asgml"("geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


ALTER FUNCTION "public"."asgml"("geometry") OWNER TO "postgres";

--
-- TOC entry 282 (class 1255 OID 17424)
-- Dependencies: 1321 6
-- Name: asgml("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "asgml"("geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


ALTER FUNCTION "public"."asgml"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 283 (class 1255 OID 17425)
-- Dependencies: 1321 6
-- Name: ashexewkb("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "ashexewkb"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION "public"."ashexewkb"("geometry") OWNER TO "postgres";

--
-- TOC entry 284 (class 1255 OID 17426)
-- Dependencies: 1321 6
-- Name: ashexewkb("geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "ashexewkb"("geometry", "text") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION "public"."ashexewkb"("geometry", "text") OWNER TO "postgres";

--
-- TOC entry 285 (class 1255 OID 17427)
-- Dependencies: 6 1321
-- Name: askml("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "askml"("geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$;


ALTER FUNCTION "public"."askml"("geometry") OWNER TO "postgres";

--
-- TOC entry 286 (class 1255 OID 17428)
-- Dependencies: 1321 6
-- Name: askml("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "askml"("geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$;


ALTER FUNCTION "public"."askml"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 287 (class 1255 OID 17429)
-- Dependencies: 6 1321
-- Name: askml(integer, "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "askml"(integer, "geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$;


ALTER FUNCTION "public"."askml"(integer, "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 288 (class 1255 OID 17430)
-- Dependencies: 6 1321
-- Name: assvg("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "assvg"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


ALTER FUNCTION "public"."assvg"("geometry") OWNER TO "postgres";

--
-- TOC entry 289 (class 1255 OID 17431)
-- Dependencies: 1321 6
-- Name: assvg("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "assvg"("geometry", integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


ALTER FUNCTION "public"."assvg"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 291 (class 1255 OID 17432)
-- Dependencies: 6 1321
-- Name: assvg("geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "assvg"("geometry", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


ALTER FUNCTION "public"."assvg"("geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 292 (class 1255 OID 17433)
-- Dependencies: 6 1321
-- Name: astext("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "astext"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asText';


ALTER FUNCTION "public"."astext"("geometry") OWNER TO "postgres";

--
-- TOC entry 293 (class 1255 OID 17434)
-- Dependencies: 1321 6 1321
-- Name: azimuth("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "azimuth"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_azimuth';


ALTER FUNCTION "public"."azimuth"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 294 (class 1255 OID 17435)
-- Dependencies: 6 1321 1474
-- Name: bdmpolyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "bdmpolyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$;


ALTER FUNCTION "public"."bdmpolyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 295 (class 1255 OID 17436)
-- Dependencies: 1474 6 1321
-- Name: bdpolyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "bdpolyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


ALTER FUNCTION "public"."bdpolyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 296 (class 1255 OID 17437)
-- Dependencies: 1321 6 1321
-- Name: boundary("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "boundary"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'boundary';


ALTER FUNCTION "public"."boundary"("geometry") OWNER TO "postgres";

--
-- TOC entry 297 (class 1255 OID 17438)
-- Dependencies: 6 1321
-- Name: box("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box"("geometry") RETURNS "box"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX';


ALTER FUNCTION "public"."box"("geometry") OWNER TO "postgres";

--
-- TOC entry 298 (class 1255 OID 17439)
-- Dependencies: 6 1305
-- Name: box("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box"("box3d") RETURNS "box"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX';


ALTER FUNCTION "public"."box"("box3d") OWNER TO "postgres";

--
-- TOC entry 299 (class 1255 OID 17440)
-- Dependencies: 1301 6 1309
-- Name: box2d("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box2d"("box3d_extent") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."box2d"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 300 (class 1255 OID 17441)
-- Dependencies: 6 1301 1321
-- Name: box2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box2d"("geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."box2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 301 (class 1255 OID 17442)
-- Dependencies: 1305 1301 6
-- Name: box2d("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box2d"("box3d") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."box2d"("box3d") OWNER TO "postgres";

--
-- TOC entry 302 (class 1255 OID 17443)
-- Dependencies: 1321 6 1305
-- Name: box3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d"("geometry") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX3D';


ALTER FUNCTION "public"."box3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 303 (class 1255 OID 17444)
-- Dependencies: 6 1305 1301
-- Name: box3d("box2d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d"("box2d") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_BOX3D';


ALTER FUNCTION "public"."box3d"("box2d") OWNER TO "postgres";

--
-- TOC entry 304 (class 1255 OID 17445)
-- Dependencies: 6 1309 1305
-- Name: box3d_extent("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3d_extent"("box3d_extent") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_to_BOX3D';


ALTER FUNCTION "public"."box3d_extent"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 305 (class 1255 OID 17446)
-- Dependencies: 1305 6
-- Name: box3dtobox("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "box3dtobox"("box3d") RETURNS "box"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT box($1)$_$;


ALTER FUNCTION "public"."box3dtobox"("box3d") OWNER TO "postgres";

--
-- TOC entry 306 (class 1255 OID 17447)
-- Dependencies: 6 1321 1321
-- Name: buffer("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "buffer"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'buffer';


ALTER FUNCTION "public"."buffer"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 307 (class 1255 OID 17448)
-- Dependencies: 6 1321 1321
-- Name: buffer("geometry", double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "buffer"("geometry", double precision, integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_Buffer($1, $2, $3)$_$;


ALTER FUNCTION "public"."buffer"("geometry", double precision, integer) OWNER TO "postgres";

--
-- TOC entry 308 (class 1255 OID 17449)
-- Dependencies: 6 1321 1321
-- Name: buildarea("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "buildarea"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_buildarea';


ALTER FUNCTION "public"."buildarea"("geometry") OWNER TO "postgres";

--
-- TOC entry 309 (class 1255 OID 17450)
-- Dependencies: 6 1321
-- Name: bytea("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "bytea"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_bytea';


ALTER FUNCTION "public"."bytea"("geometry") OWNER TO "postgres";

--
-- TOC entry 310 (class 1255 OID 17451)
-- Dependencies: 1321 6 1321
-- Name: centroid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "centroid"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'centroid';


ALTER FUNCTION "public"."centroid"("geometry") OWNER TO "postgres";

--
-- TOC entry 311 (class 1255 OID 17452)
-- Dependencies: 6
-- Name: checkauth("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "checkauth"("text", "text") RETURNS integer
    LANGUAGE "sql"
    AS $_$ SELECT CheckAuth('', $1, $2) $_$;


ALTER FUNCTION "public"."checkauth"("text", "text") OWNER TO "postgres";

--
-- TOC entry 312 (class 1255 OID 17453)
-- Dependencies: 1474 6
-- Name: checkauth("text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "checkauth"("text", "text", "text") RETURNS integer
    LANGUAGE "plpgsql"
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$;


ALTER FUNCTION "public"."checkauth"("text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 313 (class 1255 OID 17454)
-- Dependencies: 6
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "checkauthtrigger"() RETURNS "trigger"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'check_authorization';


ALTER FUNCTION "public"."checkauthtrigger"() OWNER TO "postgres";

--
-- TOC entry 314 (class 1255 OID 17455)
-- Dependencies: 1321 1321 1321 6
-- Name: collect("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "collect"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


ALTER FUNCTION "public"."collect"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 315 (class 1255 OID 17456)
-- Dependencies: 1301 1321 1301 6
-- Name: combine_bbox("box2d", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "combine_bbox"("box2d", "geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_combine';


ALTER FUNCTION "public"."combine_bbox"("box2d", "geometry") OWNER TO "postgres";

--
-- TOC entry 316 (class 1255 OID 17457)
-- Dependencies: 6 1309 1309 1321
-- Name: combine_bbox("box3d_extent", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "combine_bbox"("box3d_extent", "geometry") RETURNS "box3d_extent"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


ALTER FUNCTION "public"."combine_bbox"("box3d_extent", "geometry") OWNER TO "postgres";

--
-- TOC entry 317 (class 1255 OID 17458)
-- Dependencies: 1321 1305 6 1305
-- Name: combine_bbox("box3d", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "combine_bbox"("box3d", "geometry") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


ALTER FUNCTION "public"."combine_bbox"("box3d", "geometry") OWNER TO "postgres";

--
-- TOC entry 318 (class 1255 OID 17459)
-- Dependencies: 1313 6
-- Name: compression("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "compression"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getCompression';


ALTER FUNCTION "public"."compression"("chip") OWNER TO "postgres";

--
-- TOC entry 319 (class 1255 OID 17460)
-- Dependencies: 6 1321 1321
-- Name: contains("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "contains"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'contains';


ALTER FUNCTION "public"."contains"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 320 (class 1255 OID 17461)
-- Dependencies: 6 1321 1321
-- Name: convexhull("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "convexhull"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'convexhull';


ALTER FUNCTION "public"."convexhull"("geometry") OWNER TO "postgres";

--
-- TOC entry 321 (class 1255 OID 17462)
-- Dependencies: 6 1321 1321
-- Name: crosses("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "crosses"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'crosses';


ALTER FUNCTION "public"."crosses"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 322 (class 1255 OID 17463)
-- Dependencies: 6 1313
-- Name: datatype("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "datatype"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getDatatype';


ALTER FUNCTION "public"."datatype"("chip") OWNER TO "postgres";

--
-- TOC entry 323 (class 1255 OID 17464)
-- Dependencies: 1321 6 1321 1321
-- Name: difference("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "difference"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'difference';


ALTER FUNCTION "public"."difference"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 324 (class 1255 OID 17465)
-- Dependencies: 1321 6
-- Name: dimension("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dimension"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dimension';


ALTER FUNCTION "public"."dimension"("geometry") OWNER TO "postgres";

--
-- TOC entry 325 (class 1255 OID 17466)
-- Dependencies: 1474 6
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "disablelongtransactions"() RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$;


ALTER FUNCTION "public"."disablelongtransactions"() OWNER TO "postgres";

--
-- TOC entry 326 (class 1255 OID 17467)
-- Dependencies: 6 1321 1321
-- Name: disjoint("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "disjoint"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'disjoint';


ALTER FUNCTION "public"."disjoint"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 327 (class 1255 OID 17468)
-- Dependencies: 6 1321 1321
-- Name: distance("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "distance"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_mindistance2d';


ALTER FUNCTION "public"."distance"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 328 (class 1255 OID 17469)
-- Dependencies: 1321 6 1321
-- Name: distance_sphere("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "distance_sphere"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_sphere';


ALTER FUNCTION "public"."distance_sphere"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 329 (class 1255 OID 17470)
-- Dependencies: 1336 6 1321 1321
-- Name: distance_spheroid("geometry", "geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "distance_spheroid"("geometry", "geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_ellipsoid';


ALTER FUNCTION "public"."distance_spheroid"("geometry", "geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 330 (class 1255 OID 17471)
-- Dependencies: 1321 6 1321
-- Name: dropbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropbbox"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dropBBOX';


ALTER FUNCTION "public"."dropbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 331 (class 1255 OID 17472)
-- Dependencies: 1474 6
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropgeometrycolumn"(character varying, character varying) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."dropgeometrycolumn"(character varying, character varying) OWNER TO "postgres";

--
-- TOC entry 332 (class 1255 OID 17473)
-- Dependencies: 6 1474
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropgeometrycolumn"(character varying, character varying, character varying) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."dropgeometrycolumn"(character varying, character varying, character varying) OWNER TO "postgres";

--
-- TOC entry 333 (class 1255 OID 17474)
-- Dependencies: 6 1474
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropgeometrycolumn"(character varying, character varying, character varying, character varying) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP;
	IF (okay <> 't') THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);

	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';

END;
$_$;


ALTER FUNCTION "public"."dropgeometrycolumn"(character varying, character varying, character varying, character varying) OWNER TO "postgres";

--
-- TOC entry 334 (class 1255 OID 17475)
-- Dependencies: 6
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropgeometrytable"(character varying) RETURNS "text"
    LANGUAGE "sql" STRICT
    AS $_$ SELECT DropGeometryTable('','',$1) $_$;


ALTER FUNCTION "public"."dropgeometrytable"(character varying) OWNER TO "postgres";

--
-- TOC entry 335 (class 1255 OID 17476)
-- Dependencies: 6
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropgeometrytable"(character varying, character varying) RETURNS "text"
    LANGUAGE "sql" STRICT
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$;


ALTER FUNCTION "public"."dropgeometrytable"(character varying, character varying) OWNER TO "postgres";

--
-- TOC entry 336 (class 1255 OID 17477)
-- Dependencies: 6 1474
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dropgeometrytable"(character varying, character varying, character varying) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||
		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||
		' f_table_name = ' || quote_literal(table_name);

	-- Remove table
	EXECUTE 'DROP TABLE '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name);

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';

END;
$_$;


ALTER FUNCTION "public"."dropgeometrytable"(character varying, character varying, character varying) OWNER TO "postgres";

--
-- TOC entry 337 (class 1255 OID 17478)
-- Dependencies: 1325 6 1321
-- Name: dump("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dump"("geometry") RETURNS SETOF "geometry_dump"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump';


ALTER FUNCTION "public"."dump"("geometry") OWNER TO "postgres";

--
-- TOC entry 338 (class 1255 OID 17479)
-- Dependencies: 1325 6 1321
-- Name: dumprings("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "dumprings"("geometry") RETURNS SETOF "geometry_dump"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump_rings';


ALTER FUNCTION "public"."dumprings"("geometry") OWNER TO "postgres";

--
-- TOC entry 339 (class 1255 OID 17480)
-- Dependencies: 1474 6
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "enablelongtransactions"() RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$;


ALTER FUNCTION "public"."enablelongtransactions"() OWNER TO "postgres";

--
-- TOC entry 340 (class 1255 OID 17481)
-- Dependencies: 6 1321 1321
-- Name: endpoint("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "endpoint"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_endpoint_linestring';


ALTER FUNCTION "public"."endpoint"("geometry") OWNER TO "postgres";

--
-- TOC entry 341 (class 1255 OID 17482)
-- Dependencies: 1321 6 1321
-- Name: envelope("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "envelope"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_envelope';


ALTER FUNCTION "public"."envelope"("geometry") OWNER TO "postgres";

--
-- TOC entry 342 (class 1255 OID 17483)
-- Dependencies: 1321 1321 6
-- Name: equals("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "equals"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomequals';


ALTER FUNCTION "public"."equals"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 343 (class 1255 OID 17484)
-- Dependencies: 1301 6
-- Name: estimated_extent("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "estimated_extent"("text", "text") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


ALTER FUNCTION "public"."estimated_extent"("text", "text") OWNER TO "postgres";

--
-- TOC entry 344 (class 1255 OID 17485)
-- Dependencies: 6 1301
-- Name: estimated_extent("text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "estimated_extent"("text", "text", "text") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


ALTER FUNCTION "public"."estimated_extent"("text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 345 (class 1255 OID 17486)
-- Dependencies: 6 1305 1305
-- Name: expand("box3d", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "expand"("box3d", double precision) RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_expand';


ALTER FUNCTION "public"."expand"("box3d", double precision) OWNER TO "postgres";

--
-- TOC entry 346 (class 1255 OID 17487)
-- Dependencies: 6 1301 1301
-- Name: expand("box2d", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "expand"("box2d", double precision) RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_expand';


ALTER FUNCTION "public"."expand"("box2d", double precision) OWNER TO "postgres";

--
-- TOC entry 347 (class 1255 OID 17488)
-- Dependencies: 6 1321 1321
-- Name: expand("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "expand"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_expand';


ALTER FUNCTION "public"."expand"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 348 (class 1255 OID 17489)
-- Dependencies: 1321 6 1321
-- Name: exteriorring("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "exteriorring"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_exteriorring_polygon';


ALTER FUNCTION "public"."exteriorring"("geometry") OWNER TO "postgres";

--
-- TOC entry 349 (class 1255 OID 17490)
-- Dependencies: 1313 6
-- Name: factor("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "factor"("chip") RETURNS real
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getFactor';


ALTER FUNCTION "public"."factor"("chip") OWNER TO "postgres";

--
-- TOC entry 350 (class 1255 OID 17491)
-- Dependencies: 1474 6 1301
-- Name: find_extent("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "find_extent"("text", "text") RETURNS "box2d"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION "public"."find_extent"("text", "text") OWNER TO "postgres";

--
-- TOC entry 351 (class 1255 OID 17492)
-- Dependencies: 6 1474 1301
-- Name: find_extent("text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "find_extent"("text", "text", "text") RETURNS "box2d"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION "public"."find_extent"("text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 352 (class 1255 OID 17493)
-- Dependencies: 1474 6
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "find_srid"(character varying, character varying, character varying) RETURNS integer
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$;


ALTER FUNCTION "public"."find_srid"(character varying, character varying, character varying) OWNER TO "postgres";

--
-- TOC entry 353 (class 1255 OID 17494)
-- Dependencies: 6 1474
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "fix_geometry_columns"() RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
			WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
			OR f_table_schema NOT IN (
					SELECT nspname::varchar
					FROM pg_namespace nn, pg_class cc, pg_attribute aa
					WHERE cc.relnamespace = nn.oid
					AND cc.relname = f_table_name::name
					AND aa.attrelid = cc.oid
					AND aa.attname = f_geometry_column::name))
			AND f_table_name::name = c.relname
			AND c.oid = a.attrelid
			AND c.relnamespace = n.oid
			AND f_geometry_column::name = a.attname

			AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid(% = %)'
			AND sridcheck.consrc ~ textcat(' = ', srid::text)

			AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
			AND typecheck.consrc ~ textcat(' = ''', type::text)

			AND NOT EXISTS (
					SELECT oid FROM geometry_columns gc
					WHERE c.relname::varchar = gc.f_table_name
					AND n.nspname::varchar = gc.f_table_schema
					AND a.attname::varchar = gc.f_geometry_column
			);

	GET DIAGNOSTICS foundschema = ROW_COUNT;

	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;

END;
$$;


ALTER FUNCTION "public"."fix_geometry_columns"() OWNER TO "postgres";

--
-- TOC entry 354 (class 1255 OID 17495)
-- Dependencies: 1321 6 1321
-- Name: force_2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "force_2d"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_2d';


ALTER FUNCTION "public"."force_2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 355 (class 1255 OID 17496)
-- Dependencies: 1321 6 1321
-- Name: force_3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "force_3d"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


ALTER FUNCTION "public"."force_3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 356 (class 1255 OID 17497)
-- Dependencies: 1321 6 1321
-- Name: force_3dm("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "force_3dm"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dm';


ALTER FUNCTION "public"."force_3dm"("geometry") OWNER TO "postgres";

--
-- TOC entry 357 (class 1255 OID 17498)
-- Dependencies: 1321 6 1321
-- Name: force_3dz("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "force_3dz"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


ALTER FUNCTION "public"."force_3dz"("geometry") OWNER TO "postgres";

--
-- TOC entry 358 (class 1255 OID 17499)
-- Dependencies: 6 1321 1321
-- Name: force_4d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "force_4d"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_4d';


ALTER FUNCTION "public"."force_4d"("geometry") OWNER TO "postgres";

--
-- TOC entry 359 (class 1255 OID 17500)
-- Dependencies: 6 1321 1321
-- Name: force_collection("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "force_collection"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_collection';


ALTER FUNCTION "public"."force_collection"("geometry") OWNER TO "postgres";

--
-- TOC entry 360 (class 1255 OID 17501)
-- Dependencies: 6 1321 1321
-- Name: forcerhr("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "forcerhr"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_forceRHR_poly';


ALTER FUNCTION "public"."forcerhr"("geometry") OWNER TO "postgres";

--
-- TOC entry 361 (class 1255 OID 17502)
-- Dependencies: 1321 6 1317
-- Name: geography("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography"("geometry") RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_geometry';


ALTER FUNCTION "public"."geography"("geometry") OWNER TO "postgres";

--
-- TOC entry 362 (class 1255 OID 17503)
-- Dependencies: 6 1317 1317
-- Name: geography("geography", integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography"("geography", integer, boolean) RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_enforce_typmod';


ALTER FUNCTION "public"."geography"("geography", integer, boolean) OWNER TO "postgres";

--
-- TOC entry 363 (class 1255 OID 17504)
-- Dependencies: 6 1317 1317
-- Name: geography_cmp("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_cmp"("geography", "geography") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_cmp';


ALTER FUNCTION "public"."geography_cmp"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 364 (class 1255 OID 17505)
-- Dependencies: 1317 6 1317
-- Name: geography_eq("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_eq"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_eq';


ALTER FUNCTION "public"."geography_eq"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 365 (class 1255 OID 17506)
-- Dependencies: 6 1317 1317
-- Name: geography_ge("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_ge"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_ge';


ALTER FUNCTION "public"."geography_ge"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 366 (class 1255 OID 17507)
-- Dependencies: 6
-- Name: geography_gist_compress("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_compress"("internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_compress';


ALTER FUNCTION "public"."geography_gist_compress"("internal") OWNER TO "postgres";

--
-- TOC entry 367 (class 1255 OID 17508)
-- Dependencies: 1321 6
-- Name: geography_gist_consistent("internal", "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_consistent"("internal", "geometry", integer) RETURNS boolean
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_consistent';


ALTER FUNCTION "public"."geography_gist_consistent"("internal", "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 368 (class 1255 OID 17509)
-- Dependencies: 6
-- Name: geography_gist_decompress("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_decompress"("internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_decompress';


ALTER FUNCTION "public"."geography_gist_decompress"("internal") OWNER TO "postgres";

--
-- TOC entry 369 (class 1255 OID 17510)
-- Dependencies: 6
-- Name: geography_gist_join_selectivity("internal", "oid", "internal", smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_join_selectivity"("internal", "oid", "internal", smallint) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_join_selectivity';


ALTER FUNCTION "public"."geography_gist_join_selectivity"("internal", "oid", "internal", smallint) OWNER TO "postgres";

--
-- TOC entry 370 (class 1255 OID 17511)
-- Dependencies: 6
-- Name: geography_gist_penalty("internal", "internal", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_penalty"("internal", "internal", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_penalty';


ALTER FUNCTION "public"."geography_gist_penalty"("internal", "internal", "internal") OWNER TO "postgres";

--
-- TOC entry 371 (class 1255 OID 17512)
-- Dependencies: 6
-- Name: geography_gist_picksplit("internal", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_picksplit"("internal", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_picksplit';


ALTER FUNCTION "public"."geography_gist_picksplit"("internal", "internal") OWNER TO "postgres";

--
-- TOC entry 372 (class 1255 OID 17513)
-- Dependencies: 1301 1301 6
-- Name: geography_gist_same("box2d", "box2d", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_same"("box2d", "box2d", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_same';


ALTER FUNCTION "public"."geography_gist_same"("box2d", "box2d", "internal") OWNER TO "postgres";

--
-- TOC entry 373 (class 1255 OID 17514)
-- Dependencies: 6
-- Name: geography_gist_selectivity("internal", "oid", "internal", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_selectivity"("internal", "oid", "internal", integer) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_selectivity';


ALTER FUNCTION "public"."geography_gist_selectivity"("internal", "oid", "internal", integer) OWNER TO "postgres";

--
-- TOC entry 374 (class 1255 OID 17515)
-- Dependencies: 6
-- Name: geography_gist_union("bytea", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gist_union"("bytea", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'geography_gist_union';


ALTER FUNCTION "public"."geography_gist_union"("bytea", "internal") OWNER TO "postgres";

--
-- TOC entry 375 (class 1255 OID 17516)
-- Dependencies: 1317 6 1317
-- Name: geography_gt("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_gt"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_gt';


ALTER FUNCTION "public"."geography_gt"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 376 (class 1255 OID 17517)
-- Dependencies: 1317 1317 6
-- Name: geography_le("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_le"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_le';


ALTER FUNCTION "public"."geography_le"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 377 (class 1255 OID 17518)
-- Dependencies: 1317 1317 6
-- Name: geography_lt("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_lt"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_lt';


ALTER FUNCTION "public"."geography_lt"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 378 (class 1255 OID 17519)
-- Dependencies: 1317 6 1317
-- Name: geography_overlaps("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_overlaps"("geography", "geography") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_overlaps';


ALTER FUNCTION "public"."geography_overlaps"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 379 (class 1255 OID 17520)
-- Dependencies: 6
-- Name: geography_typmod_dims(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_typmod_dims"(integer) RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_dims';


ALTER FUNCTION "public"."geography_typmod_dims"(integer) OWNER TO "postgres";

--
-- TOC entry 380 (class 1255 OID 17521)
-- Dependencies: 6
-- Name: geography_typmod_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_typmod_srid"(integer) RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_srid';


ALTER FUNCTION "public"."geography_typmod_srid"(integer) OWNER TO "postgres";

--
-- TOC entry 381 (class 1255 OID 17522)
-- Dependencies: 6
-- Name: geography_typmod_type(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geography_typmod_type"(integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_typmod_type';


ALTER FUNCTION "public"."geography_typmod_type"(integer) OWNER TO "postgres";

--
-- TOC entry 382 (class 1255 OID 17523)
-- Dependencies: 1321 6
-- Name: geomcollfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomcollfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."geomcollfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 383 (class 1255 OID 17524)
-- Dependencies: 1321 6
-- Name: geomcollfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomcollfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."geomcollfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 384 (class 1255 OID 17525)
-- Dependencies: 6 1321
-- Name: geomcollfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomcollfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."geomcollfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 385 (class 1255 OID 17526)
-- Dependencies: 6 1321
-- Name: geomcollfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomcollfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."geomcollfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 386 (class 1255 OID 17527)
-- Dependencies: 1321 1309 6
-- Name: geometry("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("box3d_extent") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


ALTER FUNCTION "public"."geometry"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 387 (class 1255 OID 17528)
-- Dependencies: 6 1321 1301
-- Name: geometry("box2d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("box2d") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_LWGEOM';


ALTER FUNCTION "public"."geometry"("box2d") OWNER TO "postgres";

--
-- TOC entry 388 (class 1255 OID 17529)
-- Dependencies: 6 1305 1321
-- Name: geometry("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("box3d") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


ALTER FUNCTION "public"."geometry"("box3d") OWNER TO "postgres";

--
-- TOC entry 389 (class 1255 OID 17530)
-- Dependencies: 1321 6
-- Name: geometry("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


ALTER FUNCTION "public"."geometry"("text") OWNER TO "postgres";

--
-- TOC entry 390 (class 1255 OID 17531)
-- Dependencies: 1321 6 1313
-- Name: geometry("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("chip") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_to_LWGEOM';


ALTER FUNCTION "public"."geometry"("chip") OWNER TO "postgres";

--
-- TOC entry 391 (class 1255 OID 17532)
-- Dependencies: 6 1321
-- Name: geometry("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_bytea';


ALTER FUNCTION "public"."geometry"("bytea") OWNER TO "postgres";

--
-- TOC entry 392 (class 1255 OID 17533)
-- Dependencies: 1321 1317 6
-- Name: geometry("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry"("geography") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geometry_from_geography';


ALTER FUNCTION "public"."geometry"("geography") OWNER TO "postgres";

--
-- TOC entry 393 (class 1255 OID 17534)
-- Dependencies: 1321 1321 6
-- Name: geometry_above("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_above"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_above';


ALTER FUNCTION "public"."geometry_above"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 394 (class 1255 OID 17535)
-- Dependencies: 1321 1321 6
-- Name: geometry_below("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_below"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_below';


ALTER FUNCTION "public"."geometry_below"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 395 (class 1255 OID 17536)
-- Dependencies: 1321 1321 6
-- Name: geometry_cmp("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_cmp"("geometry", "geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_cmp';


ALTER FUNCTION "public"."geometry_cmp"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 396 (class 1255 OID 17537)
-- Dependencies: 1321 1321 6
-- Name: geometry_contain("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_contain"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contain';


ALTER FUNCTION "public"."geometry_contain"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 397 (class 1255 OID 17538)
-- Dependencies: 6 1321 1321
-- Name: geometry_contained("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_contained"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contained';


ALTER FUNCTION "public"."geometry_contained"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 398 (class 1255 OID 17539)
-- Dependencies: 6 1321 1321
-- Name: geometry_eq("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_eq"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_eq';


ALTER FUNCTION "public"."geometry_eq"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 399 (class 1255 OID 17540)
-- Dependencies: 1321 6 1321
-- Name: geometry_ge("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_ge"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_ge';


ALTER FUNCTION "public"."geometry_ge"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 400 (class 1255 OID 17541)
-- Dependencies: 6
-- Name: geometry_gist_joinsel("internal", "oid", "internal", smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_gist_joinsel"("internal", "oid", "internal", smallint) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


ALTER FUNCTION "public"."geometry_gist_joinsel"("internal", "oid", "internal", smallint) OWNER TO "postgres";

--
-- TOC entry 401 (class 1255 OID 17542)
-- Dependencies: 6
-- Name: geometry_gist_sel("internal", "oid", "internal", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_gist_sel"("internal", "oid", "internal", integer) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


ALTER FUNCTION "public"."geometry_gist_sel"("internal", "oid", "internal", integer) OWNER TO "postgres";

--
-- TOC entry 402 (class 1255 OID 17543)
-- Dependencies: 1321 1321 6
-- Name: geometry_gt("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_gt"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_gt';


ALTER FUNCTION "public"."geometry_gt"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 403 (class 1255 OID 17544)
-- Dependencies: 1321 6 1321
-- Name: geometry_le("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_le"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_le';


ALTER FUNCTION "public"."geometry_le"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 404 (class 1255 OID 17545)
-- Dependencies: 6 1321 1321
-- Name: geometry_left("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_left"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_left';


ALTER FUNCTION "public"."geometry_left"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 405 (class 1255 OID 17546)
-- Dependencies: 1321 1321 6
-- Name: geometry_lt("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_lt"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_lt';


ALTER FUNCTION "public"."geometry_lt"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 406 (class 1255 OID 17547)
-- Dependencies: 6 1321 1321
-- Name: geometry_overabove("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_overabove"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overabove';


ALTER FUNCTION "public"."geometry_overabove"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 407 (class 1255 OID 17548)
-- Dependencies: 6 1321 1321
-- Name: geometry_overbelow("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_overbelow"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overbelow';


ALTER FUNCTION "public"."geometry_overbelow"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 408 (class 1255 OID 17549)
-- Dependencies: 1321 6 1321
-- Name: geometry_overlap("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_overlap"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overlap';


ALTER FUNCTION "public"."geometry_overlap"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 409 (class 1255 OID 17550)
-- Dependencies: 6 1321 1321
-- Name: geometry_overleft("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_overleft"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overleft';


ALTER FUNCTION "public"."geometry_overleft"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 410 (class 1255 OID 17551)
-- Dependencies: 1321 1321 6
-- Name: geometry_overright("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_overright"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overright';


ALTER FUNCTION "public"."geometry_overright"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 411 (class 1255 OID 17552)
-- Dependencies: 1321 6 1321
-- Name: geometry_right("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_right"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_right';


ALTER FUNCTION "public"."geometry_right"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 412 (class 1255 OID 17553)
-- Dependencies: 6 1321 1321
-- Name: geometry_same("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_same"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_samebox';


ALTER FUNCTION "public"."geometry_same"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 413 (class 1255 OID 17554)
-- Dependencies: 1321 1321 6
-- Name: geometry_samebox("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometry_samebox"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_samebox';


ALTER FUNCTION "public"."geometry_samebox"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 414 (class 1255 OID 17555)
-- Dependencies: 6 1321
-- Name: geometryfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometryfromtext"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."geometryfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 415 (class 1255 OID 17556)
-- Dependencies: 1321 6
-- Name: geometryfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometryfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."geometryfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 416 (class 1255 OID 17557)
-- Dependencies: 1321 6 1321
-- Name: geometryn("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometryn"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_geometryn_collection';


ALTER FUNCTION "public"."geometryn"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 417 (class 1255 OID 17558)
-- Dependencies: 6 1321
-- Name: geometrytype("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geometrytype"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getTYPE';


ALTER FUNCTION "public"."geometrytype"("geometry") OWNER TO "postgres";

--
-- TOC entry 418 (class 1255 OID 17559)
-- Dependencies: 1321 6
-- Name: geomfromewkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomfromewkb"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOMFromWKB';


ALTER FUNCTION "public"."geomfromewkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 419 (class 1255 OID 17560)
-- Dependencies: 6 1321
-- Name: geomfromewkt("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomfromewkt"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


ALTER FUNCTION "public"."geomfromewkt"("text") OWNER TO "postgres";

--
-- TOC entry 420 (class 1255 OID 17561)
-- Dependencies: 6 1321
-- Name: geomfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1)$_$;


ALTER FUNCTION "public"."geomfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 421 (class 1255 OID 17562)
-- Dependencies: 6 1321
-- Name: geomfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT geometryfromtext($1, $2)$_$;


ALTER FUNCTION "public"."geomfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 422 (class 1255 OID 17563)
-- Dependencies: 6 1321
-- Name: geomfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


ALTER FUNCTION "public"."geomfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 423 (class 1255 OID 17564)
-- Dependencies: 6 1321
-- Name: geomfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$;


ALTER FUNCTION "public"."geomfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 424 (class 1255 OID 17565)
-- Dependencies: 1321 6 1321 1321
-- Name: geomunion("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "geomunion"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomunion';


ALTER FUNCTION "public"."geomunion"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 425 (class 1255 OID 17566)
-- Dependencies: 6 1474
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "get_proj4_from_srid"(integer) RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$;


ALTER FUNCTION "public"."get_proj4_from_srid"(integer) OWNER TO "postgres";

--
-- TOC entry 426 (class 1255 OID 17567)
-- Dependencies: 6 1301 1321
-- Name: getbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "getbbox"("geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."getbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 427 (class 1255 OID 17568)
-- Dependencies: 6 1321
-- Name: getsrid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "getsrid"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


ALTER FUNCTION "public"."getsrid"("geometry") OWNER TO "postgres";

--
-- TOC entry 428 (class 1255 OID 17569)
-- Dependencies: 6
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "gettransactionid"() RETURNS "xid"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'getTransactionID';


ALTER FUNCTION "public"."gettransactionid"() OWNER TO "postgres";

--
-- TOC entry 429 (class 1255 OID 17570)
-- Dependencies: 6 1321
-- Name: hasbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "hasbbox"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasBBOX';


ALTER FUNCTION "public"."hasbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 430 (class 1255 OID 17571)
-- Dependencies: 6 1313
-- Name: height("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "height"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getHeight';


ALTER FUNCTION "public"."height"("chip") OWNER TO "postgres";

--
-- TOC entry 431 (class 1255 OID 17572)
-- Dependencies: 6 1321 1321
-- Name: interiorringn("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "interiorringn"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_interiorringn_polygon';


ALTER FUNCTION "public"."interiorringn"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 432 (class 1255 OID 17573)
-- Dependencies: 6 1321 1321 1321
-- Name: intersection("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "intersection"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersection';


ALTER FUNCTION "public"."intersection"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 433 (class 1255 OID 17574)
-- Dependencies: 6 1321 1321
-- Name: intersects("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "intersects"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'intersects';


ALTER FUNCTION "public"."intersects"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 434 (class 1255 OID 17575)
-- Dependencies: 1321 6
-- Name: isclosed("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "isclosed"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isclosed_linestring';


ALTER FUNCTION "public"."isclosed"("geometry") OWNER TO "postgres";

--
-- TOC entry 435 (class 1255 OID 17576)
-- Dependencies: 6 1321
-- Name: isempty("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "isempty"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isempty';


ALTER FUNCTION "public"."isempty"("geometry") OWNER TO "postgres";

--
-- TOC entry 436 (class 1255 OID 17577)
-- Dependencies: 6 1321
-- Name: isring("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "isring"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isring';


ALTER FUNCTION "public"."isring"("geometry") OWNER TO "postgres";

--
-- TOC entry 437 (class 1255 OID 17578)
-- Dependencies: 6 1321
-- Name: issimple("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "issimple"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'issimple';


ALTER FUNCTION "public"."issimple"("geometry") OWNER TO "postgres";

--
-- TOC entry 438 (class 1255 OID 17579)
-- Dependencies: 6 1321
-- Name: isvalid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "isvalid"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'isvalid';


ALTER FUNCTION "public"."isvalid"("geometry") OWNER TO "postgres";

--
-- TOC entry 439 (class 1255 OID 17580)
-- Dependencies: 6 1321
-- Name: length("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "length"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


ALTER FUNCTION "public"."length"("geometry") OWNER TO "postgres";

--
-- TOC entry 440 (class 1255 OID 17581)
-- Dependencies: 6 1321
-- Name: length2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "length2d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


ALTER FUNCTION "public"."length2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 441 (class 1255 OID 17582)
-- Dependencies: 6 1321 1336
-- Name: length2d_spheroid("geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "length2d_spheroid"("geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_ellipsoid';


ALTER FUNCTION "public"."length2d_spheroid"("geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 442 (class 1255 OID 17583)
-- Dependencies: 6 1321
-- Name: length3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "length3d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


ALTER FUNCTION "public"."length3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 443 (class 1255 OID 17584)
-- Dependencies: 6 1321 1336
-- Name: length3d_spheroid("geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "length3d_spheroid"("geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION "public"."length3d_spheroid"("geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 444 (class 1255 OID 17585)
-- Dependencies: 6 1321 1336
-- Name: length_spheroid("geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "length_spheroid"("geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION "public"."length_spheroid"("geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 445 (class 1255 OID 17586)
-- Dependencies: 6 1321 1321
-- Name: line_interpolate_point("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "line_interpolate_point"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_interpolate_point';


ALTER FUNCTION "public"."line_interpolate_point"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 446 (class 1255 OID 17587)
-- Dependencies: 6 1321 1321
-- Name: line_locate_point("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "line_locate_point"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_locate_point';


ALTER FUNCTION "public"."line_locate_point"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 447 (class 1255 OID 17588)
-- Dependencies: 6 1321 1321
-- Name: line_substring("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "line_substring"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_substring';


ALTER FUNCTION "public"."line_substring"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 448 (class 1255 OID 17589)
-- Dependencies: 6 1321 1321
-- Name: linefrommultipoint("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linefrommultipoint"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_from_mpoint';


ALTER FUNCTION "public"."linefrommultipoint"("geometry") OWNER TO "postgres";

--
-- TOC entry 449 (class 1255 OID 17590)
-- Dependencies: 6 1321
-- Name: linefromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linefromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."linefromtext"("text") OWNER TO "postgres";

--
-- TOC entry 450 (class 1255 OID 17591)
-- Dependencies: 6 1321
-- Name: linefromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linefromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."linefromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 451 (class 1255 OID 17592)
-- Dependencies: 6 1321
-- Name: linefromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linefromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."linefromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 452 (class 1255 OID 17593)
-- Dependencies: 6 1321
-- Name: linefromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linefromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."linefromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 453 (class 1255 OID 17594)
-- Dependencies: 6 1321 1321
-- Name: linemerge("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linemerge"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'linemerge';


ALTER FUNCTION "public"."linemerge"("geometry") OWNER TO "postgres";

--
-- TOC entry 454 (class 1255 OID 17595)
-- Dependencies: 6 1321
-- Name: linestringfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linestringfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1)$_$;


ALTER FUNCTION "public"."linestringfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 455 (class 1255 OID 17596)
-- Dependencies: 1321 6
-- Name: linestringfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linestringfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT LineFromText($1, $2)$_$;


ALTER FUNCTION "public"."linestringfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 456 (class 1255 OID 17597)
-- Dependencies: 6 1321
-- Name: linestringfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linestringfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."linestringfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 457 (class 1255 OID 17598)
-- Dependencies: 6 1321
-- Name: linestringfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "linestringfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."linestringfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 458 (class 1255 OID 17599)
-- Dependencies: 6 1321 1321
-- Name: locate_along_measure("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "locate_along_measure"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


ALTER FUNCTION "public"."locate_along_measure"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 459 (class 1255 OID 17600)
-- Dependencies: 6 1321 1321
-- Name: locate_between_measures("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "locate_between_measures"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


ALTER FUNCTION "public"."locate_between_measures"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 460 (class 1255 OID 17601)
-- Dependencies: 6
-- Name: lockrow("text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lockrow"("text", "text", "text") RETURNS integer
    LANGUAGE "sql" STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$;


ALTER FUNCTION "public"."lockrow"("text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 461 (class 1255 OID 17602)
-- Dependencies: 6
-- Name: lockrow("text", "text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lockrow"("text", "text", "text", "text") RETURNS integer
    LANGUAGE "sql" STRICT
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$;


ALTER FUNCTION "public"."lockrow"("text", "text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 462 (class 1255 OID 17603)
-- Dependencies: 6
-- Name: lockrow("text", "text", "text", timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lockrow"("text", "text", "text", timestamp without time zone) RETURNS integer
    LANGUAGE "sql" STRICT
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$;


ALTER FUNCTION "public"."lockrow"("text", "text", "text", timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 463 (class 1255 OID 17604)
-- Dependencies: 6 1474
-- Name: lockrow("text", "text", "text", "text", timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lockrow"("text", "text", "text", "text", timestamp without time zone) RETURNS integer
    LANGUAGE "plpgsql" STRICT
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."lockrow"("text", "text", "text", "text", timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 464 (class 1255 OID 17605)
-- Dependencies: 6 1474
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "longtransactionsenabled"() RETURNS boolean
    LANGUAGE "plpgsql"
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$;


ALTER FUNCTION "public"."longtransactionsenabled"() OWNER TO "postgres";

--
-- TOC entry 465 (class 1255 OID 17606)
-- Dependencies: 6
-- Name: lwgeom_gist_compress("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_compress"("internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_compress';


ALTER FUNCTION "public"."lwgeom_gist_compress"("internal") OWNER TO "postgres";

--
-- TOC entry 466 (class 1255 OID 17607)
-- Dependencies: 6 1321
-- Name: lwgeom_gist_consistent("internal", "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_consistent"("internal", "geometry", integer) RETURNS boolean
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_consistent';


ALTER FUNCTION "public"."lwgeom_gist_consistent"("internal", "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 467 (class 1255 OID 17608)
-- Dependencies: 6
-- Name: lwgeom_gist_decompress("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_decompress"("internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_decompress';


ALTER FUNCTION "public"."lwgeom_gist_decompress"("internal") OWNER TO "postgres";

--
-- TOC entry 468 (class 1255 OID 17609)
-- Dependencies: 6
-- Name: lwgeom_gist_penalty("internal", "internal", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_penalty"("internal", "internal", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_penalty';


ALTER FUNCTION "public"."lwgeom_gist_penalty"("internal", "internal", "internal") OWNER TO "postgres";

--
-- TOC entry 469 (class 1255 OID 17610)
-- Dependencies: 6
-- Name: lwgeom_gist_picksplit("internal", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_picksplit"("internal", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_picksplit';


ALTER FUNCTION "public"."lwgeom_gist_picksplit"("internal", "internal") OWNER TO "postgres";

--
-- TOC entry 470 (class 1255 OID 17611)
-- Dependencies: 6 1301 1301
-- Name: lwgeom_gist_same("box2d", "box2d", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_same"("box2d", "box2d", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_same';


ALTER FUNCTION "public"."lwgeom_gist_same"("box2d", "box2d", "internal") OWNER TO "postgres";

--
-- TOC entry 471 (class 1255 OID 17612)
-- Dependencies: 6
-- Name: lwgeom_gist_union("bytea", "internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "lwgeom_gist_union"("bytea", "internal") RETURNS "internal"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_union';


ALTER FUNCTION "public"."lwgeom_gist_union"("bytea", "internal") OWNER TO "postgres";

--
-- TOC entry 472 (class 1255 OID 17613)
-- Dependencies: 6 1321
-- Name: m("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "m"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


ALTER FUNCTION "public"."m"("geometry") OWNER TO "postgres";

--
-- TOC entry 473 (class 1255 OID 17614)
-- Dependencies: 6 1301 1321 1321
-- Name: makebox2d("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makebox2d"("geometry", "geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_construct';


ALTER FUNCTION "public"."makebox2d"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 474 (class 1255 OID 17615)
-- Dependencies: 6 1305 1321 1321
-- Name: makebox3d("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makebox3d"("geometry", "geometry") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_construct';


ALTER FUNCTION "public"."makebox3d"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 475 (class 1255 OID 17616)
-- Dependencies: 6 1321 1321 1321
-- Name: makeline("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makeline"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline';


ALTER FUNCTION "public"."makeline"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 476 (class 1255 OID 17617)
-- Dependencies: 6 1321 1323
-- Name: makeline_garray("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makeline_garray"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


ALTER FUNCTION "public"."makeline_garray"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 477 (class 1255 OID 17618)
-- Dependencies: 6 1321
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makepoint"(double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."makepoint"(double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 478 (class 1255 OID 17619)
-- Dependencies: 6 1321
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makepoint"(double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."makepoint"(double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 479 (class 1255 OID 17620)
-- Dependencies: 6 1321
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makepoint"(double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."makepoint"(double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 480 (class 1255 OID 17621)
-- Dependencies: 6 1321
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makepointm"(double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint3dm';


ALTER FUNCTION "public"."makepointm"(double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 481 (class 1255 OID 17622)
-- Dependencies: 6 1321 1321
-- Name: makepolygon("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makepolygon"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


ALTER FUNCTION "public"."makepolygon"("geometry") OWNER TO "postgres";

--
-- TOC entry 482 (class 1255 OID 17623)
-- Dependencies: 6 1321 1321 1323
-- Name: makepolygon("geometry", "geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "makepolygon"("geometry", "geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


ALTER FUNCTION "public"."makepolygon"("geometry", "geometry"[]) OWNER TO "postgres";

--
-- TOC entry 483 (class 1255 OID 17624)
-- Dependencies: 6 1321 1321
-- Name: max_distance("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "max_distance"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_maxdistance2d_linestring';


ALTER FUNCTION "public"."max_distance"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 484 (class 1255 OID 17625)
-- Dependencies: 6 1321
-- Name: mem_size("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mem_size"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mem_size';


ALTER FUNCTION "public"."mem_size"("geometry") OWNER TO "postgres";

--
-- TOC entry 485 (class 1255 OID 17626)
-- Dependencies: 6 1321
-- Name: mlinefromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mlinefromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mlinefromtext"("text") OWNER TO "postgres";

--
-- TOC entry 486 (class 1255 OID 17627)
-- Dependencies: 6 1321
-- Name: mlinefromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mlinefromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mlinefromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 487 (class 1255 OID 17628)
-- Dependencies: 6 1321
-- Name: mlinefromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mlinefromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mlinefromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 488 (class 1255 OID 17629)
-- Dependencies: 6 1321
-- Name: mlinefromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mlinefromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mlinefromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 489 (class 1255 OID 17630)
-- Dependencies: 6 1321
-- Name: mpointfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpointfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpointfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 490 (class 1255 OID 17631)
-- Dependencies: 6 1321
-- Name: mpointfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpointfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpointfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 491 (class 1255 OID 17632)
-- Dependencies: 6 1321
-- Name: mpointfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpointfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpointfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 492 (class 1255 OID 17633)
-- Dependencies: 6 1321
-- Name: mpointfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpointfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpointfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 493 (class 1255 OID 17634)
-- Dependencies: 6 1321
-- Name: mpolyfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpolyfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpolyfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 494 (class 1255 OID 17635)
-- Dependencies: 6 1321
-- Name: mpolyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpolyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpolyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 495 (class 1255 OID 17636)
-- Dependencies: 6 1321
-- Name: mpolyfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpolyfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpolyfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 496 (class 1255 OID 17637)
-- Dependencies: 6 1321
-- Name: mpolyfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "mpolyfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."mpolyfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 497 (class 1255 OID 17638)
-- Dependencies: 6 1321 1321
-- Name: multi("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multi"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_multi';


ALTER FUNCTION "public"."multi"("geometry") OWNER TO "postgres";

--
-- TOC entry 498 (class 1255 OID 17639)
-- Dependencies: 6 1321
-- Name: multilinefromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multilinefromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."multilinefromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 499 (class 1255 OID 17640)
-- Dependencies: 6 1321
-- Name: multilinefromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multilinefromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."multilinefromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 500 (class 1255 OID 17641)
-- Dependencies: 6 1321
-- Name: multilinestringfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multilinestringfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


ALTER FUNCTION "public"."multilinestringfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 501 (class 1255 OID 17642)
-- Dependencies: 6 1321
-- Name: multilinestringfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multilinestringfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


ALTER FUNCTION "public"."multilinestringfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 502 (class 1255 OID 17643)
-- Dependencies: 6 1321
-- Name: multipointfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipointfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


ALTER FUNCTION "public"."multipointfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 503 (class 1255 OID 17644)
-- Dependencies: 6 1321
-- Name: multipointfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipointfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1, $2)$_$;


ALTER FUNCTION "public"."multipointfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 504 (class 1255 OID 17645)
-- Dependencies: 6 1321
-- Name: multipointfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipointfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."multipointfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 505 (class 1255 OID 17646)
-- Dependencies: 6 1321
-- Name: multipointfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipointfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."multipointfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 506 (class 1255 OID 17647)
-- Dependencies: 6 1321
-- Name: multipolyfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipolyfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."multipolyfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 507 (class 1255 OID 17648)
-- Dependencies: 6 1321
-- Name: multipolyfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipolyfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."multipolyfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 508 (class 1255 OID 17649)
-- Dependencies: 6 1321
-- Name: multipolygonfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipolygonfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


ALTER FUNCTION "public"."multipolygonfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 509 (class 1255 OID 17650)
-- Dependencies: 6 1321
-- Name: multipolygonfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "multipolygonfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


ALTER FUNCTION "public"."multipolygonfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 510 (class 1255 OID 17651)
-- Dependencies: 6 1321
-- Name: ndims("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "ndims"("geometry") RETURNS smallint
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


ALTER FUNCTION "public"."ndims"("geometry") OWNER TO "postgres";

--
-- TOC entry 511 (class 1255 OID 17652)
-- Dependencies: 6 1321 1321
-- Name: noop("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "noop"("geometry") RETURNS "geometry"
    LANGUAGE "c" STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_noop';


ALTER FUNCTION "public"."noop"("geometry") OWNER TO "postgres";

--
-- TOC entry 512 (class 1255 OID 17653)
-- Dependencies: 6 1321
-- Name: npoints("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "npoints"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_npoints';


ALTER FUNCTION "public"."npoints"("geometry") OWNER TO "postgres";

--
-- TOC entry 513 (class 1255 OID 17654)
-- Dependencies: 6 1321
-- Name: nrings("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "nrings"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_nrings';


ALTER FUNCTION "public"."nrings"("geometry") OWNER TO "postgres";

--
-- TOC entry 514 (class 1255 OID 17655)
-- Dependencies: 6 1321
-- Name: numgeometries("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "numgeometries"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numgeometries_collection';


ALTER FUNCTION "public"."numgeometries"("geometry") OWNER TO "postgres";

--
-- TOC entry 515 (class 1255 OID 17656)
-- Dependencies: 6 1321
-- Name: numinteriorring("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "numinteriorring"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION "public"."numinteriorring"("geometry") OWNER TO "postgres";

--
-- TOC entry 516 (class 1255 OID 17657)
-- Dependencies: 6 1321
-- Name: numinteriorrings("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "numinteriorrings"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION "public"."numinteriorrings"("geometry") OWNER TO "postgres";

--
-- TOC entry 517 (class 1255 OID 17658)
-- Dependencies: 6 1321
-- Name: numpoints("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "numpoints"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numpoints_linestring';


ALTER FUNCTION "public"."numpoints"("geometry") OWNER TO "postgres";

--
-- TOC entry 518 (class 1255 OID 17659)
-- Dependencies: 6 1321 1321
-- Name: overlaps("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "overlaps"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'overlaps';


ALTER FUNCTION "public"."overlaps"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 519 (class 1255 OID 17660)
-- Dependencies: 6 1321
-- Name: perimeter("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "perimeter"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


ALTER FUNCTION "public"."perimeter"("geometry") OWNER TO "postgres";

--
-- TOC entry 520 (class 1255 OID 17661)
-- Dependencies: 6 1321
-- Name: perimeter2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "perimeter2d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION "public"."perimeter2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 521 (class 1255 OID 17662)
-- Dependencies: 6 1321
-- Name: perimeter3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "perimeter3d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


ALTER FUNCTION "public"."perimeter3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 522 (class 1255 OID 17663)
-- Dependencies: 6 1323 1332
-- Name: pgis_geometry_accum_finalfn("pgis_abs"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_geometry_accum_finalfn"("pgis_abs") RETURNS "geometry"[]
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'pgis_geometry_accum_finalfn';


ALTER FUNCTION "public"."pgis_geometry_accum_finalfn"("pgis_abs") OWNER TO "postgres";

--
-- TOC entry 523 (class 1255 OID 17664)
-- Dependencies: 6 1332 1332 1321
-- Name: pgis_geometry_accum_transfn("pgis_abs", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_geometry_accum_transfn"("pgis_abs", "geometry") RETURNS "pgis_abs"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'pgis_geometry_accum_transfn';


ALTER FUNCTION "public"."pgis_geometry_accum_transfn"("pgis_abs", "geometry") OWNER TO "postgres";

--
-- TOC entry 524 (class 1255 OID 17665)
-- Dependencies: 6 1321 1332
-- Name: pgis_geometry_collect_finalfn("pgis_abs"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_geometry_collect_finalfn"("pgis_abs") RETURNS "geometry"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'pgis_geometry_collect_finalfn';


ALTER FUNCTION "public"."pgis_geometry_collect_finalfn"("pgis_abs") OWNER TO "postgres";

--
-- TOC entry 525 (class 1255 OID 17666)
-- Dependencies: 6 1321 1332
-- Name: pgis_geometry_makeline_finalfn("pgis_abs"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_geometry_makeline_finalfn"("pgis_abs") RETURNS "geometry"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'pgis_geometry_makeline_finalfn';


ALTER FUNCTION "public"."pgis_geometry_makeline_finalfn"("pgis_abs") OWNER TO "postgres";

--
-- TOC entry 526 (class 1255 OID 17667)
-- Dependencies: 6 1321 1332
-- Name: pgis_geometry_polygonize_finalfn("pgis_abs"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_geometry_polygonize_finalfn"("pgis_abs") RETURNS "geometry"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'pgis_geometry_polygonize_finalfn';


ALTER FUNCTION "public"."pgis_geometry_polygonize_finalfn"("pgis_abs") OWNER TO "postgres";

--
-- TOC entry 527 (class 1255 OID 17668)
-- Dependencies: 6 1321 1332
-- Name: pgis_geometry_union_finalfn("pgis_abs"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pgis_geometry_union_finalfn"("pgis_abs") RETURNS "geometry"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'pgis_geometry_union_finalfn';


ALTER FUNCTION "public"."pgis_geometry_union_finalfn"("pgis_abs") OWNER TO "postgres";

--
-- TOC entry 528 (class 1255 OID 17669)
-- Dependencies: 6 1321
-- Name: point_inside_circle("geometry", double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "point_inside_circle"("geometry", double precision, double precision, double precision) RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_inside_circle_point';


ALTER FUNCTION "public"."point_inside_circle"("geometry", double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 529 (class 1255 OID 17670)
-- Dependencies: 6 1321
-- Name: pointfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pointfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."pointfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 530 (class 1255 OID 17671)
-- Dependencies: 6 1321
-- Name: pointfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pointfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."pointfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 531 (class 1255 OID 17672)
-- Dependencies: 6 1321
-- Name: pointfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pointfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."pointfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 532 (class 1255 OID 17673)
-- Dependencies: 6 1321
-- Name: pointfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pointfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."pointfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 533 (class 1255 OID 17674)
-- Dependencies: 6 1321 1321
-- Name: pointn("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pointn"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_pointn_linestring';


ALTER FUNCTION "public"."pointn"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 534 (class 1255 OID 17675)
-- Dependencies: 6 1321 1321
-- Name: pointonsurface("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "pointonsurface"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pointonsurface';


ALTER FUNCTION "public"."pointonsurface"("geometry") OWNER TO "postgres";

--
-- TOC entry 535 (class 1255 OID 17676)
-- Dependencies: 6 1321
-- Name: polyfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polyfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."polyfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 536 (class 1255 OID 17677)
-- Dependencies: 6 1321
-- Name: polyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."polyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 537 (class 1255 OID 17678)
-- Dependencies: 6 1321
-- Name: polyfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polyfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."polyfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 538 (class 1255 OID 17679)
-- Dependencies: 6 1321
-- Name: polyfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polyfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."polyfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 290 (class 1255 OID 17680)
-- Dependencies: 6 1321
-- Name: polygonfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polygonfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1)$_$;


ALTER FUNCTION "public"."polygonfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 539 (class 1255 OID 17681)
-- Dependencies: 6 1321
-- Name: polygonfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polygonfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


ALTER FUNCTION "public"."polygonfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 540 (class 1255 OID 17682)
-- Dependencies: 6 1321
-- Name: polygonfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polygonfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."polygonfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 541 (class 1255 OID 17683)
-- Dependencies: 6 1321
-- Name: polygonfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polygonfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."polygonfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 542 (class 1255 OID 17684)
-- Dependencies: 6 1321 1323
-- Name: polygonize_garray("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "polygonize_garray"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'polygonize_garray';


ALTER FUNCTION "public"."polygonize_garray"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 543 (class 1255 OID 17685)
-- Dependencies: 6 1474
-- Name: populate_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "populate_geometry_columns"() RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;

BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	EXECUTE 'TRUNCATE geometry_columns';

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c,
		 pg_attribute a,
		 pg_type t,
		 pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
	AND t.typname = 'geometry'
	AND a.attisdropped = false
	AND a.atttypid = t.oid
	AND a.attrelid = c.oid
	AND c.relnamespace = n.oid
	AND n.nspname NOT ILIKE 'pg_temp%';

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
	LOOP

	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	-- Add views to geometry columns table
	RAISE DEBUG 'Processing Views.....';
	FOR gcs IN
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'v'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
	LOOP

	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	IF oldcount > inserted THEN
	stale = oldcount-inserted;
	ELSE
	stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted|| ' conflicts:'||probed-inserted|| ' deleted:'||stale;
END

$$;


ALTER FUNCTION "public"."populate_geometry_columns"() OWNER TO "postgres";

--
-- TOC entry 544 (class 1255 OID 17686)
-- Dependencies: 6 1474
-- Name: populate_geometry_columns("oid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "populate_geometry_columns"("tbl_oid" "oid") RETURNS integer
    LANGUAGE "plpgsql"
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;

BEGIN
	inserted := 0;

	-- Iterate through all geometry columns in this table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'r'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP

	RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	DELETE FROM geometry_columns
	  WHERE f_table_schema = gcs.nspname
	  AND f_table_name = gcs.relname
	  AND f_geometry_column = gcs.attname;

	gc_is_valid := true;

	-- Try to find srid check from system tables (pg_constraint)
	gsrid :=
		(SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '')
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = gcs.nspname
		 AND c.relname = gcs.relname
		 AND a.attname = gcs.attname
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%srid(% = %');
	IF (gsrid IS NULL) THEN
		-- Try to find srid from the geometry itself
		EXECUTE 'SELECT srid(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gsrid := gc.srid;

		-- Try to apply srid check to column
		IF (gsrid IS NOT NULL) THEN
			BEGIN
				EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						 ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || '
						 CHECK (srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
			EXCEPTION
				WHEN check_violation THEN
					RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
					gc_is_valid := false;
			END;
		END IF;
	END IF;

	-- Try to find ndims check from system tables (pg_constraint)
	gndims :=
		(SELECT replace(split_part(s.consrc, ' = ', 2), ')', '')
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = gcs.nspname
		 AND c.relname = gcs.relname
		 AND a.attname = gcs.attname
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%ndims(% = %');
	IF (gndims IS NULL) THEN
		-- Try to find ndims from the geometry itself
		EXECUTE 'SELECT ndims(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gndims := gc.ndims;

		-- Try to apply ndims check to column
		IF (gndims IS NOT NULL) THEN
			BEGIN
				EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
						 ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || '
						 CHECK (ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
			EXCEPTION
				WHEN check_violation THEN
					RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
					gc_is_valid := false;
			END;
		END IF;
	END IF;

	-- Try to find geotype check from system tables (pg_constraint)
	gtype :=
		(SELECT replace(split_part(s.consrc, '''', 2), ')', '')
		 FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s
		 WHERE n.nspname = gcs.nspname
		 AND c.relname = gcs.relname
		 AND a.attname = gcs.attname
		 AND a.attrelid = c.oid
		 AND s.connamespace = n.oid
		 AND s.conrelid = c.oid
		 AND a.attnum = ANY (s.conkey)
		 AND s.consrc LIKE '%geometrytype(% = %');
	IF (gtype IS NULL) THEN
		-- Try to find geotype from the geometry itself
		EXECUTE 'SELECT geometrytype(' || quote_ident(gcs.attname) || ')
				 FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gtype := gc.geometrytype;
		--IF (gtype IS NULL) THEN
		--    gtype := 'GEOMETRY';
		--END IF;

		-- Try to apply geometrytype check to column
		IF (gtype IS NOT NULL) THEN
			BEGIN
				EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || '
				CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
			EXCEPTION
				WHEN check_violation THEN
					-- No geometry check can be applied. This column contains a number of geometry types.
					RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
			END;
		END IF;
	END IF;

	IF (gsrid IS NULL) THEN
		RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gndims IS NULL) THEN
		RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the number of dimensions', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gtype IS NULL) THEN
		RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the geometry type', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSE
		-- Only insert into geometry_columns if table constraints could be applied.
		IF (gc_is_valid) THEN
			INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type)
			VALUES ('', gcs.nspname, gcs.relname, gcs.attname, gndims, gsrid, gtype);
			inserted := inserted + 1;
		END IF;
	END IF;
	END LOOP;

	-- Add views to geometry columns table
	FOR gcs IN
	SELECT n.nspname, c.relname, a.attname
		FROM pg_class c,
			 pg_attribute a,
			 pg_type t,
			 pg_namespace n
		WHERE c.relkind = 'v'
		AND t.typname = 'geometry'
		AND a.attisdropped = false
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND n.nspname NOT ILIKE 'pg_temp%'
		AND c.oid = tbl_oid
	LOOP
		RAISE DEBUG 'Processing view %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	DELETE FROM geometry_columns
	  WHERE f_table_schema = gcs.nspname
	  AND f_table_name = gcs.relname
	  AND f_geometry_column = gcs.attname;
	  
		EXECUTE 'SELECT ndims(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gndims := gc.ndims;

		EXECUTE 'SELECT srid(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gsrid := gc.srid;

		EXECUTE 'SELECT geometrytype(' || quote_ident(gcs.attname) || ')
				 FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || '
				 WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1'
			INTO gc;
		gtype := gc.geometrytype;

		IF (gndims IS NULL) THEN
			RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine ndims', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
		ELSIF (gsrid IS NULL) THEN
			RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
		ELSIF (gtype IS NULL) THEN
			RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine gtype', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
		ELSE
			query := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) ' ||
					 'VALUES ('''', ' || quote_literal(gcs.nspname) || ',' || quote_literal(gcs.relname) || ',' || quote_literal(gcs.attname) || ',' || gndims || ',' || gsrid || ',' || quote_literal(gtype) || ')';
			EXECUTE query;
			inserted := inserted + 1;
		END IF;
	END LOOP;

	RETURN inserted;
END

$$;


ALTER FUNCTION "public"."populate_geometry_columns"("tbl_oid" "oid") OWNER TO "postgres";

--
-- TOC entry 545 (class 1255 OID 17688)
-- Dependencies: 6 1321 1321
-- Name: postgis_addbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_addbbox"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addBBOX';


ALTER FUNCTION "public"."postgis_addbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 546 (class 1255 OID 17689)
-- Dependencies: 6
-- Name: postgis_cache_bbox(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_cache_bbox"() RETURNS "trigger"
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'cache_bbox';


ALTER FUNCTION "public"."postgis_cache_bbox"() OWNER TO "postgres";

--
-- TOC entry 547 (class 1255 OID 17690)
-- Dependencies: 6 1321 1321
-- Name: postgis_dropbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_dropbbox"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dropBBOX';


ALTER FUNCTION "public"."postgis_dropbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 548 (class 1255 OID 17691)
-- Dependencies: 6 1474
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_full_version"() RETURNS "text"
    LANGUAGE "plpgsql" IMMUTABLE
    AS $$
DECLARE
	libver text;
	projver text;
	geosver text;
	libxmlver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_libxml_version() INTO libxmlver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF  libxmlver IS NOT NULL THEN
		fullver = fullver || ' LIBXML="' || libxmlver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (procs from ' || dbproc || ' need upgrade)';
	END IF;

	RETURN fullver;
END
$$;


ALTER FUNCTION "public"."postgis_full_version"() OWNER TO "postgres";

--
-- TOC entry 549 (class 1255 OID 17692)
-- Dependencies: 6
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_geos_version"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_geos_version';


ALTER FUNCTION "public"."postgis_geos_version"() OWNER TO "postgres";

--
-- TOC entry 550 (class 1255 OID 17693)
-- Dependencies: 6 1301 1321
-- Name: postgis_getbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_getbbox"("geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."postgis_getbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 551 (class 1255 OID 17694)
-- Dependencies: 6
-- Name: postgis_gist_joinsel("internal", "oid", "internal", smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_gist_joinsel"("internal", "oid", "internal", smallint) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


ALTER FUNCTION "public"."postgis_gist_joinsel"("internal", "oid", "internal", smallint) OWNER TO "postgres";

--
-- TOC entry 552 (class 1255 OID 17695)
-- Dependencies: 6
-- Name: postgis_gist_sel("internal", "oid", "internal", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_gist_sel"("internal", "oid", "internal", integer) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


ALTER FUNCTION "public"."postgis_gist_sel"("internal", "oid", "internal", integer) OWNER TO "postgres";

--
-- TOC entry 553 (class 1255 OID 17696)
-- Dependencies: 6 1321
-- Name: postgis_hasbbox("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_hasbbox"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasBBOX';


ALTER FUNCTION "public"."postgis_hasbbox"("geometry") OWNER TO "postgres";

--
-- TOC entry 554 (class 1255 OID 17697)
-- Dependencies: 6
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_lib_build_date"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_lib_build_date';


ALTER FUNCTION "public"."postgis_lib_build_date"() OWNER TO "postgres";

--
-- TOC entry 555 (class 1255 OID 17698)
-- Dependencies: 6
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_lib_version"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_lib_version';


ALTER FUNCTION "public"."postgis_lib_version"() OWNER TO "postgres";

--
-- TOC entry 556 (class 1255 OID 17699)
-- Dependencies: 6
-- Name: postgis_libxml_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_libxml_version"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_libxml_version';


ALTER FUNCTION "public"."postgis_libxml_version"() OWNER TO "postgres";

--
-- TOC entry 557 (class 1255 OID 17700)
-- Dependencies: 6 1321 1321
-- Name: postgis_noop("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_noop"("geometry") RETURNS "geometry"
    LANGUAGE "c" STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_noop';


ALTER FUNCTION "public"."postgis_noop"("geometry") OWNER TO "postgres";

--
-- TOC entry 558 (class 1255 OID 17701)
-- Dependencies: 6
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_proj_version"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_proj_version';


ALTER FUNCTION "public"."postgis_proj_version"() OWNER TO "postgres";

--
-- TOC entry 559 (class 1255 OID 17702)
-- Dependencies: 6
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_scripts_build_date"() RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $$SELECT '2011-11-21 15:19:43'::text AS version$$;


ALTER FUNCTION "public"."postgis_scripts_build_date"() OWNER TO "postgres";

--
-- TOC entry 560 (class 1255 OID 17703)
-- Dependencies: 6
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_scripts_installed"() RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $$SELECT '1.5 r7360'::text AS version$$;


ALTER FUNCTION "public"."postgis_scripts_installed"() OWNER TO "postgres";

--
-- TOC entry 561 (class 1255 OID 17704)
-- Dependencies: 6
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_scripts_released"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_scripts_released';


ALTER FUNCTION "public"."postgis_scripts_released"() OWNER TO "postgres";

--
-- TOC entry 562 (class 1255 OID 17705)
-- Dependencies: 6 1321 1321
-- Name: postgis_transform_geometry("geometry", "text", "text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_transform_geometry"("geometry", "text", "text", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform_geom';


ALTER FUNCTION "public"."postgis_transform_geometry"("geometry", "text", "text", integer) OWNER TO "postgres";

--
-- TOC entry 563 (class 1255 OID 17706)
-- Dependencies: 6
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_uses_stats"() RETURNS boolean
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_uses_stats';


ALTER FUNCTION "public"."postgis_uses_stats"() OWNER TO "postgres";

--
-- TOC entry 564 (class 1255 OID 17707)
-- Dependencies: 6
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "postgis_version"() RETURNS "text"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'postgis_version';


ALTER FUNCTION "public"."postgis_version"() OWNER TO "postgres";

--
-- TOC entry 568 (class 1255 OID 17708)
-- Dependencies: 6 1474
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "probe_geometry_columns"() RETURNS "text"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t,
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck

		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,
		n.nspname::varchar as f_table_schema,
		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from
			replace(replace(split_part(
				sridcheck.consrc, ' = ', 2), ')', ''), '(', ''))::integer AS srid,
		trim(both ' =)''' from substr(typecheck.consrc,
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type
		FROM pg_class c, pg_attribute a, pg_type t,
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(st_srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

			AND NOT EXISTS (
					SELECT oid FROM geometry_columns gc
					WHERE c.relname::varchar = gc.f_table_name
					AND n.nspname::varchar = gc.f_table_schema
					AND a.attname::varchar = gc.f_geometry_column
			);

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

	RETURN 'probed:'||probed::text||
		' inserted:'||inserted::text||
		' conflicts:'||(probed-inserted)::text||
		' stale:'||stale::text;
END

$$;


ALTER FUNCTION "public"."probe_geometry_columns"() OWNER TO "postgres";

--
-- TOC entry 569 (class 1255 OID 17709)
-- Dependencies: 6 1321 1321
-- Name: relate("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "relate"("geometry", "geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_full';


ALTER FUNCTION "public"."relate"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 570 (class 1255 OID 17710)
-- Dependencies: 6 1321 1321
-- Name: relate("geometry", "geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "relate"("geometry", "geometry", "text") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_pattern';


ALTER FUNCTION "public"."relate"("geometry", "geometry", "text") OWNER TO "postgres";

--
-- TOC entry 571 (class 1255 OID 17711)
-- Dependencies: 6 1321 1321
-- Name: removepoint("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "removepoint"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_removepoint';


ALTER FUNCTION "public"."removepoint"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 572 (class 1255 OID 17712)
-- Dependencies: 6
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "rename_geometry_table_constraints"() RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$;


ALTER FUNCTION "public"."rename_geometry_table_constraints"() OWNER TO "postgres";

--
-- TOC entry 573 (class 1255 OID 17713)
-- Dependencies: 6 1321 1321
-- Name: reverse("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "reverse"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_reverse';


ALTER FUNCTION "public"."reverse"("geometry") OWNER TO "postgres";

--
-- TOC entry 574 (class 1255 OID 17714)
-- Dependencies: 6 1321 1321
-- Name: rotate("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "rotate"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


ALTER FUNCTION "public"."rotate"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 575 (class 1255 OID 17715)
-- Dependencies: 6 1321 1321
-- Name: rotatex("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "rotatex"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


ALTER FUNCTION "public"."rotatex"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 576 (class 1255 OID 17716)
-- Dependencies: 6 1321 1321
-- Name: rotatey("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "rotatey"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


ALTER FUNCTION "public"."rotatey"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 577 (class 1255 OID 17717)
-- Dependencies: 6 1321 1321
-- Name: rotatez("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "rotatez"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


ALTER FUNCTION "public"."rotatez"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 578 (class 1255 OID 17718)
-- Dependencies: 6 1321 1321
-- Name: scale("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "scale"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


ALTER FUNCTION "public"."scale"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 579 (class 1255 OID 17719)
-- Dependencies: 6 1321 1321
-- Name: scale("geometry", double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "scale"("geometry", double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


ALTER FUNCTION "public"."scale"("geometry", double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 580 (class 1255 OID 17720)
-- Dependencies: 6 1321 1321
-- Name: se_envelopesintersect("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_envelopesintersect"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 && $2
	$_$;


ALTER FUNCTION "public"."se_envelopesintersect"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 581 (class 1255 OID 17721)
-- Dependencies: 6 1321
-- Name: se_is3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_is3d"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasz';


ALTER FUNCTION "public"."se_is3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 582 (class 1255 OID 17722)
-- Dependencies: 6 1321
-- Name: se_ismeasured("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_ismeasured"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_hasm';


ALTER FUNCTION "public"."se_ismeasured"("geometry") OWNER TO "postgres";

--
-- TOC entry 583 (class 1255 OID 17723)
-- Dependencies: 6 1321 1321
-- Name: se_locatealong("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_locatealong"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


ALTER FUNCTION "public"."se_locatealong"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 584 (class 1255 OID 17724)
-- Dependencies: 6 1321 1321
-- Name: se_locatebetween("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_locatebetween"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


ALTER FUNCTION "public"."se_locatebetween"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 585 (class 1255 OID 17725)
-- Dependencies: 6 1321
-- Name: se_m("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_m"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


ALTER FUNCTION "public"."se_m"("geometry") OWNER TO "postgres";

--
-- TOC entry 586 (class 1255 OID 17726)
-- Dependencies: 6 1321
-- Name: se_z("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "se_z"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


ALTER FUNCTION "public"."se_z"("geometry") OWNER TO "postgres";

--
-- TOC entry 587 (class 1255 OID 17727)
-- Dependencies: 6 1321 1321
-- Name: segmentize("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "segmentize"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_segmentize2d';


ALTER FUNCTION "public"."segmentize"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 588 (class 1255 OID 17728)
-- Dependencies: 6 1313 1313
-- Name: setfactor("chip", real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "setfactor"("chip", real) RETURNS "chip"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setFactor';


ALTER FUNCTION "public"."setfactor"("chip", real) OWNER TO "postgres";

--
-- TOC entry 589 (class 1255 OID 17729)
-- Dependencies: 6 1321 1321 1321
-- Name: setpoint("geometry", integer, "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "setpoint"("geometry", integer, "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setpoint_linestring';


ALTER FUNCTION "public"."setpoint"("geometry", integer, "geometry") OWNER TO "postgres";

--
-- TOC entry 590 (class 1255 OID 17730)
-- Dependencies: 6 1313 1313
-- Name: setsrid("chip", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "setsrid"("chip", integer) RETURNS "chip"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setSRID';


ALTER FUNCTION "public"."setsrid"("chip", integer) OWNER TO "postgres";

--
-- TOC entry 591 (class 1255 OID 17731)
-- Dependencies: 6 1321 1321
-- Name: setsrid("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "setsrid"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setSRID';


ALTER FUNCTION "public"."setsrid"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 592 (class 1255 OID 17732)
-- Dependencies: 6 1321 1321
-- Name: shift_longitude("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "shift_longitude"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longitude_shift';


ALTER FUNCTION "public"."shift_longitude"("geometry") OWNER TO "postgres";

--
-- TOC entry 593 (class 1255 OID 17733)
-- Dependencies: 6 1321 1321
-- Name: simplify("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "simplify"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_simplify2d';


ALTER FUNCTION "public"."simplify"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 594 (class 1255 OID 17734)
-- Dependencies: 6 1321 1321
-- Name: snaptogrid("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "snaptogrid"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$;


ALTER FUNCTION "public"."snaptogrid"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 595 (class 1255 OID 17735)
-- Dependencies: 6 1321 1321
-- Name: snaptogrid("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "snaptogrid"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$;


ALTER FUNCTION "public"."snaptogrid"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 596 (class 1255 OID 17736)
-- Dependencies: 6 1321 1321
-- Name: snaptogrid("geometry", double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "snaptogrid"("geometry", double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid';


ALTER FUNCTION "public"."snaptogrid"("geometry", double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 597 (class 1255 OID 17737)
-- Dependencies: 6 1321 1321 1321
-- Name: snaptogrid("geometry", "geometry", double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "snaptogrid"("geometry", "geometry", double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid_pointoff';


ALTER FUNCTION "public"."snaptogrid"("geometry", "geometry", double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 598 (class 1255 OID 17738)
-- Dependencies: 6 1313
-- Name: srid("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "srid"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getSRID';


ALTER FUNCTION "public"."srid"("chip") OWNER TO "postgres";

--
-- TOC entry 599 (class 1255 OID 17739)
-- Dependencies: 6 1321
-- Name: srid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "srid"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


ALTER FUNCTION "public"."srid"("geometry") OWNER TO "postgres";

--
-- TOC entry 600 (class 1255 OID 17740)
-- Dependencies: 6 1321 1321
-- Name: st_addmeasure("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_addmeasure"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_AddMeasure';


ALTER FUNCTION "public"."st_addmeasure"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 565 (class 1255 OID 17741)
-- Dependencies: 6 1321 1321 1321
-- Name: st_addpoint("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_addpoint"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


ALTER FUNCTION "public"."st_addpoint"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 566 (class 1255 OID 17742)
-- Dependencies: 6 1321 1321 1321
-- Name: st_addpoint("geometry", "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_addpoint"("geometry", "geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_addpoint';


ALTER FUNCTION "public"."st_addpoint"("geometry", "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 567 (class 1255 OID 17743)
-- Dependencies: 6 1321 1321
-- Name: st_affine("geometry", double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$;


ALTER FUNCTION "public"."st_affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 601 (class 1255 OID 17744)
-- Dependencies: 6 1321 1321
-- Name: st_affine("geometry", double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_affine';


ALTER FUNCTION "public"."st_affine"("geometry", double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 602 (class 1255 OID 17745)
-- Dependencies: 6 1321
-- Name: st_area("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_area"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


ALTER FUNCTION "public"."st_area"("geometry") OWNER TO "postgres";

--
-- TOC entry 603 (class 1255 OID 17746)
-- Dependencies: 6 1317
-- Name: st_area("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_area"("geography") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_Area($1, true)$_$;


ALTER FUNCTION "public"."st_area"("geography") OWNER TO "postgres";

--
-- TOC entry 604 (class 1255 OID 17747)
-- Dependencies: 6
-- Name: st_area("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_area"("text") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_Area($1::geometry);  $_$;


ALTER FUNCTION "public"."st_area"("text") OWNER TO "postgres";

--
-- TOC entry 605 (class 1255 OID 17748)
-- Dependencies: 6 1317
-- Name: st_area("geography", boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_area"("geography", boolean) RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_area';


ALTER FUNCTION "public"."st_area"("geography", boolean) OWNER TO "postgres";

--
-- TOC entry 606 (class 1255 OID 17749)
-- Dependencies: 6 1321
-- Name: st_area2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_area2d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_area_polygon';


ALTER FUNCTION "public"."st_area2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 607 (class 1255 OID 17750)
-- Dependencies: 6 1321
-- Name: st_asbinary("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asbinary"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


ALTER FUNCTION "public"."st_asbinary"("geometry") OWNER TO "postgres";

--
-- TOC entry 608 (class 1255 OID 17751)
-- Dependencies: 6 1317
-- Name: st_asbinary("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asbinary"("geography") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_binary';


ALTER FUNCTION "public"."st_asbinary"("geography") OWNER TO "postgres";

--
-- TOC entry 609 (class 1255 OID 17752)
-- Dependencies: 6
-- Name: st_asbinary("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asbinary"("text") RETURNS "bytea"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_AsBinary($1::geometry);  $_$;


ALTER FUNCTION "public"."st_asbinary"("text") OWNER TO "postgres";

--
-- TOC entry 610 (class 1255 OID 17753)
-- Dependencies: 6 1321
-- Name: st_asbinary("geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asbinary"("geometry", "text") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asBinary';


ALTER FUNCTION "public"."st_asbinary"("geometry", "text") OWNER TO "postgres";

--
-- TOC entry 611 (class 1255 OID 17754)
-- Dependencies: 6 1321
-- Name: st_asewkb("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asewkb"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


ALTER FUNCTION "public"."st_asewkb"("geometry") OWNER TO "postgres";

--
-- TOC entry 612 (class 1255 OID 17755)
-- Dependencies: 6 1321
-- Name: st_asewkb("geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asewkb"("geometry", "text") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'WKBFromLWGEOM';


ALTER FUNCTION "public"."st_asewkb"("geometry", "text") OWNER TO "postgres";

--
-- TOC entry 613 (class 1255 OID 17756)
-- Dependencies: 6 1321
-- Name: st_asewkt("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asewkt"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asEWKT';


ALTER FUNCTION "public"."st_asewkt"("geometry") OWNER TO "postgres";

--
-- TOC entry 614 (class 1255 OID 17757)
-- Dependencies: 6 1321
-- Name: st_asgeojson("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"("geometry") OWNER TO "postgres";

--
-- TOC entry 615 (class 1255 OID 17758)
-- Dependencies: 6 1317
-- Name: st_asgeojson("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("geography") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"("geography") OWNER TO "postgres";

--
-- TOC entry 616 (class 1255 OID 17759)
-- Dependencies: 6
-- Name: st_asgeojson("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_AsGeoJson($1::geometry);  $_$;


ALTER FUNCTION "public"."st_asgeojson"("text") OWNER TO "postgres";

--
-- TOC entry 617 (class 1255 OID 17760)
-- Dependencies: 6 1321
-- Name: st_asgeojson("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 618 (class 1255 OID 17761)
-- Dependencies: 6 1321
-- Name: st_asgeojson(integer, "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"(integer, "geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"(integer, "geometry") OWNER TO "postgres";

--
-- TOC entry 619 (class 1255 OID 17762)
-- Dependencies: 6 1317
-- Name: st_asgeojson("geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("geography", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"("geography", integer) OWNER TO "postgres";

--
-- TOC entry 620 (class 1255 OID 17763)
-- Dependencies: 6 1317
-- Name: st_asgeojson(integer, "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"(integer, "geography") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"(integer, "geography") OWNER TO "postgres";

--
-- TOC entry 621 (class 1255 OID 17764)
-- Dependencies: 6 1321
-- Name: st_asgeojson(integer, "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"(integer, "geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"(integer, "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 622 (class 1255 OID 17765)
-- Dependencies: 6 1321
-- Name: st_asgeojson("geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("geometry", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$;


ALTER FUNCTION "public"."st_asgeojson"("geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 623 (class 1255 OID 17766)
-- Dependencies: 6 1317
-- Name: st_asgeojson(integer, "geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"(integer, "geography", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$;


ALTER FUNCTION "public"."st_asgeojson"(integer, "geography", integer) OWNER TO "postgres";

--
-- TOC entry 624 (class 1255 OID 17767)
-- Dependencies: 6 1317
-- Name: st_asgeojson("geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"("geography", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$;


ALTER FUNCTION "public"."st_asgeojson"("geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 625 (class 1255 OID 17768)
-- Dependencies: 6 1321
-- Name: st_asgeojson(integer, "geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"(integer, "geometry", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."st_asgeojson"(integer, "geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 626 (class 1255 OID 17769)
-- Dependencies: 6 1317
-- Name: st_asgeojson(integer, "geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgeojson"(integer, "geography", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."st_asgeojson"(integer, "geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 627 (class 1255 OID 17770)
-- Dependencies: 6 1321
-- Name: st_asgml("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgml"("geometry") OWNER TO "postgres";

--
-- TOC entry 628 (class 1255 OID 17771)
-- Dependencies: 6 1317
-- Name: st_asgml("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("geography") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgml"("geography") OWNER TO "postgres";

--
-- TOC entry 629 (class 1255 OID 17772)
-- Dependencies: 6
-- Name: st_asgml("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_AsGML($1::geometry);  $_$;


ALTER FUNCTION "public"."st_asgml"("text") OWNER TO "postgres";

--
-- TOC entry 630 (class 1255 OID 17773)
-- Dependencies: 6 1321
-- Name: st_asgml("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


ALTER FUNCTION "public"."st_asgml"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 631 (class 1255 OID 17774)
-- Dependencies: 6 1321
-- Name: st_asgml(integer, "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"(integer, "geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgml"(integer, "geometry") OWNER TO "postgres";

--
-- TOC entry 632 (class 1255 OID 17775)
-- Dependencies: 6 1317
-- Name: st_asgml("geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("geography", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$;


ALTER FUNCTION "public"."st_asgml"("geography", integer) OWNER TO "postgres";

--
-- TOC entry 633 (class 1255 OID 17776)
-- Dependencies: 6 1317
-- Name: st_asgml(integer, "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"(integer, "geography") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$;


ALTER FUNCTION "public"."st_asgml"(integer, "geography") OWNER TO "postgres";

--
-- TOC entry 634 (class 1255 OID 17777)
-- Dependencies: 6 1321
-- Name: st_asgml(integer, "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"(integer, "geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


ALTER FUNCTION "public"."st_asgml"(integer, "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 635 (class 1255 OID 17778)
-- Dependencies: 6 1321
-- Name: st_asgml("geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("geometry", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$;


ALTER FUNCTION "public"."st_asgml"("geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 636 (class 1255 OID 17779)
-- Dependencies: 6 1317
-- Name: st_asgml(integer, "geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"(integer, "geography", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$;


ALTER FUNCTION "public"."st_asgml"(integer, "geography", integer) OWNER TO "postgres";

--
-- TOC entry 637 (class 1255 OID 17780)
-- Dependencies: 6 1317
-- Name: st_asgml("geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"("geography", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$;


ALTER FUNCTION "public"."st_asgml"("geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 638 (class 1255 OID 17781)
-- Dependencies: 6 1321
-- Name: st_asgml(integer, "geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"(integer, "geometry", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."st_asgml"(integer, "geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 639 (class 1255 OID 17782)
-- Dependencies: 6 1317
-- Name: st_asgml(integer, "geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_asgml"(integer, "geography", integer, integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."st_asgml"(integer, "geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 640 (class 1255 OID 17783)
-- Dependencies: 6 1321
-- Name: st_ashexewkb("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_ashexewkb"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION "public"."st_ashexewkb"("geometry") OWNER TO "postgres";

--
-- TOC entry 641 (class 1255 OID 17784)
-- Dependencies: 6 1321
-- Name: st_ashexewkb("geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_ashexewkb"("geometry", "text") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asHEXEWKB';


ALTER FUNCTION "public"."st_ashexewkb"("geometry", "text") OWNER TO "postgres";

--
-- TOC entry 642 (class 1255 OID 17785)
-- Dependencies: 6 1321
-- Name: st_askml("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"("geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$;


ALTER FUNCTION "public"."st_askml"("geometry") OWNER TO "postgres";

--
-- TOC entry 643 (class 1255 OID 17786)
-- Dependencies: 6 1317
-- Name: st_askml("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"("geography") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, $1, 15)$_$;


ALTER FUNCTION "public"."st_askml"("geography") OWNER TO "postgres";

--
-- TOC entry 644 (class 1255 OID 17787)
-- Dependencies: 6
-- Name: st_askml("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"("text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_AsKML($1::geometry);  $_$;


ALTER FUNCTION "public"."st_askml"("text") OWNER TO "postgres";

--
-- TOC entry 645 (class 1255 OID 17788)
-- Dependencies: 6 1321
-- Name: st_askml("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"("geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), $2)$_$;


ALTER FUNCTION "public"."st_askml"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 646 (class 1255 OID 17789)
-- Dependencies: 6 1321
-- Name: st_askml(integer, "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"(integer, "geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$;


ALTER FUNCTION "public"."st_askml"(integer, "geometry") OWNER TO "postgres";

--
-- TOC entry 647 (class 1255 OID 17790)
-- Dependencies: 6 1317
-- Name: st_askml("geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"("geography", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML(2, $1, $2)$_$;


ALTER FUNCTION "public"."st_askml"("geography", integer) OWNER TO "postgres";

--
-- TOC entry 648 (class 1255 OID 17791)
-- Dependencies: 1317 6
-- Name: st_askml(integer, "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"(integer, "geography") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, $2, 15)$_$;


ALTER FUNCTION "public"."st_askml"(integer, "geography") OWNER TO "postgres";

--
-- TOC entry 649 (class 1255 OID 17792)
-- Dependencies: 1321 6
-- Name: st_askml(integer, "geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"(integer, "geometry", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$;


ALTER FUNCTION "public"."st_askml"(integer, "geometry", integer) OWNER TO "postgres";

--
-- TOC entry 650 (class 1255 OID 17793)
-- Dependencies: 1317 6
-- Name: st_askml(integer, "geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_askml"(integer, "geography", integer) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_AsKML($1, $2, $3)$_$;


ALTER FUNCTION "public"."st_askml"(integer, "geography", integer) OWNER TO "postgres";

--
-- TOC entry 651 (class 1255 OID 17794)
-- Dependencies: 6 1321
-- Name: st_assvg("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


ALTER FUNCTION "public"."st_assvg"("geometry") OWNER TO "postgres";

--
-- TOC entry 652 (class 1255 OID 17795)
-- Dependencies: 6 1317
-- Name: st_assvg("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("geography") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_svg';


ALTER FUNCTION "public"."st_assvg"("geography") OWNER TO "postgres";

--
-- TOC entry 653 (class 1255 OID 17796)
-- Dependencies: 6
-- Name: st_assvg("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_AsSVG($1::geometry);  $_$;


ALTER FUNCTION "public"."st_assvg"("text") OWNER TO "postgres";

--
-- TOC entry 654 (class 1255 OID 17797)
-- Dependencies: 1321 6
-- Name: st_assvg("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("geometry", integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


ALTER FUNCTION "public"."st_assvg"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 655 (class 1255 OID 17798)
-- Dependencies: 1317 6
-- Name: st_assvg("geography", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("geography", integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_svg';


ALTER FUNCTION "public"."st_assvg"("geography", integer) OWNER TO "postgres";

--
-- TOC entry 656 (class 1255 OID 17799)
-- Dependencies: 6 1321
-- Name: st_assvg("geometry", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("geometry", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'assvg_geometry';


ALTER FUNCTION "public"."st_assvg"("geometry", integer, integer) OWNER TO "postgres";

--
-- TOC entry 657 (class 1255 OID 17800)
-- Dependencies: 1317 6
-- Name: st_assvg("geography", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_assvg"("geography", integer, integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_svg';


ALTER FUNCTION "public"."st_assvg"("geography", integer, integer) OWNER TO "postgres";

--
-- TOC entry 658 (class 1255 OID 17801)
-- Dependencies: 6 1321
-- Name: st_astext("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_astext"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_asText';


ALTER FUNCTION "public"."st_astext"("geometry") OWNER TO "postgres";

--
-- TOC entry 659 (class 1255 OID 17802)
-- Dependencies: 6 1317
-- Name: st_astext("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_astext"("geography") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_as_text';


ALTER FUNCTION "public"."st_astext"("geography") OWNER TO "postgres";

--
-- TOC entry 660 (class 1255 OID 17803)
-- Dependencies: 6
-- Name: st_astext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_astext"("text") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_AsText($1::geometry);  $_$;


ALTER FUNCTION "public"."st_astext"("text") OWNER TO "postgres";

--
-- TOC entry 661 (class 1255 OID 17804)
-- Dependencies: 6 1321 1321
-- Name: st_azimuth("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_azimuth"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_azimuth';


ALTER FUNCTION "public"."st_azimuth"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 662 (class 1255 OID 17805)
-- Dependencies: 6 1474 1321
-- Name: st_bdmpolyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_bdmpolyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$;


ALTER FUNCTION "public"."st_bdmpolyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 663 (class 1255 OID 17806)
-- Dependencies: 1474 1321 6
-- Name: st_bdpolyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_bdpolyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$;


ALTER FUNCTION "public"."st_bdpolyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 664 (class 1255 OID 17807)
-- Dependencies: 6 1321 1321
-- Name: st_boundary("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_boundary"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'boundary';


ALTER FUNCTION "public"."st_boundary"("geometry") OWNER TO "postgres";

--
-- TOC entry 665 (class 1255 OID 17808)
-- Dependencies: 1321 6
-- Name: st_box("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box"("geometry") RETURNS "box"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX';


ALTER FUNCTION "public"."st_box"("geometry") OWNER TO "postgres";

--
-- TOC entry 666 (class 1255 OID 17809)
-- Dependencies: 6 1305
-- Name: st_box("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box"("box3d") RETURNS "box"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX';


ALTER FUNCTION "public"."st_box"("box3d") OWNER TO "postgres";

--
-- TOC entry 667 (class 1255 OID 17810)
-- Dependencies: 6 1321 1301
-- Name: st_box2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box2d"("geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."st_box2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 668 (class 1255 OID 17811)
-- Dependencies: 6 1305 1301
-- Name: st_box2d("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box2d"("box3d") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."st_box2d"("box3d") OWNER TO "postgres";

--
-- TOC entry 669 (class 1255 OID 17812)
-- Dependencies: 6 1309 1301
-- Name: st_box2d("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box2d"("box3d_extent") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_BOX2DFLOAT4';


ALTER FUNCTION "public"."st_box2d"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 670 (class 1255 OID 17813)
-- Dependencies: 1301 6
-- Name: st_box2d_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box2d_in"("cstring") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_in';


ALTER FUNCTION "public"."st_box2d_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 671 (class 1255 OID 17814)
-- Dependencies: 1301 6
-- Name: st_box2d_out("box2d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box2d_out"("box2d") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_out';


ALTER FUNCTION "public"."st_box2d_out"("box2d") OWNER TO "postgres";

--
-- TOC entry 672 (class 1255 OID 17815)
-- Dependencies: 1305 6 1321
-- Name: st_box3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box3d"("geometry") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_BOX3D';


ALTER FUNCTION "public"."st_box3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 673 (class 1255 OID 17816)
-- Dependencies: 1305 6 1301
-- Name: st_box3d("box2d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box3d"("box2d") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_BOX3D';


ALTER FUNCTION "public"."st_box3d"("box2d") OWNER TO "postgres";

--
-- TOC entry 674 (class 1255 OID 17817)
-- Dependencies: 6 1305 1309
-- Name: st_box3d_extent("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box3d_extent"("box3d_extent") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_extent_to_BOX3D';


ALTER FUNCTION "public"."st_box3d_extent"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 675 (class 1255 OID 17818)
-- Dependencies: 6 1305
-- Name: st_box3d_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box3d_in"("cstring") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_in';


ALTER FUNCTION "public"."st_box3d_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 676 (class 1255 OID 17819)
-- Dependencies: 6 1305
-- Name: st_box3d_out("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_box3d_out"("box3d") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_out';


ALTER FUNCTION "public"."st_box3d_out"("box3d") OWNER TO "postgres";

--
-- TOC entry 677 (class 1255 OID 17820)
-- Dependencies: 1321 1321 6
-- Name: st_buffer("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_buffer"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'buffer';


ALTER FUNCTION "public"."st_buffer"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 678 (class 1255 OID 17821)
-- Dependencies: 6 1317 1317
-- Name: st_buffer("geography", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_buffer"("geography", double precision) RETURNS "geography"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Buffer(ST_Transform(geometry($1), _ST_BestSRID($1)), $2), 4326))$_$;


ALTER FUNCTION "public"."st_buffer"("geography", double precision) OWNER TO "postgres";

--
-- TOC entry 679 (class 1255 OID 17822)
-- Dependencies: 6 1321
-- Name: st_buffer("text", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_buffer"("text", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_Buffer($1::geometry, $2);  $_$;


ALTER FUNCTION "public"."st_buffer"("text", double precision) OWNER TO "postgres";

--
-- TOC entry 680 (class 1255 OID 17823)
-- Dependencies: 1321 1321 6
-- Name: st_buffer("geometry", double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_buffer"("geometry", double precision, integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST('quad_segs='||CAST($3 AS text) as cstring))
	   $_$;


ALTER FUNCTION "public"."st_buffer"("geometry", double precision, integer) OWNER TO "postgres";

--
-- TOC entry 681 (class 1255 OID 17824)
-- Dependencies: 6 1321 1321
-- Name: st_buffer("geometry", double precision, "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_buffer"("geometry", double precision, "text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT _ST_Buffer($1, $2,
		CAST( regexp_replace($3, '^[0123456789]+$',
			'quad_segs='||$3) AS cstring)
		)
	   $_$;


ALTER FUNCTION "public"."st_buffer"("geometry", double precision, "text") OWNER TO "postgres";

--
-- TOC entry 682 (class 1255 OID 17825)
-- Dependencies: 6 1321 1321
-- Name: st_buildarea("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_buildarea"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_buildarea';


ALTER FUNCTION "public"."st_buildarea"("geometry") OWNER TO "postgres";

--
-- TOC entry 683 (class 1255 OID 17826)
-- Dependencies: 6 1321
-- Name: st_bytea("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_bytea"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_bytea';


ALTER FUNCTION "public"."st_bytea"("geometry") OWNER TO "postgres";

--
-- TOC entry 684 (class 1255 OID 17827)
-- Dependencies: 6 1321 1321
-- Name: st_centroid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_centroid"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'centroid';


ALTER FUNCTION "public"."st_centroid"("geometry") OWNER TO "postgres";

--
-- TOC entry 685 (class 1255 OID 17828)
-- Dependencies: 6 1313
-- Name: st_chip_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_chip_in"("cstring") RETURNS "chip"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_in';


ALTER FUNCTION "public"."st_chip_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 686 (class 1255 OID 17829)
-- Dependencies: 1313 6
-- Name: st_chip_out("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_chip_out"("chip") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_out';


ALTER FUNCTION "public"."st_chip_out"("chip") OWNER TO "postgres";

--
-- TOC entry 687 (class 1255 OID 17830)
-- Dependencies: 6 1321 1321 1321
-- Name: st_closestpoint("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_closestpoint"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_closestpoint';


ALTER FUNCTION "public"."st_closestpoint"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 688 (class 1255 OID 17831)
-- Dependencies: 6 1321 1323
-- Name: st_collect("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_collect"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_collect_garray';


ALTER FUNCTION "public"."st_collect"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 689 (class 1255 OID 17832)
-- Dependencies: 6 1321 1321 1321
-- Name: st_collect("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_collect"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'LWGEOM_collect';


ALTER FUNCTION "public"."st_collect"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 690 (class 1255 OID 17833)
-- Dependencies: 1321 6 1321
-- Name: st_collectionextract("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_collectionextract"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_CollectionExtract';


ALTER FUNCTION "public"."st_collectionextract"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 691 (class 1255 OID 17834)
-- Dependencies: 6 1321 1301 1301
-- Name: st_combine_bbox("box2d", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_combine_bbox"("box2d", "geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_combine';


ALTER FUNCTION "public"."st_combine_bbox"("box2d", "geometry") OWNER TO "postgres";

--
-- TOC entry 692 (class 1255 OID 17835)
-- Dependencies: 1321 1309 6 1309
-- Name: st_combine_bbox("box3d_extent", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_combine_bbox"("box3d_extent", "geometry") RETURNS "box3d_extent"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


ALTER FUNCTION "public"."st_combine_bbox"("box3d_extent", "geometry") OWNER TO "postgres";

--
-- TOC entry 693 (class 1255 OID 17836)
-- Dependencies: 1305 6 1305 1321
-- Name: st_combine_bbox("box3d", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_combine_bbox"("box3d", "geometry") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE
    AS '$libdir/postgis-1.5', 'BOX3D_combine';


ALTER FUNCTION "public"."st_combine_bbox"("box3d", "geometry") OWNER TO "postgres";

--
-- TOC entry 694 (class 1255 OID 17837)
-- Dependencies: 6 1313
-- Name: st_compression("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_compression"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getCompression';


ALTER FUNCTION "public"."st_compression"("chip") OWNER TO "postgres";

--
-- TOC entry 695 (class 1255 OID 17838)
-- Dependencies: 1321 6 1321
-- Name: st_contains("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_contains"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$;


ALTER FUNCTION "public"."st_contains"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 696 (class 1255 OID 17839)
-- Dependencies: 1321 6 1321
-- Name: st_containsproperly("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_containsproperly"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$;


ALTER FUNCTION "public"."st_containsproperly"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 697 (class 1255 OID 17840)
-- Dependencies: 1321 6 1321
-- Name: st_convexhull("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_convexhull"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'convexhull';


ALTER FUNCTION "public"."st_convexhull"("geometry") OWNER TO "postgres";

--
-- TOC entry 698 (class 1255 OID 17841)
-- Dependencies: 6 1321
-- Name: st_coorddim("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_coorddim"("geometry") RETURNS smallint
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


ALTER FUNCTION "public"."st_coorddim"("geometry") OWNER TO "postgres";

--
-- TOC entry 699 (class 1255 OID 17842)
-- Dependencies: 6 1321 1321
-- Name: st_coveredby("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_coveredby"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$;


ALTER FUNCTION "public"."st_coveredby"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 700 (class 1255 OID 17843)
-- Dependencies: 6 1317 1317
-- Name: st_coveredby("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_coveredby"("geography", "geography") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($2, $1)$_$;


ALTER FUNCTION "public"."st_coveredby"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 701 (class 1255 OID 17844)
-- Dependencies: 6
-- Name: st_coveredby("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_coveredby"("text", "text") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$ SELECT ST_CoveredBy($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION "public"."st_coveredby"("text", "text") OWNER TO "postgres";

--
-- TOC entry 702 (class 1255 OID 17845)
-- Dependencies: 1321 6 1321
-- Name: st_covers("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_covers"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$;


ALTER FUNCTION "public"."st_covers"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 703 (class 1255 OID 17846)
-- Dependencies: 1317 1317 6
-- Name: st_covers("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_covers"("geography", "geography") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT $1 && $2 AND _ST_Covers($1, $2)$_$;


ALTER FUNCTION "public"."st_covers"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 704 (class 1255 OID 17847)
-- Dependencies: 6
-- Name: st_covers("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_covers"("text", "text") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$ SELECT ST_Covers($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION "public"."st_covers"("text", "text") OWNER TO "postgres";

--
-- TOC entry 705 (class 1255 OID 17848)
-- Dependencies: 1321 6 1321
-- Name: st_crosses("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_crosses"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$;


ALTER FUNCTION "public"."st_crosses"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 706 (class 1255 OID 17849)
-- Dependencies: 1321 1321 6
-- Name: st_curvetoline("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_curvetoline"("geometry") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_CurveToLine($1, 32)$_$;


ALTER FUNCTION "public"."st_curvetoline"("geometry") OWNER TO "postgres";

--
-- TOC entry 707 (class 1255 OID 17850)
-- Dependencies: 1321 6 1321
-- Name: st_curvetoline("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_curvetoline"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_curve_segmentize';


ALTER FUNCTION "public"."st_curvetoline"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 708 (class 1255 OID 17851)
-- Dependencies: 1313 6
-- Name: st_datatype("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_datatype"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getDatatype';


ALTER FUNCTION "public"."st_datatype"("chip") OWNER TO "postgres";

--
-- TOC entry 709 (class 1255 OID 17852)
-- Dependencies: 1321 6 1321
-- Name: st_dfullywithin("geometry", "geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dfullywithin"("geometry", "geometry", double precision) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DFullyWithin(ST_ConvexHull($1), ST_ConvexHull($2), $3)$_$;


ALTER FUNCTION "public"."st_dfullywithin"("geometry", "geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 710 (class 1255 OID 17853)
-- Dependencies: 1321 1321 1321 6
-- Name: st_difference("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_difference"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'difference';


ALTER FUNCTION "public"."st_difference"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 711 (class 1255 OID 17854)
-- Dependencies: 1321 6
-- Name: st_dimension("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dimension"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dimension';


ALTER FUNCTION "public"."st_dimension"("geometry") OWNER TO "postgres";

--
-- TOC entry 712 (class 1255 OID 17855)
-- Dependencies: 1321 1321 6
-- Name: st_disjoint("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_disjoint"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'disjoint';


ALTER FUNCTION "public"."st_disjoint"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 713 (class 1255 OID 17856)
-- Dependencies: 1321 6 1321
-- Name: st_distance("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_distance"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_mindistance2d';


ALTER FUNCTION "public"."st_distance"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 714 (class 1255 OID 17857)
-- Dependencies: 6 1317 1317
-- Name: st_distance("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_distance"("geography", "geography") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, true)$_$;


ALTER FUNCTION "public"."st_distance"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 715 (class 1255 OID 17858)
-- Dependencies: 6
-- Name: st_distance("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_distance"("text", "text") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_Distance($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION "public"."st_distance"("text", "text") OWNER TO "postgres";

--
-- TOC entry 716 (class 1255 OID 17859)
-- Dependencies: 6 1317 1317
-- Name: st_distance("geography", "geography", boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_distance"("geography", "geography", boolean) RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_Distance($1, $2, 0.0, $3)$_$;


ALTER FUNCTION "public"."st_distance"("geography", "geography", boolean) OWNER TO "postgres";

--
-- TOC entry 717 (class 1255 OID 17860)
-- Dependencies: 6 1321 1321
-- Name: st_distance_sphere("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_distance_sphere"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_sphere';


ALTER FUNCTION "public"."st_distance_sphere"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 718 (class 1255 OID 17861)
-- Dependencies: 6 1321 1336 1321
-- Name: st_distance_spheroid("geometry", "geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_distance_spheroid"("geometry", "geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_distance_ellipsoid';


ALTER FUNCTION "public"."st_distance_spheroid"("geometry", "geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 719 (class 1255 OID 17862)
-- Dependencies: 6 1321 1325
-- Name: st_dump("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dump"("geometry") RETURNS SETOF "geometry_dump"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump';


ALTER FUNCTION "public"."st_dump"("geometry") OWNER TO "postgres";

--
-- TOC entry 720 (class 1255 OID 17863)
-- Dependencies: 6 1321 1325
-- Name: st_dumppoints("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dumppoints"("geometry") RETURNS SETOF "geometry_dump"
    LANGUAGE "sql" STRICT
    AS $_$
  SELECT * FROM _ST_DumpPoints($1, NULL);
$_$;


ALTER FUNCTION "public"."st_dumppoints"("geometry") OWNER TO "postgres";

--
-- TOC entry 721 (class 1255 OID 17864)
-- Dependencies: 1321 6 1325
-- Name: st_dumprings("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dumprings"("geometry") RETURNS SETOF "geometry_dump"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_dump_rings';


ALTER FUNCTION "public"."st_dumprings"("geometry") OWNER TO "postgres";

--
-- TOC entry 722 (class 1255 OID 17865)
-- Dependencies: 1321 6 1321
-- Name: st_dwithin("geometry", "geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dwithin"("geometry", "geometry", double precision) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$;


ALTER FUNCTION "public"."st_dwithin"("geometry", "geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 723 (class 1255 OID 17866)
-- Dependencies: 1317 1317 6
-- Name: st_dwithin("geography", "geography", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dwithin"("geography", "geography", double precision) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, true)$_$;


ALTER FUNCTION "public"."st_dwithin"("geography", "geography", double precision) OWNER TO "postgres";

--
-- TOC entry 724 (class 1255 OID 17867)
-- Dependencies: 6
-- Name: st_dwithin("text", "text", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dwithin"("text", "text", double precision) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$ SELECT ST_DWithin($1::geometry, $2::geometry, $3);  $_$;


ALTER FUNCTION "public"."st_dwithin"("text", "text", double precision) OWNER TO "postgres";

--
-- TOC entry 725 (class 1255 OID 17868)
-- Dependencies: 6 1317 1317
-- Name: st_dwithin("geography", "geography", double precision, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_dwithin"("geography", "geography", double precision, boolean) RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && _ST_Expand($2,$3) AND $2 && _ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."st_dwithin"("geography", "geography", double precision, boolean) OWNER TO "postgres";

--
-- TOC entry 726 (class 1255 OID 17869)
-- Dependencies: 1321 6 1321
-- Name: st_endpoint("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_endpoint"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_endpoint_linestring';


ALTER FUNCTION "public"."st_endpoint"("geometry") OWNER TO "postgres";

--
-- TOC entry 727 (class 1255 OID 17870)
-- Dependencies: 1321 1321 6
-- Name: st_envelope("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_envelope"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_envelope';


ALTER FUNCTION "public"."st_envelope"("geometry") OWNER TO "postgres";

--
-- TOC entry 728 (class 1255 OID 17871)
-- Dependencies: 1321 1321 6
-- Name: st_equals("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_equals"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Equals($1,$2)$_$;


ALTER FUNCTION "public"."st_equals"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 729 (class 1255 OID 17872)
-- Dependencies: 1301 6
-- Name: st_estimated_extent("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_estimated_extent"("text", "text") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


ALTER FUNCTION "public"."st_estimated_extent"("text", "text") OWNER TO "postgres";

--
-- TOC entry 730 (class 1255 OID 17873)
-- Dependencies: 6 1301
-- Name: st_estimated_extent("text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_estimated_extent"("text", "text", "text") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT SECURITY DEFINER
    AS '$libdir/postgis-1.5', 'LWGEOM_estimated_extent';


ALTER FUNCTION "public"."st_estimated_extent"("text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 731 (class 1255 OID 17874)
-- Dependencies: 6 1305 1305
-- Name: st_expand("box3d", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_expand"("box3d", double precision) RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_expand';


ALTER FUNCTION "public"."st_expand"("box3d", double precision) OWNER TO "postgres";

--
-- TOC entry 732 (class 1255 OID 17875)
-- Dependencies: 6 1301 1301
-- Name: st_expand("box2d", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_expand"("box2d", double precision) RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_expand';


ALTER FUNCTION "public"."st_expand"("box2d", double precision) OWNER TO "postgres";

--
-- TOC entry 733 (class 1255 OID 17876)
-- Dependencies: 6 1321 1321
-- Name: st_expand("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_expand"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_expand';


ALTER FUNCTION "public"."st_expand"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 734 (class 1255 OID 17877)
-- Dependencies: 6 1321 1321
-- Name: st_exteriorring("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_exteriorring"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_exteriorring_polygon';


ALTER FUNCTION "public"."st_exteriorring"("geometry") OWNER TO "postgres";

--
-- TOC entry 735 (class 1255 OID 17878)
-- Dependencies: 6 1313
-- Name: st_factor("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_factor"("chip") RETURNS real
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getFactor';


ALTER FUNCTION "public"."st_factor"("chip") OWNER TO "postgres";

--
-- TOC entry 736 (class 1255 OID 17879)
-- Dependencies: 6 1474 1301
-- Name: st_find_extent("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_find_extent"("text", "text") RETURNS "box2d"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION "public"."st_find_extent"("text", "text") OWNER TO "postgres";

--
-- TOC entry 737 (class 1255 OID 17880)
-- Dependencies: 6 1474 1301
-- Name: st_find_extent("text", "text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_find_extent"("text", "text", "text") RETURNS "box2d"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP;
END;
$_$;


ALTER FUNCTION "public"."st_find_extent"("text", "text", "text") OWNER TO "postgres";

--
-- TOC entry 738 (class 1255 OID 17881)
-- Dependencies: 6 1321 1321
-- Name: st_force_2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_force_2d"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_2d';


ALTER FUNCTION "public"."st_force_2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 739 (class 1255 OID 17882)
-- Dependencies: 6 1321 1321
-- Name: st_force_3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_force_3d"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


ALTER FUNCTION "public"."st_force_3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 740 (class 1255 OID 17883)
-- Dependencies: 6 1321 1321
-- Name: st_force_3dm("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_force_3dm"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dm';


ALTER FUNCTION "public"."st_force_3dm"("geometry") OWNER TO "postgres";

--
-- TOC entry 741 (class 1255 OID 17884)
-- Dependencies: 6 1321 1321
-- Name: st_force_3dz("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_force_3dz"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_3dz';


ALTER FUNCTION "public"."st_force_3dz"("geometry") OWNER TO "postgres";

--
-- TOC entry 742 (class 1255 OID 17885)
-- Dependencies: 1321 6 1321
-- Name: st_force_4d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_force_4d"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_4d';


ALTER FUNCTION "public"."st_force_4d"("geometry") OWNER TO "postgres";

--
-- TOC entry 743 (class 1255 OID 17886)
-- Dependencies: 6 1321 1321
-- Name: st_force_collection("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_force_collection"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_collection';


ALTER FUNCTION "public"."st_force_collection"("geometry") OWNER TO "postgres";

--
-- TOC entry 744 (class 1255 OID 17887)
-- Dependencies: 1321 6 1321
-- Name: st_forcerhr("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_forcerhr"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_forceRHR_poly';


ALTER FUNCTION "public"."st_forcerhr"("geometry") OWNER TO "postgres";

--
-- TOC entry 745 (class 1255 OID 17888)
-- Dependencies: 6 1317
-- Name: st_geogfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geogfromtext"("text") RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_text';


ALTER FUNCTION "public"."st_geogfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 746 (class 1255 OID 17889)
-- Dependencies: 6 1317
-- Name: st_geogfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geogfromwkb"("bytea") RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_binary';


ALTER FUNCTION "public"."st_geogfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 747 (class 1255 OID 17890)
-- Dependencies: 1317 6
-- Name: st_geographyfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geographyfromtext"("text") RETURNS "geography"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geography_from_text';


ALTER FUNCTION "public"."st_geographyfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 748 (class 1255 OID 17891)
-- Dependencies: 6 1321
-- Name: st_geohash("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geohash"("geometry") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_GeoHash($1, 0)$_$;


ALTER FUNCTION "public"."st_geohash"("geometry") OWNER TO "postgres";

--
-- TOC entry 749 (class 1255 OID 17892)
-- Dependencies: 6 1321
-- Name: st_geohash("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geohash"("geometry", integer) RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_GeoHash';


ALTER FUNCTION "public"."st_geohash"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 750 (class 1255 OID 17893)
-- Dependencies: 6 1321
-- Name: st_geomcollfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomcollfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_geomcollfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 751 (class 1255 OID 17894)
-- Dependencies: 6 1321
-- Name: st_geomcollfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomcollfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_geomcollfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 752 (class 1255 OID 17895)
-- Dependencies: 6 1321
-- Name: st_geomcollfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomcollfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_geomcollfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 753 (class 1255 OID 17896)
-- Dependencies: 6 1321
-- Name: st_geomcollfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomcollfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_geomcollfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 754 (class 1255 OID 17897)
-- Dependencies: 6 1321 1301
-- Name: st_geometry("box2d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry"("box2d") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_to_LWGEOM';


ALTER FUNCTION "public"."st_geometry"("box2d") OWNER TO "postgres";

--
-- TOC entry 755 (class 1255 OID 17898)
-- Dependencies: 6 1321 1305
-- Name: st_geometry("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry"("box3d") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


ALTER FUNCTION "public"."st_geometry"("box3d") OWNER TO "postgres";

--
-- TOC entry 756 (class 1255 OID 17899)
-- Dependencies: 6 1321
-- Name: st_geometry("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


ALTER FUNCTION "public"."st_geometry"("text") OWNER TO "postgres";

--
-- TOC entry 757 (class 1255 OID 17900)
-- Dependencies: 6 1321 1313
-- Name: st_geometry("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry"("chip") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_to_LWGEOM';


ALTER FUNCTION "public"."st_geometry"("chip") OWNER TO "postgres";

--
-- TOC entry 758 (class 1255 OID 17901)
-- Dependencies: 6 1321
-- Name: st_geometry("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_bytea';


ALTER FUNCTION "public"."st_geometry"("bytea") OWNER TO "postgres";

--
-- TOC entry 759 (class 1255 OID 17902)
-- Dependencies: 6 1321 1309
-- Name: st_geometry("box3d_extent"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry"("box3d_extent") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_to_LWGEOM';


ALTER FUNCTION "public"."st_geometry"("box3d_extent") OWNER TO "postgres";

--
-- TOC entry 760 (class 1255 OID 17903)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_above("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_above"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_above';


ALTER FUNCTION "public"."st_geometry_above"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 761 (class 1255 OID 17904)
-- Dependencies: 6
-- Name: st_geometry_analyze("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_analyze"("internal") RETURNS boolean
    LANGUAGE "c" STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_analyze';


ALTER FUNCTION "public"."st_geometry_analyze"("internal") OWNER TO "postgres";

--
-- TOC entry 762 (class 1255 OID 17905)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_below("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_below"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_below';


ALTER FUNCTION "public"."st_geometry_below"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 763 (class 1255 OID 17906)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_cmp("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_cmp"("geometry", "geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_cmp';


ALTER FUNCTION "public"."st_geometry_cmp"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 764 (class 1255 OID 17907)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_contain("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_contain"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contain';


ALTER FUNCTION "public"."st_geometry_contain"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 765 (class 1255 OID 17908)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_contained("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_contained"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_contained';


ALTER FUNCTION "public"."st_geometry_contained"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 766 (class 1255 OID 17909)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_eq("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_eq"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_eq';


ALTER FUNCTION "public"."st_geometry_eq"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 767 (class 1255 OID 17910)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_ge("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_ge"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_ge';


ALTER FUNCTION "public"."st_geometry_ge"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 768 (class 1255 OID 17911)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_gt("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_gt"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_gt';


ALTER FUNCTION "public"."st_geometry_gt"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 769 (class 1255 OID 17912)
-- Dependencies: 6 1321
-- Name: st_geometry_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_in"("cstring") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_in';


ALTER FUNCTION "public"."st_geometry_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 770 (class 1255 OID 17913)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_le("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_le"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_le';


ALTER FUNCTION "public"."st_geometry_le"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 771 (class 1255 OID 17914)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_left("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_left"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_left';


ALTER FUNCTION "public"."st_geometry_left"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 772 (class 1255 OID 17915)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_lt("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_lt"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'lwgeom_lt';


ALTER FUNCTION "public"."st_geometry_lt"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 773 (class 1255 OID 17916)
-- Dependencies: 6 1321
-- Name: st_geometry_out("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_out"("geometry") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_out';


ALTER FUNCTION "public"."st_geometry_out"("geometry") OWNER TO "postgres";

--
-- TOC entry 774 (class 1255 OID 17917)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_overabove("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_overabove"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overabove';


ALTER FUNCTION "public"."st_geometry_overabove"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 775 (class 1255 OID 17918)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_overbelow("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_overbelow"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overbelow';


ALTER FUNCTION "public"."st_geometry_overbelow"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 776 (class 1255 OID 17919)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_overlap("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_overlap"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overlap';


ALTER FUNCTION "public"."st_geometry_overlap"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 777 (class 1255 OID 17920)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_overleft("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_overleft"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overleft';


ALTER FUNCTION "public"."st_geometry_overleft"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 778 (class 1255 OID 17921)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_overright("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_overright"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_overright';


ALTER FUNCTION "public"."st_geometry_overright"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 779 (class 1255 OID 17922)
-- Dependencies: 6 1321
-- Name: st_geometry_recv("internal"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_recv"("internal") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_recv';


ALTER FUNCTION "public"."st_geometry_recv"("internal") OWNER TO "postgres";

--
-- TOC entry 780 (class 1255 OID 17923)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_right("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_right"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_right';


ALTER FUNCTION "public"."st_geometry_right"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 781 (class 1255 OID 17924)
-- Dependencies: 6 1321 1321
-- Name: st_geometry_same("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_same"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_samebox';


ALTER FUNCTION "public"."st_geometry_same"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 782 (class 1255 OID 17925)
-- Dependencies: 6 1321
-- Name: st_geometry_send("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometry_send"("geometry") RETURNS "bytea"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_send';


ALTER FUNCTION "public"."st_geometry_send"("geometry") OWNER TO "postgres";

--
-- TOC entry 783 (class 1255 OID 17926)
-- Dependencies: 6 1321
-- Name: st_geometryfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometryfromtext"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."st_geometryfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 784 (class 1255 OID 17927)
-- Dependencies: 6 1321
-- Name: st_geometryfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometryfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."st_geometryfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 785 (class 1255 OID 17928)
-- Dependencies: 6 1321 1321
-- Name: st_geometryn("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometryn"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_geometryn_collection';


ALTER FUNCTION "public"."st_geometryn"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 786 (class 1255 OID 17929)
-- Dependencies: 6 1321
-- Name: st_geometrytype("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geometrytype"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geometry_geometrytype';


ALTER FUNCTION "public"."st_geometrytype"("geometry") OWNER TO "postgres";

--
-- TOC entry 787 (class 1255 OID 17930)
-- Dependencies: 6 1321
-- Name: st_geomfromewkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromewkb"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOMFromWKB';


ALTER FUNCTION "public"."st_geomfromewkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 788 (class 1255 OID 17931)
-- Dependencies: 6 1321
-- Name: st_geomfromewkt("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromewkt"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'parse_WKT_lwgeom';


ALTER FUNCTION "public"."st_geomfromewkt"("text") OWNER TO "postgres";

--
-- TOC entry 789 (class 1255 OID 17932)
-- Dependencies: 6 1321
-- Name: st_geomfromgml("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromgml"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geom_from_gml';


ALTER FUNCTION "public"."st_geomfromgml"("text") OWNER TO "postgres";

--
-- TOC entry 790 (class 1255 OID 17933)
-- Dependencies: 6 1321
-- Name: st_geomfromkml("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromkml"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geom_from_kml';


ALTER FUNCTION "public"."st_geomfromkml"("text") OWNER TO "postgres";

--
-- TOC entry 791 (class 1255 OID 17934)
-- Dependencies: 6 1321
-- Name: st_geomfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromtext"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."st_geomfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 792 (class 1255 OID 17935)
-- Dependencies: 6 1321
-- Name: st_geomfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."st_geomfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 793 (class 1255 OID 17936)
-- Dependencies: 6 1321
-- Name: st_geomfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


ALTER FUNCTION "public"."st_geomfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 794 (class 1255 OID 17937)
-- Dependencies: 6 1321
-- Name: st_geomfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_geomfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$;


ALTER FUNCTION "public"."st_geomfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 795 (class 1255 OID 17938)
-- Dependencies: 6 1321
-- Name: st_gmltosql("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_gmltosql"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geom_from_gml';


ALTER FUNCTION "public"."st_gmltosql"("text") OWNER TO "postgres";

--
-- TOC entry 796 (class 1255 OID 17939)
-- Dependencies: 6 1321
-- Name: st_hasarc("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_hasarc"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_has_arc';


ALTER FUNCTION "public"."st_hasarc"("geometry") OWNER TO "postgres";

--
-- TOC entry 797 (class 1255 OID 17940)
-- Dependencies: 6 1321 1321
-- Name: st_hausdorffdistance("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_hausdorffdistance"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'hausdorffdistance';


ALTER FUNCTION "public"."st_hausdorffdistance"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 798 (class 1255 OID 17941)
-- Dependencies: 6 1321 1321
-- Name: st_hausdorffdistance("geometry", "geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_hausdorffdistance"("geometry", "geometry", double precision) RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'hausdorffdistancedensify';


ALTER FUNCTION "public"."st_hausdorffdistance"("geometry", "geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 799 (class 1255 OID 17942)
-- Dependencies: 6 1313
-- Name: st_height("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_height"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getHeight';


ALTER FUNCTION "public"."st_height"("chip") OWNER TO "postgres";

--
-- TOC entry 800 (class 1255 OID 17943)
-- Dependencies: 6 1321 1321
-- Name: st_interiorringn("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_interiorringn"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_interiorringn_polygon';


ALTER FUNCTION "public"."st_interiorringn"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 801 (class 1255 OID 17944)
-- Dependencies: 6 1321 1321 1321
-- Name: st_intersection("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_intersection"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'intersection';


ALTER FUNCTION "public"."st_intersection"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 802 (class 1255 OID 17945)
-- Dependencies: 6 1317 1317 1317
-- Name: st_intersection("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_intersection"("geography", "geography") RETURNS "geography"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT geography(ST_Transform(ST_Intersection(ST_Transform(geometry($1), _ST_BestSRID($1, $2)), ST_Transform(geometry($2), _ST_BestSRID($1, $2))), 4326))$_$;


ALTER FUNCTION "public"."st_intersection"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 803 (class 1255 OID 17946)
-- Dependencies: 6 1321
-- Name: st_intersection("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_intersection"("text", "text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_Intersection($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION "public"."st_intersection"("text", "text") OWNER TO "postgres";

--
-- TOC entry 804 (class 1255 OID 17947)
-- Dependencies: 6 1321 1321
-- Name: st_intersects("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_intersects"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$;


ALTER FUNCTION "public"."st_intersects"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 805 (class 1255 OID 17948)
-- Dependencies: 6 1317 1317
-- Name: st_intersects("geography", "geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_intersects"("geography", "geography") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Distance($1, $2, 0.0, false) < 0.00001$_$;


ALTER FUNCTION "public"."st_intersects"("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 806 (class 1255 OID 17949)
-- Dependencies: 6
-- Name: st_intersects("text", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_intersects"("text", "text") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$ SELECT ST_Intersects($1::geometry, $2::geometry);  $_$;


ALTER FUNCTION "public"."st_intersects"("text", "text") OWNER TO "postgres";

--
-- TOC entry 807 (class 1255 OID 17950)
-- Dependencies: 1321 6
-- Name: st_isclosed("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_isclosed"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isclosed_linestring';


ALTER FUNCTION "public"."st_isclosed"("geometry") OWNER TO "postgres";

--
-- TOC entry 808 (class 1255 OID 17951)
-- Dependencies: 6 1321
-- Name: st_isempty("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_isempty"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_isempty';


ALTER FUNCTION "public"."st_isempty"("geometry") OWNER TO "postgres";

--
-- TOC entry 809 (class 1255 OID 17952)
-- Dependencies: 6 1321
-- Name: st_isring("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_isring"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'isring';


ALTER FUNCTION "public"."st_isring"("geometry") OWNER TO "postgres";

--
-- TOC entry 810 (class 1255 OID 17953)
-- Dependencies: 6 1321
-- Name: st_issimple("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_issimple"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'issimple';


ALTER FUNCTION "public"."st_issimple"("geometry") OWNER TO "postgres";

--
-- TOC entry 811 (class 1255 OID 17954)
-- Dependencies: 6 1321
-- Name: st_isvalid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_isvalid"("geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'isvalid';


ALTER FUNCTION "public"."st_isvalid"("geometry") OWNER TO "postgres";

--
-- TOC entry 812 (class 1255 OID 17955)
-- Dependencies: 6 1321
-- Name: st_isvalidreason("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_isvalidreason"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'isvalidreason';


ALTER FUNCTION "public"."st_isvalidreason"("geometry") OWNER TO "postgres";

--
-- TOC entry 813 (class 1255 OID 17956)
-- Dependencies: 6 1321
-- Name: st_length("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


ALTER FUNCTION "public"."st_length"("geometry") OWNER TO "postgres";

--
-- TOC entry 814 (class 1255 OID 17957)
-- Dependencies: 6 1317
-- Name: st_length("geography"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length"("geography") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT ST_Length($1, true)$_$;


ALTER FUNCTION "public"."st_length"("geography") OWNER TO "postgres";

--
-- TOC entry 815 (class 1255 OID 17958)
-- Dependencies: 6
-- Name: st_length("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length"("text") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT ST_Length($1::geometry);  $_$;


ALTER FUNCTION "public"."st_length"("text") OWNER TO "postgres";

--
-- TOC entry 816 (class 1255 OID 17959)
-- Dependencies: 6 1317
-- Name: st_length("geography", boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length"("geography", boolean) RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'geography_length';


ALTER FUNCTION "public"."st_length"("geography", boolean) OWNER TO "postgres";

--
-- TOC entry 817 (class 1255 OID 17960)
-- Dependencies: 6 1321
-- Name: st_length2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length2d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_linestring';


ALTER FUNCTION "public"."st_length2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 818 (class 1255 OID 17961)
-- Dependencies: 6 1321 1336
-- Name: st_length2d_spheroid("geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length2d_spheroid"("geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length2d_ellipsoid';


ALTER FUNCTION "public"."st_length2d_spheroid"("geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 819 (class 1255 OID 17962)
-- Dependencies: 6 1321
-- Name: st_length3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length3d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_length_linestring';


ALTER FUNCTION "public"."st_length3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 820 (class 1255 OID 17963)
-- Dependencies: 6 1321 1336
-- Name: st_length3d_spheroid("geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length3d_spheroid"("geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION "public"."st_length3d_spheroid"("geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 821 (class 1255 OID 17964)
-- Dependencies: 6 1321 1336
-- Name: st_length_spheroid("geometry", "spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_length_spheroid"("geometry", "spheroid") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'LWGEOM_length_ellipsoid_linestring';


ALTER FUNCTION "public"."st_length_spheroid"("geometry", "spheroid") OWNER TO "postgres";

--
-- TOC entry 822 (class 1255 OID 17965)
-- Dependencies: 6 1321 1321
-- Name: st_line_interpolate_point("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_line_interpolate_point"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_interpolate_point';


ALTER FUNCTION "public"."st_line_interpolate_point"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 823 (class 1255 OID 17966)
-- Dependencies: 6 1321 1321
-- Name: st_line_locate_point("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_line_locate_point"("geometry", "geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_locate_point';


ALTER FUNCTION "public"."st_line_locate_point"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 824 (class 1255 OID 17967)
-- Dependencies: 6 1321 1321
-- Name: st_line_substring("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_line_substring"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_substring';


ALTER FUNCTION "public"."st_line_substring"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 825 (class 1255 OID 17968)
-- Dependencies: 6 1321 1321
-- Name: st_linecrossingdirection("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linecrossingdirection"("geometry", "geometry") RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$;


ALTER FUNCTION "public"."st_linecrossingdirection"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 826 (class 1255 OID 17969)
-- Dependencies: 6 1321 1321
-- Name: st_linefrommultipoint("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linefrommultipoint"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_from_mpoint';


ALTER FUNCTION "public"."st_linefrommultipoint"("geometry") OWNER TO "postgres";

--
-- TOC entry 827 (class 1255 OID 17970)
-- Dependencies: 6 1321
-- Name: st_linefromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linefromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_linefromtext"("text") OWNER TO "postgres";

--
-- TOC entry 828 (class 1255 OID 17971)
-- Dependencies: 6 1321
-- Name: st_linefromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linefromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_linefromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 829 (class 1255 OID 17972)
-- Dependencies: 6 1321
-- Name: st_linefromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linefromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_linefromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 830 (class 1255 OID 17973)
-- Dependencies: 6 1321
-- Name: st_linefromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linefromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_linefromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 831 (class 1255 OID 17974)
-- Dependencies: 6 1321 1321
-- Name: st_linemerge("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linemerge"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'linemerge';


ALTER FUNCTION "public"."st_linemerge"("geometry") OWNER TO "postgres";

--
-- TOC entry 832 (class 1255 OID 17975)
-- Dependencies: 6 1321
-- Name: st_linestringfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linestringfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_linestringfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 833 (class 1255 OID 17976)
-- Dependencies: 6 1321
-- Name: st_linestringfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linestringfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_linestringfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 834 (class 1255 OID 17977)
-- Dependencies: 6 1321 1321
-- Name: st_linetocurve("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_linetocurve"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_line_desegmentize';


ALTER FUNCTION "public"."st_linetocurve"("geometry") OWNER TO "postgres";

--
-- TOC entry 835 (class 1255 OID 17978)
-- Dependencies: 6 1321 1321
-- Name: st_locate_along_measure("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_locate_along_measure"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$;


ALTER FUNCTION "public"."st_locate_along_measure"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 836 (class 1255 OID 17979)
-- Dependencies: 6 1321 1321
-- Name: st_locate_between_measures("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_locate_between_measures"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_locate_between_m';


ALTER FUNCTION "public"."st_locate_between_measures"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 837 (class 1255 OID 17980)
-- Dependencies: 1321 6 1321
-- Name: st_locatebetweenelevations("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_locatebetweenelevations"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_LocateBetweenElevations';


ALTER FUNCTION "public"."st_locatebetweenelevations"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 838 (class 1255 OID 17981)
-- Dependencies: 1321 6 1321 1321
-- Name: st_longestline("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_longestline"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_LongestLine(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


ALTER FUNCTION "public"."st_longestline"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 839 (class 1255 OID 17982)
-- Dependencies: 1321 6
-- Name: st_m("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_m"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_m_point';


ALTER FUNCTION "public"."st_m"("geometry") OWNER TO "postgres";

--
-- TOC entry 840 (class 1255 OID 17983)
-- Dependencies: 1321 1321 1301 6
-- Name: st_makebox2d("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makebox2d"("geometry", "geometry") RETURNS "box2d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX2DFLOAT4_construct';


ALTER FUNCTION "public"."st_makebox2d"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 841 (class 1255 OID 17984)
-- Dependencies: 1321 1305 6 1321
-- Name: st_makebox3d("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makebox3d"("geometry", "geometry") RETURNS "box3d"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_construct';


ALTER FUNCTION "public"."st_makebox3d"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 842 (class 1255 OID 17985)
-- Dependencies: 6 1321
-- Name: st_makeenvelope(double precision, double precision, double precision, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makeenvelope"(double precision, double precision, double precision, double precision, integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ST_MakeEnvelope';


ALTER FUNCTION "public"."st_makeenvelope"(double precision, double precision, double precision, double precision, integer) OWNER TO "postgres";

--
-- TOC entry 843 (class 1255 OID 17986)
-- Dependencies: 1323 6 1321
-- Name: st_makeline("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makeline"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


ALTER FUNCTION "public"."st_makeline"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 844 (class 1255 OID 17987)
-- Dependencies: 6 1321 1321 1321
-- Name: st_makeline("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makeline"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline';


ALTER FUNCTION "public"."st_makeline"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 845 (class 1255 OID 17988)
-- Dependencies: 6 1321 1323
-- Name: st_makeline_garray("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makeline_garray"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makeline_garray';


ALTER FUNCTION "public"."st_makeline_garray"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 846 (class 1255 OID 17989)
-- Dependencies: 6 1321
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makepoint"(double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."st_makepoint"(double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 847 (class 1255 OID 17990)
-- Dependencies: 6 1321
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makepoint"(double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."st_makepoint"(double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 848 (class 1255 OID 17991)
-- Dependencies: 1321 6
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makepoint"(double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."st_makepoint"(double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 849 (class 1255 OID 17992)
-- Dependencies: 1321 6
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makepointm"(double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint3dm';


ALTER FUNCTION "public"."st_makepointm"(double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 850 (class 1255 OID 17993)
-- Dependencies: 1321 6 1321
-- Name: st_makepolygon("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makepolygon"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


ALTER FUNCTION "public"."st_makepolygon"("geometry") OWNER TO "postgres";

--
-- TOC entry 851 (class 1255 OID 17994)
-- Dependencies: 1321 1323 1321 6
-- Name: st_makepolygon("geometry", "geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_makepolygon"("geometry", "geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoly';


ALTER FUNCTION "public"."st_makepolygon"("geometry", "geometry"[]) OWNER TO "postgres";

--
-- TOC entry 852 (class 1255 OID 17995)
-- Dependencies: 6 1321 1321
-- Name: st_maxdistance("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_maxdistance"("geometry", "geometry") RETURNS double precision
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT _ST_MaxDistance(ST_ConvexHull($1), ST_ConvexHull($2))$_$;


ALTER FUNCTION "public"."st_maxdistance"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 853 (class 1255 OID 17996)
-- Dependencies: 6 1321
-- Name: st_mem_size("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mem_size"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_mem_size';


ALTER FUNCTION "public"."st_mem_size"("geometry") OWNER TO "postgres";

--
-- TOC entry 854 (class 1255 OID 17997)
-- Dependencies: 6 1321 1321
-- Name: st_minimumboundingcircle("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_minimumboundingcircle"("geometry") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$;


ALTER FUNCTION "public"."st_minimumboundingcircle"("geometry") OWNER TO "postgres";

--
-- TOC entry 855 (class 1255 OID 17998)
-- Dependencies: 6 1474 1321 1321
-- Name: st_minimumboundingcircle("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_minimumboundingcircle"("inputgeom" "geometry", "segs_per_quarter" integer) RETURNS "geometry"
    LANGUAGE "plpgsql" IMMUTABLE STRICT
    AS $$
	DECLARE
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;


	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN MakeLine(PointN(ring,idx1),PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.

	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.

				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_line_interpolate_point(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Translate(ST_Rotate(ST_Translate(l1,-X(p1),-Y(p1)),pi()/2),X(p1),Y(p1));
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,2))+sin(a1)*dist,Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,1))-sin(a1)*dist,Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_Line_interpolate_point(l2,0.5);
				l2 = ST_Translate(ST_Rotate(ST_Translate(l2,-X(p2),-Y(p2)),pi()/2),X(p2),Y(p2));
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,2))+sin(a2)*dist,Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,1))-sin(a2)*dist,Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$;


ALTER FUNCTION "public"."st_minimumboundingcircle"("inputgeom" "geometry", "segs_per_quarter" integer) OWNER TO "postgres";

--
-- TOC entry 856 (class 1255 OID 18000)
-- Dependencies: 6 1321
-- Name: st_mlinefromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mlinefromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mlinefromtext"("text") OWNER TO "postgres";

--
-- TOC entry 857 (class 1255 OID 18001)
-- Dependencies: 6 1321
-- Name: st_mlinefromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mlinefromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mlinefromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 858 (class 1255 OID 18002)
-- Dependencies: 6 1321
-- Name: st_mlinefromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mlinefromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mlinefromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 859 (class 1255 OID 18003)
-- Dependencies: 6 1321
-- Name: st_mlinefromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mlinefromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mlinefromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 860 (class 1255 OID 18004)
-- Dependencies: 6 1321
-- Name: st_mpointfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpointfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpointfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 861 (class 1255 OID 18005)
-- Dependencies: 6 1321
-- Name: st_mpointfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpointfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpointfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 862 (class 1255 OID 18006)
-- Dependencies: 6 1321
-- Name: st_mpointfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpointfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpointfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 863 (class 1255 OID 18007)
-- Dependencies: 6 1321
-- Name: st_mpointfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpointfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpointfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 864 (class 1255 OID 18008)
-- Dependencies: 6 1321
-- Name: st_mpolyfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpolyfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpolyfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 865 (class 1255 OID 18009)
-- Dependencies: 1321 6
-- Name: st_mpolyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpolyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpolyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 866 (class 1255 OID 18010)
-- Dependencies: 6 1321
-- Name: st_mpolyfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpolyfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpolyfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 867 (class 1255 OID 18011)
-- Dependencies: 6 1321
-- Name: st_mpolyfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_mpolyfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_mpolyfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 868 (class 1255 OID 18012)
-- Dependencies: 1321 6 1321
-- Name: st_multi("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multi"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_force_multi';


ALTER FUNCTION "public"."st_multi"("geometry") OWNER TO "postgres";

--
-- TOC entry 869 (class 1255 OID 18013)
-- Dependencies: 6 1321
-- Name: st_multilinefromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multilinefromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_multilinefromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 870 (class 1255 OID 18014)
-- Dependencies: 6 1321
-- Name: st_multilinestringfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multilinestringfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_MLineFromText($1)$_$;


ALTER FUNCTION "public"."st_multilinestringfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 871 (class 1255 OID 18015)
-- Dependencies: 6 1321
-- Name: st_multilinestringfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multilinestringfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MLineFromText($1, $2)$_$;


ALTER FUNCTION "public"."st_multilinestringfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 872 (class 1255 OID 18016)
-- Dependencies: 6 1321
-- Name: st_multipointfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipointfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPointFromText($1)$_$;


ALTER FUNCTION "public"."st_multipointfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 873 (class 1255 OID 18017)
-- Dependencies: 6 1321
-- Name: st_multipointfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipointfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_multipointfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 874 (class 1255 OID 18018)
-- Dependencies: 6 1321
-- Name: st_multipointfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipointfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_multipointfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 875 (class 1255 OID 18019)
-- Dependencies: 6 1321
-- Name: st_multipolyfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipolyfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_multipolyfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 876 (class 1255 OID 18020)
-- Dependencies: 6 1321
-- Name: st_multipolyfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipolyfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_multipolyfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 877 (class 1255 OID 18021)
-- Dependencies: 6 1321
-- Name: st_multipolygonfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipolygonfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1)$_$;


ALTER FUNCTION "public"."st_multipolygonfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 878 (class 1255 OID 18022)
-- Dependencies: 6 1321
-- Name: st_multipolygonfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_multipolygonfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT MPolyFromText($1, $2)$_$;


ALTER FUNCTION "public"."st_multipolygonfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 879 (class 1255 OID 18023)
-- Dependencies: 1321 6
-- Name: st_ndims("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_ndims"("geometry") RETURNS smallint
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_ndims';


ALTER FUNCTION "public"."st_ndims"("geometry") OWNER TO "postgres";

--
-- TOC entry 880 (class 1255 OID 18024)
-- Dependencies: 6 1321
-- Name: st_npoints("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_npoints"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_npoints';


ALTER FUNCTION "public"."st_npoints"("geometry") OWNER TO "postgres";

--
-- TOC entry 881 (class 1255 OID 18025)
-- Dependencies: 6 1321
-- Name: st_nrings("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_nrings"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_nrings';


ALTER FUNCTION "public"."st_nrings"("geometry") OWNER TO "postgres";

--
-- TOC entry 882 (class 1255 OID 18026)
-- Dependencies: 6 1321
-- Name: st_numgeometries("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_numgeometries"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numgeometries_collection';


ALTER FUNCTION "public"."st_numgeometries"("geometry") OWNER TO "postgres";

--
-- TOC entry 883 (class 1255 OID 18027)
-- Dependencies: 6 1321
-- Name: st_numinteriorring("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_numinteriorring"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION "public"."st_numinteriorring"("geometry") OWNER TO "postgres";

--
-- TOC entry 884 (class 1255 OID 18028)
-- Dependencies: 6 1321
-- Name: st_numinteriorrings("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_numinteriorrings"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numinteriorrings_polygon';


ALTER FUNCTION "public"."st_numinteriorrings"("geometry") OWNER TO "postgres";

--
-- TOC entry 885 (class 1255 OID 18029)
-- Dependencies: 1321 6
-- Name: st_numpoints("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_numpoints"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_numpoints_linestring';


ALTER FUNCTION "public"."st_numpoints"("geometry") OWNER TO "postgres";

--
-- TOC entry 886 (class 1255 OID 18030)
-- Dependencies: 1321 1321 6
-- Name: st_orderingequals("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_orderingequals"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ 
	SELECT $1 ~= $2 AND _ST_OrderingEquals($1, $2)
	$_$;


ALTER FUNCTION "public"."st_orderingequals"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 887 (class 1255 OID 18031)
-- Dependencies: 1321 6 1321
-- Name: st_overlaps("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_overlaps"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$;


ALTER FUNCTION "public"."st_overlaps"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 888 (class 1255 OID 18032)
-- Dependencies: 1321 6
-- Name: st_perimeter("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_perimeter"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION "public"."st_perimeter"("geometry") OWNER TO "postgres";

--
-- TOC entry 889 (class 1255 OID 18033)
-- Dependencies: 6 1321
-- Name: st_perimeter2d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_perimeter2d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter2d_poly';


ALTER FUNCTION "public"."st_perimeter2d"("geometry") OWNER TO "postgres";

--
-- TOC entry 890 (class 1255 OID 18034)
-- Dependencies: 1321 6
-- Name: st_perimeter3d("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_perimeter3d"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_perimeter_poly';


ALTER FUNCTION "public"."st_perimeter3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 891 (class 1255 OID 18035)
-- Dependencies: 1321 6
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_point"(double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_makepoint';


ALTER FUNCTION "public"."st_point"(double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 892 (class 1255 OID 18036)
-- Dependencies: 6 1321
-- Name: st_point_inside_circle("geometry", double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_point_inside_circle"("geometry", double precision, double precision, double precision) RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_inside_circle_point';


ALTER FUNCTION "public"."st_point_inside_circle"("geometry", double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 893 (class 1255 OID 18037)
-- Dependencies: 1321 6
-- Name: st_pointfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_pointfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_pointfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 894 (class 1255 OID 18038)
-- Dependencies: 1321 6
-- Name: st_pointfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_pointfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_pointfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 895 (class 1255 OID 18039)
-- Dependencies: 6 1321
-- Name: st_pointfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_pointfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_pointfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 896 (class 1255 OID 18040)
-- Dependencies: 1321 6
-- Name: st_pointfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_pointfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_pointfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 897 (class 1255 OID 18041)
-- Dependencies: 1321 1321 6
-- Name: st_pointn("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_pointn"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_pointn_linestring';


ALTER FUNCTION "public"."st_pointn"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 898 (class 1255 OID 18042)
-- Dependencies: 1321 1321 6
-- Name: st_pointonsurface("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_pointonsurface"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'pointonsurface';


ALTER FUNCTION "public"."st_pointonsurface"("geometry") OWNER TO "postgres";

--
-- TOC entry 899 (class 1255 OID 18043)
-- Dependencies: 6 1321
-- Name: st_polyfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polyfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_polyfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 900 (class 1255 OID 18044)
-- Dependencies: 1321 6
-- Name: st_polyfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polyfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_polyfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 901 (class 1255 OID 18045)
-- Dependencies: 6 1321
-- Name: st_polyfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polyfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_polyfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 902 (class 1255 OID 18046)
-- Dependencies: 6 1321
-- Name: st_polyfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polyfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_polyfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 903 (class 1255 OID 18047)
-- Dependencies: 1321 6 1321
-- Name: st_polygon("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygon"("geometry", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$ 
	SELECT setSRID(makepolygon($1), $2)
	$_$;


ALTER FUNCTION "public"."st_polygon"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 904 (class 1255 OID 18048)
-- Dependencies: 1321 6
-- Name: st_polygonfromtext("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygonfromtext"("text") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_PolyFromText($1)$_$;


ALTER FUNCTION "public"."st_polygonfromtext"("text") OWNER TO "postgres";

--
-- TOC entry 905 (class 1255 OID 18049)
-- Dependencies: 1321 6
-- Name: st_polygonfromtext("text", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygonfromtext"("text", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT PolyFromText($1, $2)$_$;


ALTER FUNCTION "public"."st_polygonfromtext"("text", integer) OWNER TO "postgres";

--
-- TOC entry 906 (class 1255 OID 18050)
-- Dependencies: 6 1321
-- Name: st_polygonfromwkb("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygonfromwkb"("bytea") RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_polygonfromwkb"("bytea") OWNER TO "postgres";

--
-- TOC entry 907 (class 1255 OID 18051)
-- Dependencies: 1321 6
-- Name: st_polygonfromwkb("bytea", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygonfromwkb"("bytea", integer) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$;


ALTER FUNCTION "public"."st_polygonfromwkb"("bytea", integer) OWNER TO "postgres";

--
-- TOC entry 908 (class 1255 OID 18052)
-- Dependencies: 1321 6 1323
-- Name: st_polygonize("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygonize"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'polygonize_garray';


ALTER FUNCTION "public"."st_polygonize"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 909 (class 1255 OID 18053)
-- Dependencies: 1323 1321 6
-- Name: st_polygonize_garray("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_polygonize_garray"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'polygonize_garray';


ALTER FUNCTION "public"."st_polygonize_garray"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 910 (class 1255 OID 18054)
-- Dependencies: 6
-- Name: st_postgis_gist_joinsel("internal", "oid", "internal", smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_postgis_gist_joinsel"("internal", "oid", "internal", smallint) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_joinsel';


ALTER FUNCTION "public"."st_postgis_gist_joinsel"("internal", "oid", "internal", smallint) OWNER TO "postgres";

--
-- TOC entry 911 (class 1255 OID 18055)
-- Dependencies: 6
-- Name: st_postgis_gist_sel("internal", "oid", "internal", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_postgis_gist_sel"("internal", "oid", "internal", integer) RETURNS double precision
    LANGUAGE "c"
    AS '$libdir/postgis-1.5', 'LWGEOM_gist_sel';


ALTER FUNCTION "public"."st_postgis_gist_sel"("internal", "oid", "internal", integer) OWNER TO "postgres";

--
-- TOC entry 912 (class 1255 OID 18056)
-- Dependencies: 1321 6 1321
-- Name: st_relate("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_relate"("geometry", "geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_full';


ALTER FUNCTION "public"."st_relate"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 913 (class 1255 OID 18057)
-- Dependencies: 1321 6 1321
-- Name: st_relate("geometry", "geometry", "text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_relate"("geometry", "geometry", "text") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'relate_pattern';


ALTER FUNCTION "public"."st_relate"("geometry", "geometry", "text") OWNER TO "postgres";

--
-- TOC entry 914 (class 1255 OID 18058)
-- Dependencies: 1321 1321 6
-- Name: st_removepoint("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_removepoint"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_removepoint';


ALTER FUNCTION "public"."st_removepoint"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 915 (class 1255 OID 18059)
-- Dependencies: 1321 1321 6
-- Name: st_reverse("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_reverse"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_reverse';


ALTER FUNCTION "public"."st_reverse"("geometry") OWNER TO "postgres";

--
-- TOC entry 916 (class 1255 OID 18060)
-- Dependencies: 6 1321 1321
-- Name: st_rotate("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_rotate"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT rotateZ($1, $2)$_$;


ALTER FUNCTION "public"."st_rotate"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 917 (class 1255 OID 18061)
-- Dependencies: 1321 1321 6
-- Name: st_rotatex("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_rotatex"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$;


ALTER FUNCTION "public"."st_rotatex"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 918 (class 1255 OID 18062)
-- Dependencies: 1321 6 1321
-- Name: st_rotatey("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_rotatey"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$;


ALTER FUNCTION "public"."st_rotatey"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 919 (class 1255 OID 18063)
-- Dependencies: 1321 6 1321
-- Name: st_rotatez("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_rotatez"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$;


ALTER FUNCTION "public"."st_rotatez"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 920 (class 1255 OID 18064)
-- Dependencies: 1321 1321 6
-- Name: st_scale("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_scale"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT scale($1, $2, $3, 1)$_$;


ALTER FUNCTION "public"."st_scale"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 921 (class 1255 OID 18065)
-- Dependencies: 1321 1321 6
-- Name: st_scale("geometry", double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_scale"("geometry", double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$;


ALTER FUNCTION "public"."st_scale"("geometry", double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 922 (class 1255 OID 18066)
-- Dependencies: 1321 6 1321
-- Name: st_segmentize("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_segmentize"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_segmentize2d';


ALTER FUNCTION "public"."st_segmentize"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 923 (class 1255 OID 18067)
-- Dependencies: 1313 1313 6
-- Name: st_setfactor("chip", real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_setfactor"("chip", real) RETURNS "chip"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_setFactor';


ALTER FUNCTION "public"."st_setfactor"("chip", real) OWNER TO "postgres";

--
-- TOC entry 924 (class 1255 OID 18068)
-- Dependencies: 1321 6 1321 1321
-- Name: st_setpoint("geometry", integer, "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_setpoint"("geometry", integer, "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setpoint_linestring';


ALTER FUNCTION "public"."st_setpoint"("geometry", integer, "geometry") OWNER TO "postgres";

--
-- TOC entry 925 (class 1255 OID 18069)
-- Dependencies: 1321 1321 6
-- Name: st_setsrid("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_setsrid"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_setSRID';


ALTER FUNCTION "public"."st_setsrid"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 926 (class 1255 OID 18070)
-- Dependencies: 1321 6 1321
-- Name: st_shift_longitude("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_shift_longitude"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_longitude_shift';


ALTER FUNCTION "public"."st_shift_longitude"("geometry") OWNER TO "postgres";

--
-- TOC entry 927 (class 1255 OID 18071)
-- Dependencies: 6 1321 1321 1321
-- Name: st_shortestline("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_shortestline"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_shortestline2d';


ALTER FUNCTION "public"."st_shortestline"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 928 (class 1255 OID 18072)
-- Dependencies: 6 1321 1321
-- Name: st_simplify("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_simplify"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_simplify2d';


ALTER FUNCTION "public"."st_simplify"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 929 (class 1255 OID 18073)
-- Dependencies: 6 1321 1321
-- Name: st_simplifypreservetopology("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_simplifypreservetopology"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT COST 100
    AS '$libdir/postgis-1.5', 'topologypreservesimplify';


ALTER FUNCTION "public"."st_simplifypreservetopology"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 930 (class 1255 OID 18074)
-- Dependencies: 6 1321 1321
-- Name: st_snaptogrid("geometry", double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_snaptogrid"("geometry", double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$;


ALTER FUNCTION "public"."st_snaptogrid"("geometry", double precision) OWNER TO "postgres";

--
-- TOC entry 931 (class 1255 OID 18075)
-- Dependencies: 1321 6 1321
-- Name: st_snaptogrid("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_snaptogrid"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$;


ALTER FUNCTION "public"."st_snaptogrid"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 932 (class 1255 OID 18076)
-- Dependencies: 6 1321 1321
-- Name: st_snaptogrid("geometry", double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_snaptogrid"("geometry", double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid';


ALTER FUNCTION "public"."st_snaptogrid"("geometry", double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 933 (class 1255 OID 18077)
-- Dependencies: 1321 6 1321 1321
-- Name: st_snaptogrid("geometry", "geometry", double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_snaptogrid"("geometry", "geometry", double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_snaptogrid_pointoff';


ALTER FUNCTION "public"."st_snaptogrid"("geometry", "geometry", double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 934 (class 1255 OID 18078)
-- Dependencies: 1336 6
-- Name: st_spheroid_in("cstring"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_spheroid_in"("cstring") RETURNS "spheroid"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_in';


ALTER FUNCTION "public"."st_spheroid_in"("cstring") OWNER TO "postgres";

--
-- TOC entry 935 (class 1255 OID 18079)
-- Dependencies: 1336 6
-- Name: st_spheroid_out("spheroid"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_spheroid_out"("spheroid") RETURNS "cstring"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'ellipsoid_out';


ALTER FUNCTION "public"."st_spheroid_out"("spheroid") OWNER TO "postgres";

--
-- TOC entry 936 (class 1255 OID 18080)
-- Dependencies: 6 1313
-- Name: st_srid("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_srid"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getSRID';


ALTER FUNCTION "public"."st_srid"("chip") OWNER TO "postgres";

--
-- TOC entry 937 (class 1255 OID 18081)
-- Dependencies: 6 1321
-- Name: st_srid("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_srid"("geometry") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_getSRID';


ALTER FUNCTION "public"."st_srid"("geometry") OWNER TO "postgres";

--
-- TOC entry 938 (class 1255 OID 18082)
-- Dependencies: 1321 6 1321
-- Name: st_startpoint("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_startpoint"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_startpoint_linestring';


ALTER FUNCTION "public"."st_startpoint"("geometry") OWNER TO "postgres";

--
-- TOC entry 939 (class 1255 OID 18083)
-- Dependencies: 1321 6
-- Name: st_summary("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_summary"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_summary';


ALTER FUNCTION "public"."st_summary"("geometry") OWNER TO "postgres";

--
-- TOC entry 940 (class 1255 OID 18084)
-- Dependencies: 1321 1321 6 1321
-- Name: st_symdifference("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_symdifference"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


ALTER FUNCTION "public"."st_symdifference"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 941 (class 1255 OID 18085)
-- Dependencies: 1321 1321 1321 6
-- Name: st_symmetricdifference("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_symmetricdifference"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


ALTER FUNCTION "public"."st_symmetricdifference"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 942 (class 1255 OID 18086)
-- Dependencies: 1321 6
-- Name: st_text("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_text"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_text';


ALTER FUNCTION "public"."st_text"("geometry") OWNER TO "postgres";

--
-- TOC entry 943 (class 1255 OID 18087)
-- Dependencies: 1321 6 1321
-- Name: st_touches("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_touches"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$;


ALTER FUNCTION "public"."st_touches"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 944 (class 1255 OID 18088)
-- Dependencies: 6 1321 1321
-- Name: st_transform("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_transform"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform';


ALTER FUNCTION "public"."st_transform"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 945 (class 1255 OID 18089)
-- Dependencies: 1321 1321 6
-- Name: st_translate("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_translate"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


ALTER FUNCTION "public"."st_translate"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 946 (class 1255 OID 18090)
-- Dependencies: 6 1321 1321
-- Name: st_translate("geometry", double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_translate"("geometry", double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."st_translate"("geometry", double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 947 (class 1255 OID 18091)
-- Dependencies: 1321 6 1321
-- Name: st_transscale("geometry", double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_transscale"("geometry", double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


ALTER FUNCTION "public"."st_transscale"("geometry", double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 948 (class 1255 OID 18092)
-- Dependencies: 1321 6 1323
-- Name: st_union("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_union"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


ALTER FUNCTION "public"."st_union"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 949 (class 1255 OID 18093)
-- Dependencies: 1321 6 1321 1321
-- Name: st_union("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_union"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'geomunion';


ALTER FUNCTION "public"."st_union"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 950 (class 1255 OID 18094)
-- Dependencies: 1323 1321 6
-- Name: st_unite_garray("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_unite_garray"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


ALTER FUNCTION "public"."st_unite_garray"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 951 (class 1255 OID 18095)
-- Dependencies: 1313 6
-- Name: st_width("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_width"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getWidth';


ALTER FUNCTION "public"."st_width"("chip") OWNER TO "postgres";

--
-- TOC entry 952 (class 1255 OID 18096)
-- Dependencies: 6 1321 1321
-- Name: st_within("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_within"("geometry", "geometry") RETURNS boolean
    LANGUAGE "sql" IMMUTABLE
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$;


ALTER FUNCTION "public"."st_within"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 953 (class 1255 OID 18097)
-- Dependencies: 1321 6
-- Name: st_wkbtosql("bytea"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_wkbtosql"("bytea") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_WKB';


ALTER FUNCTION "public"."st_wkbtosql"("bytea") OWNER TO "postgres";

--
-- TOC entry 954 (class 1255 OID 18098)
-- Dependencies: 6 1321
-- Name: st_wkttosql("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_wkttosql"("text") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_from_text';


ALTER FUNCTION "public"."st_wkttosql"("text") OWNER TO "postgres";

--
-- TOC entry 955 (class 1255 OID 18099)
-- Dependencies: 6 1321
-- Name: st_x("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_x"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_x_point';


ALTER FUNCTION "public"."st_x"("geometry") OWNER TO "postgres";

--
-- TOC entry 956 (class 1255 OID 18100)
-- Dependencies: 1305 6
-- Name: st_xmax("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_xmax"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmax';


ALTER FUNCTION "public"."st_xmax"("box3d") OWNER TO "postgres";

--
-- TOC entry 957 (class 1255 OID 18101)
-- Dependencies: 6 1305
-- Name: st_xmin("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_xmin"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmin';


ALTER FUNCTION "public"."st_xmin"("box3d") OWNER TO "postgres";

--
-- TOC entry 958 (class 1255 OID 18102)
-- Dependencies: 1321 6
-- Name: st_y("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_y"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_y_point';


ALTER FUNCTION "public"."st_y"("geometry") OWNER TO "postgres";

--
-- TOC entry 959 (class 1255 OID 18103)
-- Dependencies: 1305 6
-- Name: st_ymax("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_ymax"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymax';


ALTER FUNCTION "public"."st_ymax"("box3d") OWNER TO "postgres";

--
-- TOC entry 960 (class 1255 OID 18104)
-- Dependencies: 6 1305
-- Name: st_ymin("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_ymin"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymin';


ALTER FUNCTION "public"."st_ymin"("box3d") OWNER TO "postgres";

--
-- TOC entry 961 (class 1255 OID 18105)
-- Dependencies: 1321 6
-- Name: st_z("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_z"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


ALTER FUNCTION "public"."st_z"("geometry") OWNER TO "postgres";

--
-- TOC entry 962 (class 1255 OID 18106)
-- Dependencies: 6 1305
-- Name: st_zmax("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_zmax"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmax';


ALTER FUNCTION "public"."st_zmax"("box3d") OWNER TO "postgres";

--
-- TOC entry 963 (class 1255 OID 18107)
-- Dependencies: 1321 6
-- Name: st_zmflag("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_zmflag"("geometry") RETURNS smallint
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_zmflag';


ALTER FUNCTION "public"."st_zmflag"("geometry") OWNER TO "postgres";

--
-- TOC entry 964 (class 1255 OID 18108)
-- Dependencies: 1305 6
-- Name: st_zmin("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "st_zmin"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmin';


ALTER FUNCTION "public"."st_zmin"("box3d") OWNER TO "postgres";

--
-- TOC entry 965 (class 1255 OID 18109)
-- Dependencies: 1321 6 1321
-- Name: startpoint("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "startpoint"("geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_startpoint_linestring';


ALTER FUNCTION "public"."startpoint"("geometry") OWNER TO "postgres";

--
-- TOC entry 966 (class 1255 OID 18110)
-- Dependencies: 1321 6
-- Name: summary("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "summary"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_summary';


ALTER FUNCTION "public"."summary"("geometry") OWNER TO "postgres";

--
-- TOC entry 967 (class 1255 OID 18111)
-- Dependencies: 1321 1321 1321 6
-- Name: symdifference("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "symdifference"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


ALTER FUNCTION "public"."symdifference"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 968 (class 1255 OID 18112)
-- Dependencies: 1321 6 1321 1321
-- Name: symmetricdifference("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "symmetricdifference"("geometry", "geometry") RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'symdifference';


ALTER FUNCTION "public"."symmetricdifference"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 969 (class 1255 OID 18113)
-- Dependencies: 1321 6
-- Name: text("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "text"("geometry") RETURNS "text"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_to_text';


ALTER FUNCTION "public"."text"("geometry") OWNER TO "postgres";

--
-- TOC entry 970 (class 1255 OID 18114)
-- Dependencies: 1321 6 1321
-- Name: touches("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "touches"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'touches';


ALTER FUNCTION "public"."touches"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 971 (class 1255 OID 18115)
-- Dependencies: 6 1321 1321
-- Name: transform("geometry", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "transform"("geometry", integer) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'transform';


ALTER FUNCTION "public"."transform"("geometry", integer) OWNER TO "postgres";

--
-- TOC entry 972 (class 1255 OID 18116)
-- Dependencies: 1321 1321 6
-- Name: translate("geometry", double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "translate"("geometry", double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT translate($1, $2, $3, 0)$_$;


ALTER FUNCTION "public"."translate"("geometry", double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 973 (class 1255 OID 18117)
-- Dependencies: 1321 6 1321
-- Name: translate("geometry", double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "translate"("geometry", double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$;


ALTER FUNCTION "public"."translate"("geometry", double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 974 (class 1255 OID 18118)
-- Dependencies: 1321 1321 6
-- Name: transscale("geometry", double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "transscale"("geometry", double precision, double precision, double precision, double precision) RETURNS "geometry"
    LANGUAGE "sql" IMMUTABLE STRICT
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0,
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$;


ALTER FUNCTION "public"."transscale"("geometry", double precision, double precision, double precision, double precision) OWNER TO "postgres";

--
-- TOC entry 975 (class 1255 OID 18119)
-- Dependencies: 1323 1321 6
-- Name: unite_garray("geometry"[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "unite_garray"("geometry"[]) RETURNS "geometry"
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'pgis_union_geometry_array';


ALTER FUNCTION "public"."unite_garray"("geometry"[]) OWNER TO "postgres";

--
-- TOC entry 976 (class 1255 OID 18120)
-- Dependencies: 1474 6
-- Name: unlockrows("text"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "unlockrows"("text") RETURNS integer
    LANGUAGE "plpgsql" STRICT
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."unlockrows"("text") OWNER TO "postgres";

--
-- TOC entry 977 (class 1255 OID 18121)
-- Dependencies: 6 1474
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "updategeometrysrid"(character varying, character varying, integer) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."updategeometrysrid"(character varying, character varying, integer) OWNER TO "postgres";

--
-- TOC entry 978 (class 1255 OID 18122)
-- Dependencies: 1474 6
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "updategeometrysrid"(character varying, character varying, character varying, integer) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$;


ALTER FUNCTION "public"."updategeometrysrid"(character varying, character varying, character varying, integer) OWNER TO "postgres";

--
-- TOC entry 979 (class 1255 OID 18123)
-- Dependencies: 1474 6
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "updategeometrysrid"(character varying, character varying, character varying, character varying, integer) RETURNS "text"
    LANGUAGE "plpgsql" STRICT
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP;
	IF (okay <> 't') THEN
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Update ref from geometry_columns table
	EXECUTE 'UPDATE geometry_columns SET SRID = ' || new_srid::text ||
		' where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);

	-- Make up constraint name
	cname = 'enforce_srid_'  || column_name;

	-- Drop enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' DROP constraint ' || quote_ident(cname);

	-- Update geometries SRID
	EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' SET ' || quote_ident(column_name) ||
		' = setSRID(' || quote_ident(column_name) ||
		', ' || new_srid::text || ')';

	-- Reset enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' ADD constraint ' || quote_ident(cname) ||
		' CHECK (srid(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')';

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;

END;
$_$;


ALTER FUNCTION "public"."updategeometrysrid"(character varying, character varying, character varying, character varying, integer) OWNER TO "postgres";

--
-- TOC entry 980 (class 1255 OID 18124)
-- Dependencies: 1313 6
-- Name: width("chip"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "width"("chip") RETURNS integer
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'CHIP_getWidth';


ALTER FUNCTION "public"."width"("chip") OWNER TO "postgres";

--
-- TOC entry 981 (class 1255 OID 18125)
-- Dependencies: 6 1321 1321
-- Name: within("geometry", "geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "within"("geometry", "geometry") RETURNS boolean
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'within';


ALTER FUNCTION "public"."within"("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 982 (class 1255 OID 18126)
-- Dependencies: 1321 6
-- Name: x("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "x"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_x_point';


ALTER FUNCTION "public"."x"("geometry") OWNER TO "postgres";

--
-- TOC entry 983 (class 1255 OID 18127)
-- Dependencies: 1305 6
-- Name: xmax("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "xmax"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmax';


ALTER FUNCTION "public"."xmax"("box3d") OWNER TO "postgres";

--
-- TOC entry 984 (class 1255 OID 18128)
-- Dependencies: 1305 6
-- Name: xmin("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "xmin"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_xmin';


ALTER FUNCTION "public"."xmin"("box3d") OWNER TO "postgres";

--
-- TOC entry 985 (class 1255 OID 18129)
-- Dependencies: 6 1321
-- Name: y("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "y"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_y_point';


ALTER FUNCTION "public"."y"("geometry") OWNER TO "postgres";

--
-- TOC entry 986 (class 1255 OID 18130)
-- Dependencies: 6 1305
-- Name: ymax("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "ymax"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymax';


ALTER FUNCTION "public"."ymax"("box3d") OWNER TO "postgres";

--
-- TOC entry 987 (class 1255 OID 18131)
-- Dependencies: 1305 6
-- Name: ymin("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "ymin"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_ymin';


ALTER FUNCTION "public"."ymin"("box3d") OWNER TO "postgres";

--
-- TOC entry 988 (class 1255 OID 18132)
-- Dependencies: 6 1321
-- Name: z("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "z"("geometry") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_z_point';


ALTER FUNCTION "public"."z"("geometry") OWNER TO "postgres";

--
-- TOC entry 989 (class 1255 OID 18133)
-- Dependencies: 6 1305
-- Name: zmax("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "zmax"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmax';


ALTER FUNCTION "public"."zmax"("box3d") OWNER TO "postgres";

--
-- TOC entry 990 (class 1255 OID 18134)
-- Dependencies: 6 1321
-- Name: zmflag("geometry"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "zmflag"("geometry") RETURNS smallint
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'LWGEOM_zmflag';


ALTER FUNCTION "public"."zmflag"("geometry") OWNER TO "postgres";

--
-- TOC entry 991 (class 1255 OID 18135)
-- Dependencies: 6 1305
-- Name: zmin("box3d"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "zmin"("box3d") RETURNS double precision
    LANGUAGE "c" IMMUTABLE STRICT
    AS '$libdir/postgis-1.5', 'BOX3D_zmin';


ALTER FUNCTION "public"."zmin"("box3d") OWNER TO "postgres";

--
-- TOC entry 1475 (class 1255 OID 18136)
-- Dependencies: 522 6 1323 1321 523
-- Name: accum("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "accum"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_accum_finalfn"
);


ALTER AGGREGATE "public"."accum"("geometry") OWNER TO "postgres";

--
-- TOC entry 1476 (class 1255 OID 18137)
-- Dependencies: 1321 524 6 523 1321
-- Name: collect("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "collect"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_collect_finalfn"
);


ALTER AGGREGATE "public"."collect"("geometry") OWNER TO "postgres";

--
-- TOC entry 1477 (class 1255 OID 18138)
-- Dependencies: 6 1309 1321 692
-- Name: extent("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "extent"("geometry") (
    SFUNC = "public"."st_combine_bbox",
    STYPE = "box3d_extent"
);


ALTER AGGREGATE "public"."extent"("geometry") OWNER TO "postgres";

--
-- TOC entry 1478 (class 1255 OID 18139)
-- Dependencies: 317 1321 1305 6
-- Name: extent3d("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "extent3d"("geometry") (
    SFUNC = "public"."combine_bbox",
    STYPE = "box3d"
);


ALTER AGGREGATE "public"."extent3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 1479 (class 1255 OID 18140)
-- Dependencies: 525 6 523 1321 1321
-- Name: makeline("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "makeline"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_makeline_finalfn"
);


ALTER AGGREGATE "public"."makeline"("geometry") OWNER TO "postgres";

--
-- TOC entry 1480 (class 1255 OID 18141)
-- Dependencies: 6 1321 1321 689
-- Name: memcollect("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "memcollect"("geometry") (
    SFUNC = "public"."st_collect",
    STYPE = "geometry"
);


ALTER AGGREGATE "public"."memcollect"("geometry") OWNER TO "postgres";

--
-- TOC entry 1481 (class 1255 OID 18142)
-- Dependencies: 6 1321 1321 424
-- Name: memgeomunion("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "memgeomunion"("geometry") (
    SFUNC = "geomunion",
    STYPE = "geometry"
);


ALTER AGGREGATE "public"."memgeomunion"("geometry") OWNER TO "postgres";

--
-- TOC entry 1482 (class 1255 OID 18143)
-- Dependencies: 526 523 6 1321 1321
-- Name: polygonize("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "polygonize"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_polygonize_finalfn"
);


ALTER AGGREGATE "public"."polygonize"("geometry") OWNER TO "postgres";

--
-- TOC entry 1483 (class 1255 OID 18144)
-- Dependencies: 1323 6 523 1321 522
-- Name: st_accum("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_accum"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_accum_finalfn"
);


ALTER AGGREGATE "public"."st_accum"("geometry") OWNER TO "postgres";

--
-- TOC entry 1484 (class 1255 OID 18145)
-- Dependencies: 524 523 1321 6 1321
-- Name: st_collect("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_collect"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_collect_finalfn"
);


ALTER AGGREGATE "public"."st_collect"("geometry") OWNER TO "postgres";

--
-- TOC entry 1485 (class 1255 OID 18146)
-- Dependencies: 1321 692 1309 6
-- Name: st_extent("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_extent"("geometry") (
    SFUNC = "public"."st_combine_bbox",
    STYPE = "box3d_extent"
);


ALTER AGGREGATE "public"."st_extent"("geometry") OWNER TO "postgres";

--
-- TOC entry 1486 (class 1255 OID 18147)
-- Dependencies: 1321 6 1305 693
-- Name: st_extent3d("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_extent3d"("geometry") (
    SFUNC = "public"."st_combine_bbox",
    STYPE = "box3d"
);


ALTER AGGREGATE "public"."st_extent3d"("geometry") OWNER TO "postgres";

--
-- TOC entry 1487 (class 1255 OID 18148)
-- Dependencies: 525 6 1321 1321 523
-- Name: st_makeline("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_makeline"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_makeline_finalfn"
);


ALTER AGGREGATE "public"."st_makeline"("geometry") OWNER TO "postgres";

--
-- TOC entry 1488 (class 1255 OID 18149)
-- Dependencies: 689 1321 1321 6
-- Name: st_memcollect("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_memcollect"("geometry") (
    SFUNC = "public"."st_collect",
    STYPE = "geometry"
);


ALTER AGGREGATE "public"."st_memcollect"("geometry") OWNER TO "postgres";

--
-- TOC entry 1489 (class 1255 OID 18150)
-- Dependencies: 6 949 1321 1321
-- Name: st_memunion("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_memunion"("geometry") (
    SFUNC = "public"."st_union",
    STYPE = "geometry"
);


ALTER AGGREGATE "public"."st_memunion"("geometry") OWNER TO "postgres";

--
-- TOC entry 1490 (class 1255 OID 18151)
-- Dependencies: 526 6 1321 1321 523
-- Name: st_polygonize("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_polygonize"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_polygonize_finalfn"
);


ALTER AGGREGATE "public"."st_polygonize"("geometry") OWNER TO "postgres";

--
-- TOC entry 1491 (class 1255 OID 18152)
-- Dependencies: 527 1321 1321 6 523
-- Name: st_union("geometry"); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE "st_union"("geometry") (
    SFUNC = "pgis_geometry_accum_transfn",
    STYPE = "pgis_abs",
    FINALFUNC = "pgis_geometry_union_finalfn"
);


ALTER AGGREGATE "public"."st_union"("geometry") OWNER TO "postgres";

--
-- TOC entry 2198 (class 2617 OID 18153)
-- Dependencies: 6 1321 1321 408 401 400
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = "geometry_overlap",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = &&,
    RESTRICT = "geometry_gist_sel",
    JOIN = "geometry_gist_joinsel"
);


ALTER OPERATOR "public".&& ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2199 (class 2617 OID 18154)
-- Dependencies: 373 369 6 1317 1317 378
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = "geography_overlaps",
    LEFTARG = "geography",
    RIGHTARG = "geography",
    COMMUTATOR = &&,
    RESTRICT = "geography_gist_selectivity",
    JOIN = "geography_gist_join_selectivity"
);


ALTER OPERATOR "public".&& ("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 2200 (class 2617 OID 18156)
-- Dependencies: 6 409 1321 1321
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = "geometry_overleft",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = &>,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".&< ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2201 (class 2617 OID 18158)
-- Dependencies: 1321 407 1321 6
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &<| (
    PROCEDURE = "geometry_overbelow",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = |&>,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".&<| ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2202 (class 2617 OID 18155)
-- Dependencies: 1321 6 1321 410
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = "geometry_overright",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = &<,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".&> ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2203 (class 2617 OID 18161)
-- Dependencies: 6 405 1321 1321
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = "geometry_lt",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".< ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2204 (class 2617 OID 18164)
-- Dependencies: 1317 377 6 1317
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = "geography_lt",
    LEFTARG = "geography",
    RIGHTARG = "geography",
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".< ("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 2205 (class 2617 OID 18166)
-- Dependencies: 1321 404 6 1321
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = "geometry_left",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = >>,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".<< ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2206 (class 2617 OID 18168)
-- Dependencies: 1321 394 6 1321
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <<| (
    PROCEDURE = "geometry_below",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = |>>,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".<<| ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2207 (class 2617 OID 18169)
-- Dependencies: 6 1321 1321 403
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = "geometry_le",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".<= ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2208 (class 2617 OID 18170)
-- Dependencies: 1317 376 6 1317
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = "geography_le",
    LEFTARG = "geography",
    RIGHTARG = "geography",
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".<= ("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 2209 (class 2617 OID 18171)
-- Dependencies: 1321 398 1321 6
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = "geometry_eq",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = =,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".= ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2210 (class 2617 OID 18172)
-- Dependencies: 364 1317 1317 6
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = "geography_eq",
    LEFTARG = "geography",
    RIGHTARG = "geography",
    COMMUTATOR = =,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".= ("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 2211 (class 2617 OID 18159)
-- Dependencies: 1321 402 1321 6
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = "geometry_gt",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".> ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2212 (class 2617 OID 18162)
-- Dependencies: 6 375 1317 1317
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = "geography_gt",
    LEFTARG = "geography",
    RIGHTARG = "geography",
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".> ("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 2213 (class 2617 OID 18160)
-- Dependencies: 1321 399 6 1321
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = "geometry_ge",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".>= ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2214 (class 2617 OID 18163)
-- Dependencies: 1317 365 6 1317
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = "geography_ge",
    LEFTARG = "geography",
    RIGHTARG = "geography",
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".>= ("geography", "geography") OWNER TO "postgres";

--
-- TOC entry 2215 (class 2617 OID 18165)
-- Dependencies: 1321 411 6 1321
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = "geometry_right",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = <<,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".>> ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2216 (class 2617 OID 18174)
-- Dependencies: 397 6 1321 1321
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = "geometry_contained",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = ~,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".@ ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2217 (class 2617 OID 18157)
-- Dependencies: 1321 6 406 1321
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |&> (
    PROCEDURE = "geometry_overabove",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = &<|,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".|&> ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2218 (class 2617 OID 18167)
-- Dependencies: 1321 6 393 1321
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |>> (
    PROCEDURE = "geometry_above",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = <<|,
    RESTRICT = "positionsel",
    JOIN = "positionjoinsel"
);


ALTER OPERATOR "public".|>> ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2219 (class 2617 OID 18173)
-- Dependencies: 1321 6 396 1321
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = "geometry_contain",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = @,
    RESTRICT = "contsel",
    JOIN = "contjoinsel"
);


ALTER OPERATOR "public".~ ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2220 (class 2617 OID 18175)
-- Dependencies: 1321 1321 6 413
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~= (
    PROCEDURE = "geometry_samebox",
    LEFTARG = "geometry",
    RIGHTARG = "geometry",
    COMMUTATOR = ~=,
    RESTRICT = "eqsel",
    JOIN = "eqjoinsel"
);


ALTER OPERATOR "public".~= ("geometry", "geometry") OWNER TO "postgres";

--
-- TOC entry 2334 (class 2616 OID 18177)
-- Dependencies: 6 2408 1317
-- Name: btree_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS "btree_geography_ops"
    DEFAULT FOR TYPE "geography" USING "btree" AS
    OPERATOR 1 <("geography","geography") ,
    OPERATOR 2 <=("geography","geography") ,
    OPERATOR 3 =("geography","geography") ,
    OPERATOR 4 >=("geography","geography") ,
    OPERATOR 5 >("geography","geography") ,
    FUNCTION 1 "geography_cmp"("geography","geography");


ALTER OPERATOR CLASS "public"."btree_geography_ops" USING "btree" OWNER TO "postgres";

--
-- TOC entry 2335 (class 2616 OID 18185)
-- Dependencies: 1321 2409 6
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS "btree_geometry_ops"
    DEFAULT FOR TYPE "geometry" USING "btree" AS
    OPERATOR 1 <("geometry","geometry") ,
    OPERATOR 2 <=("geometry","geometry") ,
    OPERATOR 3 =("geometry","geometry") ,
    OPERATOR 4 >=("geometry","geometry") ,
    OPERATOR 5 >("geometry","geometry") ,
    FUNCTION 1 "geometry_cmp"("geometry","geometry");


ALTER OPERATOR CLASS "public"."btree_geometry_ops" USING "btree" OWNER TO "postgres";

--
-- TOC entry 2336 (class 2616 OID 18193)
-- Dependencies: 1328 6 2410 1317
-- Name: gist_geography_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS "gist_geography_ops"
    DEFAULT FOR TYPE "geography" USING "gist" AS
    STORAGE "gidx" ,
    OPERATOR 3 &&("geography","geography") ,
    FUNCTION 1 "geography_gist_consistent"("internal","geometry",integer) ,
    FUNCTION 2 "geography_gist_union"("bytea","internal") ,
    FUNCTION 3 "geography_gist_compress"("internal") ,
    FUNCTION 4 "geography_gist_decompress"("internal") ,
    FUNCTION 5 "geography_gist_penalty"("internal","internal","internal") ,
    FUNCTION 6 "geography_gist_picksplit"("internal","internal") ,
    FUNCTION 7 "geography_gist_same"("box2d","box2d","internal");


ALTER OPERATOR CLASS "public"."gist_geography_ops" USING "gist" OWNER TO "postgres";

--
-- TOC entry 2337 (class 2616 OID 18203)
-- Dependencies: 1321 6 2411 1301
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS "gist_geometry_ops"
    DEFAULT FOR TYPE "geometry" USING "gist" AS
    STORAGE "box2d" ,
    OPERATOR 1 <<("geometry","geometry") ,
    OPERATOR 2 &<("geometry","geometry") ,
    OPERATOR 3 &&("geometry","geometry") ,
    OPERATOR 4 &>("geometry","geometry") ,
    OPERATOR 5 >>("geometry","geometry") ,
    OPERATOR 6 ~=("geometry","geometry") ,
    OPERATOR 7 ~("geometry","geometry") ,
    OPERATOR 8 @("geometry","geometry") ,
    OPERATOR 9 &<|("geometry","geometry") ,
    OPERATOR 10 <<|("geometry","geometry") ,
    OPERATOR 11 |>>("geometry","geometry") ,
    OPERATOR 12 |&>("geometry","geometry") ,
    FUNCTION 1 "lwgeom_gist_consistent"("internal","geometry",integer) ,
    FUNCTION 2 "lwgeom_gist_union"("bytea","internal") ,
    FUNCTION 3 "lwgeom_gist_compress"("internal") ,
    FUNCTION 4 "lwgeom_gist_decompress"("internal") ,
    FUNCTION 5 "lwgeom_gist_penalty"("internal","internal","internal") ,
    FUNCTION 6 "lwgeom_gist_picksplit"("internal","internal") ,
    FUNCTION 7 "lwgeom_gist_same"("box2d","box2d","internal");


ALTER OPERATOR CLASS "public"."gist_geometry_ops" USING "gist" OWNER TO "postgres";

SET search_path = "pg_catalog";

--
-- TOC entry 2783 (class 2605 OID 18223)
-- Dependencies: 303 1301 1305
-- Name: CAST ("public"."box2d" AS "public"."box3d"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box2d" AS "public"."box3d") WITH FUNCTION "public"."box3d"("public"."box2d") AS IMPLICIT;


--
-- TOC entry 2784 (class 2605 OID 18224)
-- Dependencies: 1321 387 1301
-- Name: CAST ("public"."box2d" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box2d" AS "public"."geometry") WITH FUNCTION "public"."geometry"("public"."box2d") AS IMPLICIT;


--
-- TOC entry 2785 (class 2605 OID 18225)
-- Dependencies: 298 1305
-- Name: CAST ("public"."box3d" AS "box"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box3d" AS "box") WITH FUNCTION "public"."box"("public"."box3d") AS IMPLICIT;


--
-- TOC entry 2786 (class 2605 OID 18226)
-- Dependencies: 1301 301 1305
-- Name: CAST ("public"."box3d" AS "public"."box2d"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box3d" AS "public"."box2d") WITH FUNCTION "public"."box2d"("public"."box3d") AS IMPLICIT;


--
-- TOC entry 2787 (class 2605 OID 18227)
-- Dependencies: 1305 1321 388
-- Name: CAST ("public"."box3d" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box3d" AS "public"."geometry") WITH FUNCTION "public"."geometry"("public"."box3d") AS IMPLICIT;


--
-- TOC entry 2788 (class 2605 OID 18228)
-- Dependencies: 299 1309 1301
-- Name: CAST ("public"."box3d_extent" AS "public"."box2d"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box3d_extent" AS "public"."box2d") WITH FUNCTION "public"."box2d"("public"."box3d_extent") AS IMPLICIT;


--
-- TOC entry 2789 (class 2605 OID 18229)
-- Dependencies: 304 1305 1309
-- Name: CAST ("public"."box3d_extent" AS "public"."box3d"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box3d_extent" AS "public"."box3d") WITH FUNCTION "public"."box3d_extent"("public"."box3d_extent") AS IMPLICIT;


--
-- TOC entry 2790 (class 2605 OID 18230)
-- Dependencies: 1321 386 1309
-- Name: CAST ("public"."box3d_extent" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."box3d_extent" AS "public"."geometry") WITH FUNCTION "public"."geometry"("public"."box3d_extent") AS IMPLICIT;


--
-- TOC entry 2589 (class 2605 OID 18231)
-- Dependencies: 391 1321
-- Name: CAST ("bytea" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("bytea" AS "public"."geometry") WITH FUNCTION "public"."geometry"("bytea") AS IMPLICIT;


--
-- TOC entry 2791 (class 2605 OID 18232)
-- Dependencies: 1313 1321 390
-- Name: CAST ("public"."chip" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."chip" AS "public"."geometry") WITH FUNCTION "public"."geometry"("public"."chip") AS IMPLICIT;


--
-- TOC entry 2792 (class 2605 OID 18233)
-- Dependencies: 362 1317 1317
-- Name: CAST ("public"."geography" AS "public"."geography"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geography" AS "public"."geography") WITH FUNCTION "public"."geography"("public"."geography", integer, boolean) AS IMPLICIT;


--
-- TOC entry 2793 (class 2605 OID 18234)
-- Dependencies: 1321 1317 392
-- Name: CAST ("public"."geography" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geography" AS "public"."geometry") WITH FUNCTION "public"."geometry"("public"."geography");


--
-- TOC entry 2796 (class 2605 OID 18235)
-- Dependencies: 1321 297
-- Name: CAST ("public"."geometry" AS "box"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geometry" AS "box") WITH FUNCTION "public"."box"("public"."geometry") AS IMPLICIT;


--
-- TOC entry 2797 (class 2605 OID 18236)
-- Dependencies: 300 1321 1301
-- Name: CAST ("public"."geometry" AS "public"."box2d"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geometry" AS "public"."box2d") WITH FUNCTION "public"."box2d"("public"."geometry") AS IMPLICIT;


--
-- TOC entry 2798 (class 2605 OID 18237)
-- Dependencies: 1321 1305 302
-- Name: CAST ("public"."geometry" AS "public"."box3d"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geometry" AS "public"."box3d") WITH FUNCTION "public"."box3d"("public"."geometry") AS IMPLICIT;


--
-- TOC entry 2794 (class 2605 OID 18238)
-- Dependencies: 1321 309
-- Name: CAST ("public"."geometry" AS "bytea"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geometry" AS "bytea") WITH FUNCTION "public"."bytea"("public"."geometry") AS IMPLICIT;


--
-- TOC entry 2799 (class 2605 OID 18239)
-- Dependencies: 361 1317 1321
-- Name: CAST ("public"."geometry" AS "public"."geography"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geometry" AS "public"."geography") WITH FUNCTION "public"."geography"("public"."geometry") AS IMPLICIT;


--
-- TOC entry 2795 (class 2605 OID 18240)
-- Dependencies: 969 1321
-- Name: CAST ("public"."geometry" AS "text"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("public"."geometry" AS "text") WITH FUNCTION "public"."text"("public"."geometry") AS IMPLICIT;


--
-- TOC entry 2657 (class 2605 OID 18241)
-- Dependencies: 1321 389
-- Name: CAST ("text" AS "public"."geometry"); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST ("text" AS "public"."geometry") WITH FUNCTION "public"."geometry"("text") AS IMPLICIT;


SET search_path = "public", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 18242)
-- Dependencies: 6
-- Name: account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "account" (
    "id" bigint NOT NULL,
    "active" boolean,
    "admin" boolean,
    "email" character varying(255),
    "lastlogin" timestamp without time zone,
    "password" character varying(255),
    "passwordchangetoken" character varying(255),
    "username" character varying(255),
    "agency_id" bigint
);


ALTER TABLE "public"."account" OWNER TO "postgres";

--
-- TOC entry 163 (class 1259 OID 18248)
-- Dependencies: 6
-- Name: agency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "agency" (
    "id" bigint NOT NULL,
    "color" character varying(255),
    "defaultlat" double precision,
    "defaultlon" double precision,
    "gtfsagencyid" character varying(255),
    "lang" character varying(255),
    "name" character varying(255),
    "phone" character varying(255),
    "systemmap" boolean,
    "timezone" character varying(255),
    "url" character varying(255),
    "defaultroutetype_id" bigint
);


ALTER TABLE "public"."agency" OWNER TO "postgres";

--
-- TOC entry 164 (class 1259 OID 18254)
-- Dependencies: 3012 6
-- Name: geography_columns; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "geography_columns" AS
    SELECT "current_database"() AS "f_table_catalog", "n"."nspname" AS "f_table_schema", "c"."relname" AS "f_table_name", "a"."attname" AS "f_geography_column", "geography_typmod_dims"("a"."atttypmod") AS "coord_dimension", "geography_typmod_srid"("a"."atttypmod") AS "srid", "geography_typmod_type"("a"."atttypmod") AS "type" FROM "pg_class" "c", "pg_attribute" "a", "pg_type" "t", "pg_namespace" "n" WHERE (((((("t"."typname" = 'geography'::"name") AND ("a"."attisdropped" = false)) AND ("a"."atttypid" = "t"."oid")) AND ("a"."attrelid" = "c"."oid")) AND ("c"."relnamespace" = "n"."oid")) AND (NOT "pg_is_other_temp_schema"("c"."relnamespace")));


ALTER TABLE "public"."geography_columns" OWNER TO "postgres";

SET default_with_oids = true;

--
-- TOC entry 165 (class 1259 OID 18259)
-- Dependencies: 6
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "geometry_columns" (
    "f_table_catalog" character varying(256) NOT NULL,
    "f_table_schema" character varying(256) NOT NULL,
    "f_table_name" character varying(256) NOT NULL,
    "f_geometry_column" character varying(256) NOT NULL,
    "coord_dimension" integer NOT NULL,
    "srid" integer NOT NULL,
    "type" character varying(30) NOT NULL
);


ALTER TABLE "public"."geometry_columns" OWNER TO "postgres";

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 18265)
-- Dependencies: 6
-- Name: gisexport; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisexport" (
    "id" bigint NOT NULL,
    "creationdate" timestamp without time zone,
    "description" character varying(255),
    "status" character varying(255),
    "type" character varying(255)
);


ALTER TABLE "public"."gisexport" OWNER TO "postgres";

--
-- TOC entry 167 (class 1259 OID 18271)
-- Dependencies: 6
-- Name: gisexport_agency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisexport_agency" (
    "gisexport_id" bigint NOT NULL,
    "agencies_id" bigint NOT NULL
);


ALTER TABLE "public"."gisexport_agency" OWNER TO "postgres";

--
-- TOC entry 168 (class 1259 OID 18274)
-- Dependencies: 1321 6
-- Name: gisroute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisroute" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "oid" character varying(255),
    "originalshape" "geometry",
    "routeid" character varying(255),
    "routename" character varying(255),
    "routetype" character varying(255),
    "agency_id" bigint,
    "gisupload_id" bigint
);


ALTER TABLE "public"."gisroute" OWNER TO "postgres";

--
-- TOC entry 169 (class 1259 OID 18280)
-- Dependencies: 1321 6
-- Name: gisroutealignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisroutealignment" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "gtfsshape" "geometry",
    "reversealignment" boolean,
    "gisroute_id" bigint
);


ALTER TABLE "public"."gisroutealignment" OWNER TO "postgres";

--
-- TOC entry 170 (class 1259 OID 18286)
-- Dependencies: 1321 6
-- Name: gisroutecontrolpoint; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisroutecontrolpoint" (
    "id" bigint NOT NULL,
    "controlpoint" "geometry",
    "originalsequence" integer,
    "gisroute_id" bigint
);


ALTER TABLE "public"."gisroutecontrolpoint" OWNER TO "postgres";

--
-- TOC entry 171 (class 1259 OID 18292)
-- Dependencies: 6
-- Name: gisroutecontrolpointsequence; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisroutecontrolpointsequence" (
    "id" bigint NOT NULL,
    "sequence" integer,
    "controlpoint_id" bigint,
    "gisroutealignment_id" bigint,
    "segment_id" bigint
);


ALTER TABLE "public"."gisroutecontrolpointsequence" OWNER TO "postgres";

--
-- TOC entry 172 (class 1259 OID 18295)
-- Dependencies: 1321 6
-- Name: gisroutesegment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisroutesegment" (
    "id" bigint NOT NULL,
    "reverse" boolean,
    "segment" "geometry",
    "frompoint_id" bigint,
    "topoint_id" bigint
);


ALTER TABLE "public"."gisroutesegment" OWNER TO "postgres";

--
-- TOC entry 173 (class 1259 OID 18301)
-- Dependencies: 6 1321
-- Name: gisstop; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisstop" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "oid" character varying(255),
    "shape" "geometry",
    "stopid" character varying(255),
    "stopname" character varying(255),
    "agency_id" bigint,
    "gisupload_id" bigint
);


ALTER TABLE "public"."gisstop" OWNER TO "postgres";

--
-- TOC entry 174 (class 1259 OID 18307)
-- Dependencies: 6
-- Name: gisupload; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisupload" (
    "id" bigint NOT NULL,
    "creationdate" timestamp without time zone,
    "description" character varying(255),
    "fielddescription" character varying(255),
    "fieldid" character varying(255),
    "fieldname" character varying(255),
    "fieldtype" character varying(255),
    "status" character varying(255),
    "type" character varying(255),
    "agency_id" bigint
);


ALTER TABLE "public"."gisupload" OWNER TO "postgres";

--
-- TOC entry 175 (class 1259 OID 18313)
-- Dependencies: 6
-- Name: gisuploadfield; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gisuploadfield" (
    "id" bigint NOT NULL,
    "fieldname" character varying(255),
    "fieldposition" bigint,
    "fieldtype" character varying(255),
    "gisupload_id" bigint
);


ALTER TABLE "public"."gisuploadfield" OWNER TO "postgres";

--
-- TOC entry 176 (class 1259 OID 18319)
-- Dependencies: 6
-- Name: gtfsagency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfsagency" (
    "id" bigint NOT NULL,
    "agencyid" character varying(255),
    "lang" character varying(255),
    "name" character varying(255),
    "phone" character varying(255),
    "timezone" character varying(255),
    "url" character varying(255),
    "snapshot_id" bigint
);


ALTER TABLE "public"."gtfsagency" OWNER TO "postgres";

--
-- TOC entry 177 (class 1259 OID 18325)
-- Dependencies: 6
-- Name: gtfssnapshot; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfssnapshot" (
    "id" bigint NOT NULL,
    "agencycount" integer,
    "creationdate" timestamp without time zone,
    "description" character varying(255),
    "routecount" integer,
    "source" character varying(255),
    "stopcount" integer,
    "tripcount" integer
);


ALTER TABLE "public"."gtfssnapshot" OWNER TO "postgres";

--
-- TOC entry 178 (class 1259 OID 18331)
-- Dependencies: 6
-- Name: gtfssnapshotexport; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfssnapshotexport" (
    "id" bigint NOT NULL,
    "calendarfrom" timestamp without time zone,
    "calendarto" timestamp without time zone,
    "calendars" character varying(255),
    "description" character varying(255),
    "mergecomplete" timestamp without time zone,
    "mergestarted" timestamp without time zone,
    "source" character varying(255),
    "status" character varying(255)
);


ALTER TABLE "public"."gtfssnapshotexport" OWNER TO "postgres";

--
-- TOC entry 179 (class 1259 OID 18337)
-- Dependencies: 6
-- Name: gtfssnapshotexport_agency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfssnapshotexport_agency" (
    "gtfssnapshotexport_id" bigint NOT NULL,
    "agencies_id" bigint NOT NULL
);


ALTER TABLE "public"."gtfssnapshotexport_agency" OWNER TO "postgres";

--
-- TOC entry 180 (class 1259 OID 18340)
-- Dependencies: 6
-- Name: gtfssnapshotmerge; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfssnapshotmerge" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "mergecomplete" timestamp without time zone,
    "mergestarted" timestamp without time zone,
    "status" character varying(255),
    "snapshot_id" bigint
);


ALTER TABLE "public"."gtfssnapshotmerge" OWNER TO "postgres";

--
-- TOC entry 181 (class 1259 OID 18346)
-- Dependencies: 6
-- Name: gtfssnapshotmergetask; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfssnapshotmergetask" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "status" character varying(255),
    "taskcompleted" timestamp without time zone,
    "taskstarted" timestamp without time zone,
    "merge_id" bigint
);


ALTER TABLE "public"."gtfssnapshotmergetask" OWNER TO "postgres";

--
-- TOC entry 182 (class 1259 OID 18352)
-- Dependencies: 6
-- Name: gtfssnapshotvalidation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "gtfssnapshotvalidation" (
    "id" bigint NOT NULL,
    "status" character varying(255),
    "validationdesciption" character varying(255),
    "snapshot_id" bigint
);


ALTER TABLE "public"."gtfssnapshotvalidation" OWNER TO "postgres";

--
-- TOC entry 183 (class 1259 OID 18358)
-- Dependencies: 6
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "hibernate_sequence"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."hibernate_sequence" OWNER TO "postgres";

--
-- TOC entry 184 (class 1259 OID 18360)
-- Dependencies: 6
-- Name: oauthtoken; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "oauthtoken" (
    "id" bigint NOT NULL,
    "creationdate" bigint,
    "token" character varying(255),
    "agency_id" bigint
);


ALTER TABLE "public"."oauthtoken" OWNER TO "postgres";

--
-- TOC entry 185 (class 1259 OID 18363)
-- Dependencies: 6
-- Name: route; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "route" (
    "id" bigint NOT NULL,
    "comments" character varying(255),
    "gtfsrouteid" character varying(255),
    "publiclyvisible" boolean,
    "routecolor" character varying(255),
    "routedesc" "text",
    "routelongname" character varying(255),
    "routeshortname" character varying(255),
    "routetextcolor" character varying(255),
    "routeurl" character varying(255),
    "saturday" boolean,
    "status" character varying(255),
    "sunday" boolean,
    "weekday" boolean,
    "wheelchairboarding" character varying(255),
    "agency_id" bigint,
    "gisroute_id" bigint,
    "gisupload_id" bigint,
    "routetype_id" bigint
);


ALTER TABLE "public"."route" OWNER TO "postgres";

--
-- TOC entry 186 (class 1259 OID 18369)
-- Dependencies: 6
-- Name: routetype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "routetype" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "gtfsroutetype" character varying(255),
    "hvtroutetype" character varying(255),
    "localizedvehicletype" character varying(255)
);


ALTER TABLE "public"."routetype" OWNER TO "postgres";

--
-- TOC entry 187 (class 1259 OID 18375)
-- Dependencies: 6
-- Name: servicecalendar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "servicecalendar" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "enddate" timestamp without time zone,
    "friday" boolean,
    "gtfsserviceid" character varying(255),
    "monday" boolean,
    "saturday" boolean,
    "startdate" timestamp without time zone,
    "sunday" boolean,
    "thursday" boolean,
    "tuesday" boolean,
    "wednesday" boolean,
    "agency_id" bigint
);


ALTER TABLE "public"."servicecalendar" OWNER TO "postgres";

--
-- TOC entry 188 (class 1259 OID 18381)
-- Dependencies: 6
-- Name: servicecalendardate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "servicecalendardate" (
    "id" bigint NOT NULL,
    "date" timestamp without time zone,
    "description" character varying(255),
    "exceptiontype" character varying(255),
    "gtfsserviceid" character varying(255),
    "calendar_id" bigint
);


ALTER TABLE "public"."servicecalendardate" OWNER TO "postgres";

--
-- TOC entry 189 (class 1259 OID 18387)
-- Dependencies: 6
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "spatial_ref_sys" (
    "srid" integer NOT NULL,
    "auth_name" character varying(256),
    "auth_srid" integer,
    "srtext" character varying(2048),
    "proj4text" character varying(2048)
);


ALTER TABLE "public"."spatial_ref_sys" OWNER TO "postgres";

--
-- TOC entry 190 (class 1259 OID 18393)
-- Dependencies: 1321 6
-- Name: stop; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "stop" (
    "id" bigint NOT NULL,
    "bikeparking" character varying(255),
    "carparking" character varying(255),
    "dropofftype" character varying(255),
    "gtfsstopid" character varying(255),
    "location" "geometry",
    "locationtype" character varying(255),
    "majorstop" boolean,
    "parentstation" character varying(255),
    "pickuptype" character varying(255),
    "stopcode" character varying(255),
    "stopdesc" character varying(255),
    "stopiconurl" character varying(255),
    "stopname" character varying(255),
    "stopurl" character varying(255),
    "wheelchairboarding" character varying(255),
    "zoneid" character varying(255),
    "agency_id" bigint
);


ALTER TABLE "public"."stop" OWNER TO "postgres";

--
-- TOC entry 191 (class 1259 OID 18399)
-- Dependencies: 6
-- Name: stoptime; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "stoptime" (
    "id" bigint NOT NULL,
    "arrivaltime" integer,
    "departuretime" integer,
    "dropofftype" character varying(255),
    "pickuptype" character varying(255),
    "shapedisttraveled" double precision,
    "stopheadsign" character varying(255),
    "stopsequence" integer,
    "patternstop_id" bigint,
    "stop_id" bigint,
    "trip_id" bigint
);


ALTER TABLE "public"."stoptime" OWNER TO "postgres";

--
-- TOC entry 192 (class 1259 OID 18405)
-- Dependencies: 6
-- Name: stoptype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "stoptype" (
    "id" bigint NOT NULL,
    "description" character varying(255),
    "interpolated" boolean,
    "majorstop" boolean,
    "stoptype" character varying(255)
);


ALTER TABLE "public"."stoptype" OWNER TO "postgres";

--
-- TOC entry 193 (class 1259 OID 18411)
-- Dependencies: 6
-- Name: trip; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "trip" (
    "id" bigint NOT NULL,
    "blockid" character varying(255),
    "endtime" integer,
    "gtfstripid" character varying(255),
    "headway" integer,
    "invalid" boolean,
    "starttime" integer,
    "tripdescription" character varying(255),
    "tripdirection" character varying(255),
    "tripheadsign" character varying(255),
    "tripshortname" character varying(255),
    "usefrequency" boolean,
    "wheelchairboarding" character varying(255),
    "pattern_id" bigint,
    "route_id" bigint,
    "servicecalendar_id" bigint,
    "servicecalendardate_id" bigint,
    "shape_id" bigint
);


ALTER TABLE "public"."trip" OWNER TO "postgres";

--
-- TOC entry 194 (class 1259 OID 18417)
-- Dependencies: 2800 6
-- Name: trippattern; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "trippattern" (
    "id" bigint NOT NULL,
    "encodedshape" "text",
    "endtime" integer,
    "headsign" character varying(255),
    "headway" integer,
    "longest" boolean,
    "name" character varying(255),
    "saturday" boolean,
    "starttime" integer,
    "sunday" boolean,
    "usefrequency" boolean DEFAULT true,
    "weekday" boolean,
    "route_id" bigint,
    "shape_id" bigint
);


ALTER TABLE "public"."trippattern" OWNER TO "postgres";

--
-- TOC entry 195 (class 1259 OID 18424)
-- Dependencies: 6
-- Name: trippattern_trippatternstop; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "trippattern_trippatternstop" (
    "trippattern_id" bigint NOT NULL,
    "patternstops_id" bigint NOT NULL
);


ALTER TABLE "public"."trippattern_trippatternstop" OWNER TO "postgres";

--
-- TOC entry 196 (class 1259 OID 18427)
-- Dependencies: 6
-- Name: trippatternstop; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "trippatternstop" (
    "id" bigint NOT NULL,
    "defaultdistance" double precision,
    "defaultdwelltime" integer,
    "defaulttraveltime" integer,
    "stopsequence" integer,
    "pattern_id" bigint,
    "stop_id" bigint
);


ALTER TABLE "public"."trippatternstop" OWNER TO "postgres";

--
-- TOC entry 197 (class 1259 OID 18430)
-- Dependencies: 1321 1321 6
-- Name: tripshape; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "tripshape" (
    "id" bigint NOT NULL,
    "describeddistance" double precision,
    "description" character varying(255),
    "gtfsshapeid" character varying(255),
    "shape" "geometry",
    "simpleshape" "geometry",
    "agency_id" bigint
);


ALTER TABLE "public"."tripshape" OWNER TO "postgres";

--
-- TOC entry 3013 (class 0 OID 18242)
-- Dependencies: 162 3048
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "account" VALUES (1, true, true, 'info@quasoft.net', '2016-01-23 14:52:35.245', 'a2466782c36880c8a96815e5fee1d3ec', NULL, 'admin', NULL);


--
-- TOC entry 3014 (class 0 OID 18248)
-- Dependencies: 163 3048
-- Data for Name: agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "agency" VALUES (5, NULL, 43.07403, 25.625610000000002, 'ВТ', 'bg', 'Велико Търново', NULL, NULL, 'Europe/Sofia', 'https://www.veliko-tarnovo.bg/bg/transport/', 4);


--
-- TOC entry 3015 (class 0 OID 18259)
-- Dependencies: 165 3048
-- Data for Name: geometry_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3016 (class 0 OID 18265)
-- Dependencies: 166 3048
-- Data for Name: gisexport; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "gisexport" VALUES (35, '2015-01-08 12:07:04.73', '', 'PROCESSED', 'ROUTES');
INSERT INTO "gisexport" VALUES (1641, '2015-07-24 11:25:08.784', '', 'PROCESSED', 'ROUTES');
INSERT INTO "gisexport" VALUES (1642, '2015-07-24 11:25:15.341', '', 'PROCESSED', 'STOPS');


--
-- TOC entry 3017 (class 0 OID 18271)
-- Dependencies: 167 3048
-- Data for Name: gisexport_agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "gisexport_agency" VALUES (35, 5);
INSERT INTO "gisexport_agency" VALUES (1641, 5);
INSERT INTO "gisexport_agency" VALUES (1642, 5);


--
-- TOC entry 3018 (class 0 OID 18274)
-- Dependencies: 168 3048
-- Data for Name: gisroute; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3019 (class 0 OID 18280)
-- Dependencies: 169 3048
-- Data for Name: gisroutealignment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3020 (class 0 OID 18286)
-- Dependencies: 170 3048
-- Data for Name: gisroutecontrolpoint; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3021 (class 0 OID 18292)
-- Dependencies: 171 3048
-- Data for Name: gisroutecontrolpointsequence; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3022 (class 0 OID 18295)
-- Dependencies: 172 3048
-- Data for Name: gisroutesegment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3023 (class 0 OID 18301)
-- Dependencies: 173 3048
-- Data for Name: gisstop; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3024 (class 0 OID 18307)
-- Dependencies: 174 3048
-- Data for Name: gisupload; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3025 (class 0 OID 18313)
-- Dependencies: 175 3048
-- Data for Name: gisuploadfield; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3026 (class 0 OID 18319)
-- Dependencies: 176 3048
-- Data for Name: gtfsagency; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3027 (class 0 OID 18325)
-- Dependencies: 177 3048
-- Data for Name: gtfssnapshot; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3028 (class 0 OID 18331)
-- Dependencies: 178 3048
-- Data for Name: gtfssnapshotexport; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "gtfssnapshotexport" VALUES (414, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-01-19 14:29:36.115', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (426, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-01-21 11:54:40.778', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1640, '2015-07-24 03:00:00', '2015-08-24 03:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-24 11:24:46.787', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1693, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-24 13:19:27.862', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1694, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-24 17:21:04.098', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1751, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 20:54:13.764', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1781, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 22:08:52.011', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1782, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 22:46:57.098', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1783, '2015-06-01 03:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 23:03:58.244', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1784, '2015-07-01 03:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 23:09:26.844', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1785, '2015-07-31 23:45:12.645', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 23:45:18.467', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1786, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-07-31 23:45:27.8', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1797, '2015-08-01 00:57:59.506', '2015-09-01 00:57:59.507', 'CURRENT_AND_FUTURE', '', NULL, '2015-08-01 00:58:00.779', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1798, '2015-01-01 02:00:00', '2015-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-08-01 00:58:12.791', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1970, '2015-01-01 02:00:00', '2016-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-08-02 13:12:23.493', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1971, '2015-01-01 02:00:00', '2016-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-09-05 10:21:52.424', 'MANUAL_EXPORT', 'SUCCESS');
INSERT INTO "gtfssnapshotexport" VALUES (1972, '2015-01-01 02:00:00', '2016-12-31 02:00:00', 'CURRENT_AND_FUTURE', '', NULL, '2015-09-05 10:24:16.866', 'MANUAL_EXPORT', 'SUCCESS');


--
-- TOC entry 3029 (class 0 OID 18337)
-- Dependencies: 179 3048
-- Data for Name: gtfssnapshotexport_agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "gtfssnapshotexport_agency" VALUES (414, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (426, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1640, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1693, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1694, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1751, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1781, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1782, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1783, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1784, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1781, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1782, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1783, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1784, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1785, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1786, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1797, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1798, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1970, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1971, 5);
INSERT INTO "gtfssnapshotexport_agency" VALUES (1972, 5);


--
-- TOC entry 3030 (class 0 OID 18340)
-- Dependencies: 180 3048
-- Data for Name: gtfssnapshotmerge; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3031 (class 0 OID 18346)
-- Dependencies: 181 3048
-- Data for Name: gtfssnapshotmergetask; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3032 (class 0 OID 18352)
-- Dependencies: 182 3048
-- Data for Name: gtfssnapshotvalidation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 183
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"hibernate_sequence"', 1972, true);


--
-- TOC entry 3034 (class 0 OID 18360)
-- Dependencies: 184 3048
-- Data for Name: oauthtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3035 (class 0 OID 18363)
-- Dependencies: 185 3048
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "route" VALUES (163, '', 'ROUTE_163', true, '#00b833', '', 'Автобус 9', '9', '', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1136, '', 'ROUTE_1136', true, '#ef7f1b', '', 'Автобус 70', '70', '', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1591, '', 'ROUTE_1591', true, '', '', 'Автобус 8', '8', '', '', NULL, 'APPROVED', NULL, NULL, 'UNKNOWN', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (417, '', 'ROUTE_417', true, '#dff200', '', 'Автобус 5', '5', '#000000', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1043, '', 'ROUTE_1043', true, '#afcb1f', '', 'Автобус 1', '1', '#000000', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (593, '', 'ROUTE_593', true, '#d500d9', '', 'Автобус 30', '30', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'UNKNOWN', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (9, '', 'ROUTE_9', true, '#e85959', '', 'Автобус 4', '4', '#000000', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (114, '', 'ROUTE_114', true, '#00d9d9', '', 'Автобус 40', '40', '#000000', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (626, '', 'ROUTE_626', true, '#b900c9', '', 'Автобус 50', '50', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'UNKNOWN', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1643, '', 'ROUTE_1643', true, '#de0008', '', 'Автобус 110', '110', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'UNKNOWN', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1884, '', 'ROUTE_1884', true, '', '', 'Маршрутен автобус В.Търново-Г.Оряховица', 'Маршрутка В.Т.-Г.О', '', '', NULL, 'APPROVED', NULL, NULL, 'UNKNOWN', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (313, '', 'ROUTE_313', true, '#e0b004', '', 'Автобус 13', '13', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1082, '', 'ROUTE_1082', true, '#3e8ad9', '', 'Автобус 2', '2', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (379, '', 'ROUTE_379', true, '#6108d6', '', 'Автобус 20', '20', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'AVAILABLE', 5, NULL, NULL, 4);
INSERT INTO "route" VALUES (1754, '', 'ROUTE_1754', true, '#030cdb', '', 'В.Търново-Г.Оряховица', 'Влак', '#ffffff', '', NULL, 'APPROVED', NULL, NULL, 'UNKNOWN', 5, NULL, NULL, 1752);


--
-- TOC entry 3036 (class 0 OID 18369)
-- Dependencies: 186 3048
-- Data for Name: routetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "routetype" VALUES (4, 'Градски автобус', 'BUS', 'BUS_LOCAL', 'Автобус');
INSERT INTO "routetype" VALUES (1752, 'Железница', 'RAIL', 'RAIL', 'Влак');


--
-- TOC entry 3037 (class 0 OID 18375)
-- Dependencies: 187 3048
-- Data for Name: servicecalendar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "servicecalendar" VALUES (32, 'Делнични дни', NULL, true, 'CAL_32', true, false, NULL, false, true, true, true, 5);
INSERT INTO "servicecalendar" VALUES (33, 'Почивни дни', NULL, false, 'CAL_33', false, true, NULL, true, false, false, false, 5);
INSERT INTO "servicecalendar" VALUES (107, 'През цялата седмица', NULL, true, 'CAL_107', true, true, NULL, true, true, true, true, 5);


--
-- TOC entry 3038 (class 0 OID 18381)
-- Dependencies: 188 3048
-- Data for Name: servicecalendardate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3039 (class 0 OID 18387)
-- Dependencies: 189 3048
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3040 (class 0 OID 18393)
-- Dependencies: 190 3048
-- Data for Name: stop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "stop" VALUES (77, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_77', '0101000020E610000000000080D69E3940CCE1F8F5208A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'Срещу стадион "Йвайло"', NULL, 'Европейски център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (52, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_52', '0101000020E610000000000098189F39402E5A90E7BF8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Картала - обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (63, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_63', '0101000020E6100000000000488EA6394083ED04BBB9894540', NULL, false, NULL, 'SCHEDULED', NULL, 'До студентски общежития', NULL, 'ВТУ - 11 блок', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (75, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_75', '0101000020E61000000000003C81A1394054383FC0648A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'Пред театъра, близо до общината', NULL, 'МДТ "Константин Кисимов"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (122, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_122', '0101000020E6100000FFFFFF0B35A539403FAF2D5C728A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'Царевец', NULL, 'пл. Цар Асен I', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (115, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_115', '0101000020E61000000000008C05A039407A8DB1FE6D8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'кв. Акация - старо обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (116, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_116', '0101000020E6100000000000ECF19E39407EF5DF545E8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'кв. Акация - ул. Освобождение', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (53, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_53', '0101000020E6100000000000285C9E3940A5F8E6C08A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'кв. Акация', NULL, 'Пейо К. Яворов', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (79, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_79', '0101000020E6100000000000C4A19E39400D511A868B8A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'кв. Акация', NULL, 'Пейо К. Яворов', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (78, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_78', '0101000020E610000000000000FE9C394067D2591D568A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковско шосе', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (54, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_54', '0101000020E6100000000000CCE69C3940C81ABA124B8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковско шосе', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (55, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_55', '0101000020E610000000000014079E394003C7A7002C8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горско управление', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (56, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_56', '0101000020E6100000000000E0FD9E394063B0CE481A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Стадион "Ивайло"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (117, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_117', '0101000020E610000000000068CCA2394004460179D58A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Старите хали', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (58, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_58', '0101000020E6100000000000ECC1A139408F7147E37C8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, '"Майка България"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (124, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_124', '0101000020E61000000000000C1499394042D21FC1D1874540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Чолаковци', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (118, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_118', '0101000020E6100000000000A0FDA239407F5AD160DB8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Старите хали', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (74, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_74', '0101000020E61000000000006C05A23940979D004B798A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Централна поща', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (132, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_132', '0101000020E6100000000000988EA1394017CF28531F884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Товарна гара', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (125, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_125', '0101000020E6100000000000782F99394028D59634BD874540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Чолаковци', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (119, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_119', '0101000020E61000000000007815A4394076E16EA5998A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'пл. Велчова Завера', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (120, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_120', '0101000020E61000000000002C9DA43940D86B141A5F8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Конака', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (59, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_59', '0101000020E6100000000000AC10A239409C52683BC3894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Автогара Юг', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (73, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_73', '0101000020E610000091ED7C3F35A2394028F224E99A894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Автогара Юг', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (60, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_60', '0101000020E61000000000006CD8A139406BC494A157894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бирена фабрика', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (72, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_72', '0101000020E61000000000007CE6A139408A11E82933894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бирена фабрика', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (62, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_62', '0101000020E6100000000000EC53A63940FA268FE00A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ВТУ - Ректорат', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (70, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_70', '0101000020E6100000FFFFFF0F5DA639407192581B0A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ВТУ - Ректорат', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (126, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_126', '0101000020E6100000000000EC8C9A39401F207C99C2874540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Радиозавод', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (64, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_64', '0101000020E61000000000005C10A739401E85C1756D894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ВТУ - обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (330, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_330', '0101000020E61000000000003CC7A63940A43CD3DDBE894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Димитър Найденов 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (57, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_57', '0101000020E6100000000000E899A03940041C26370E8A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'До централен пазар', NULL, 'Съдебна палата', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (121, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_121', '0101000020E61000000000009C2CA539408B1D837E648A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'Заревец', NULL, 'пл. Цар Асен I', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (131, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_131', '0101000020E61000000000007C9D9F39405B9C0C4BEF874540', NULL, false, NULL, 'SCHEDULED', NULL, 'ул. Дълга лъка', NULL, 'МСД', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (127, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_127', '0101000020E610000000000014B09A3940D7551B39C7874540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Радиозавод', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (130, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_130', '0101000020E610000000000040529F3940A22E2FE6E9874540', NULL, false, NULL, 'SCHEDULED', NULL, 'ул. Дълга лъка', NULL, 'МСД', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (133, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_133', '0101000020E61000000000002CA0A139402C82F1A221884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Товарна гара', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (129, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_129', '0101000020E610000000000058FF9D39403F7A711CDF874540', NULL, false, NULL, 'SCHEDULED', NULL, 'ул. Дълга лъка', NULL, 'Дървообработване', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (128, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_128', '0101000020E6100000000000CCF49D394063F3C7F6E2874540', NULL, false, NULL, 'SCHEDULED', NULL, 'ул. Дълга лъка', NULL, 'Дървообработване', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (331, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_331', '0101000020E6100000FFFFFFEBADA63940E8D89A26288A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Димитър Найденов 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (332, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_332', '0101000020E6100000FFFFFFA788A639404B5A7FE9578A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Сливница', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (333, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_333', '0101000020E6100000000000884DA739408E87F752258B4540', NULL, false, NULL, 'SCHEDULED', NULL, 'Моста за Мавриков', NULL, 'Михаил Кефалов', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (334, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_334', '0101000020E6100000FFFFFF677DA63940E9FC13F2298B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Помощно училище', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (335, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_335', '0101000020E6100000000000A85BA63940F13F01ADF98A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Св. 40 мъченици', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (329, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_329', '0101000020E61000000000003894A139408886F5BC6D8A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'Пред театъра, близо до общината', NULL, 'МДТ "Константин Кисимов"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (71, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_71', '0101000020E6100000FFFFFFBFA0A33940BA05F33E78894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ЖП гара - спирка', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (61, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_61', '0101000020E6100000FFFFFF4BABA3394001787EB476894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ЖП гара - спирка', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (336, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_336', '0101000020E61000000000005455A639401A1DE4B3E78A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Св. 40 мъченици', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (318, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_318', '0101000020E61000000000009C819B3940F312E735E0884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бузлуджа 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (436, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_436', '0101000020E61000000000000854993940ADDF6480228A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Mall Велико Търново', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (337, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_337', '0101000020E61000000000007804A63940379751B7DE8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Св. 40 мъченици', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (319, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_319', '0101000020E6100000000000B4699B3940FD39A185E2884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бузлуджа 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (338, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_338', '0101000020E6100000000000BCCFA539409BF3AA445C8B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ЖП Гара Трапезица', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (443, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_443', '0101000020E610000000000014DD9A39408D52FB01658A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Военен университет 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (339, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_339', '0101000020E610000000000088E5A539407B21EFD55E8B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ЖП Гара Трапезица', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (437, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_437', '0101000020E61000000000009C65993940D2F511071A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Mall Велико Търново', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (340, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_340', '0101000020E6100000000000EC8EA739407C2439B03C8B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Мавриков', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (321, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_321', '0101000020E6100000000000B8569B39400E3670C866894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Качица', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (352, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_352', '0101000020E610000000000078CCA13940853AC96D59894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бирена фабрика', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (322, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_322', '0101000020E61000000000000C5D9B3940CD122B0D5E894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Качица', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (444, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_444', '0101000020E6100000FFFFFFC7839A3940F34458D85E8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Военен университет 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (438, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_438', '0101000020E6100000000000D43C9939406A6A8B8A1A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Mall Велико Търново', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (416, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_416', '0101000020E610000000000078599C394042A401AAC0894540', NULL, false, NULL, 'SCHEDULED', NULL, 'между Спортна зала и Медицински колеж', NULL, 'Краков', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (323, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_323', '0101000020E61000000000005C0B9D3940DE4ECC617D894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Изчислителен център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (324, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_324', '0101000020E610000000000014539D3940BA7ADF3F8B894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Болница', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (428, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_428', '0101000020E6100000000000E8349C394002F8E0F8AF894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Медицински колеж', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (325, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_325', '0101000020E610000000000020559E39404EA6BB5197894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бавария', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (440, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_440', '0101000020E6100000FFFFFFCF5D9A39409B38195BD1894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Оборище', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (429, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_429', '0101000020E61000000000001C3E9B3940EF97BA14B4894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Студентски общежития', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (326, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_326', '0101000020E610000000000034D79E39401657D521A3894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Габровски', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (439, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_439', '0101000020E61000000000001C5D9A39403D22F96FD4894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Оборище', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (327, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_327', '0101000020E6100000000000D0769F3940BDC0E902A8894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Пожарна', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (427, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_427', '0101000020E6100000FFFFFFCB329C3940FC7C6E5DB5894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'СОУ "Емилиян Станев"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (430, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_430', '0101000020E6100000000000D03E9B394002F8E0F8AF894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Студентски общежития', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (446, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_446', '0101000020E610000000000044349B3940A97D8EE2568A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Полтава 3', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (433, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_433', '0101000020E6100000000000D4A49A394014E4CDF4FA894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Георги Бакалов', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (441, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_441', '0101000020E6100000FFFFFF3B799A3940E3797234C2894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'МТС', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (434, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_434', '0101000020E610000000000070369A39407AEE20842C8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Библиотека', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (435, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_435', '0101000020E6100000000000687B9939405D81DDC52C8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Mall Велико Търново', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (314, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_314', '0101000020E6100000000000E0B49C39404E7E059C9A884540', NULL, false, NULL, 'SCHEDULED', NULL, 'кв. Бузлуджа', NULL, 'Старчески дом', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (442, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_442', '0101000020E610000000000014569A3940C8702E4DCF894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'МТС', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (315, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_315', '0101000020E6100000000000F4AF9C39409229C69E91884540', NULL, false, NULL, 'SCHEDULED', NULL, 'кв. Бузлуджа', NULL, 'Старчески дом', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (316, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_316', '0101000020E6100000FFFFFF0BB79B3940F03DC6AC93884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бузлуджа 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (449, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_449', '0101000020E6100000000000E06B9A394038989DDB558A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Полтава 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (317, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_317', '0101000020E610000000000048A89B3940EDC8C5898E884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бузлуджа 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (453, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_453', '0101000020E6100000000000203C9939402FC7A4B5598A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Полтава 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (450, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_450', '0101000020E6100000000000E4779939404CABBC1D698A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Военен университет 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (447, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_447', '0101000020E6100000000000000F9B39402E222558558A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Полтава 3', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (448, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_448', '0101000020E6100000000000587B9A3940FBF9B3AE588A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Полтава 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (452, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_452', '0101000020E6100000FFFFFFCB359939400ACEBA885C8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Полтава 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (451, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_451', '0101000020E61000000000005C5A99394032B1B169618A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Военен университет 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (454, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_454', '0101000020E6100000FFFFFFBB709B3940609F101685894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Електротехникум', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (455, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_455', '0101000020E6100000FFFFFF6B2D983940697EF7B14F8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Детелина Запад', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (456, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_456', '0101000020E6100000000000E8BB9C394062E900E9A5884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Старчески дом - обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (457, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_457', '0101000020E610000000000090A99D3940DED26F9DDC884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Венета Ботева', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (458, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_458', '0101000020E610000000000098B09D3940B6991A8EC7884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лазурна', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (459, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_459', '0101000020E61000000000004C659E3940143DDF4AE3884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Микропазар', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (494, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_494', '0101000020E6100000FFFFFF0BB49E3940A76A03C587854540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Дебелец - Център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (460, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_460', '0101000020E610000000000010479E3940B05F4114EE884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Микропазар', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (493, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_493', '0101000020E610000000000084C39E39408F10CFB685854540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Дебелец - Център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (461, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_461', '0101000020E6100000000000A04C9F3940B7A678B2B0884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Зона 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (462, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_462', '0101000020E610000000000084F09E39405EF6FA20AE884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Зона 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (463, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_463', '0101000020E6100000000000C049A03940294585B363894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Мармарлийска', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (495, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_495', '0101000020E610000000000070BA9D3940B0A462FC29854540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Дебелец - обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (464, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_464', '0101000020E6100000FFFFFF2778A03940B9D18A8595894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Мармарлийска', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (465, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_465', '0101000020E6100000000000EC59A03940ACAF2F86FD894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Централен пазар', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (496, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_496', '0101000020E61000000000000CA69D3940B0A462FC29854540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Дебелец - обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (466, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_466', '0101000020E6100000000000DC4BA03940EFEFE2780E8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Централен пазар', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (497, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_497', '0101000020E61000000000007444A63940E72B1C9D0B894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Мотела', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (498, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_498', '0101000020E6100000000000AC48A63940B5C6703806894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Мотела', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (499, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_499', '0101000020E61000000000004C0DAB394044E33DB321894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Малки Чифлик - главен път', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (500, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_500', '0101000020E6100000000000ECE5AA394015AE708624894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Малки Чифлик - главен път', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1137, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1137', '0101000020E61000000000000490AC39405A3A188676884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Малки Чифлик - център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (468, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_468', '0101000020E6100000000000B019A43940942719EE9A8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'пл. Велчова Завера', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (469, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_469', '0101000020E6100000000000DC0DA239402EF075EE0C8A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Летен Театър', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (470, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_470', '0101000020E61000000000007098A1394093E9F5F7F1894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Бачо Киро', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (471, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_471', '0101000020E6100000000000A8E09939408B1E64CA4A894540', NULL, false, NULL, 'SCHEDULED', NULL, 'До автогарата, на ул Никола Габровски', NULL, 'Автогара Запад', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (472, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_472', '0101000020E61000000000002CE499394014C7C95E44894540', NULL, false, NULL, 'SCHEDULED', NULL, 'До автогарата, на ул Никола Габровски', NULL, 'Автогара Запад', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (473, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_473', '0101000020E61000000000006C0E9939408AD57AA33B894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Автогара Запад - Кръгово', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (474, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_474', '0101000020E61000000000003C119939400FE4D73E36894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Автогара Запад - Кръгово', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (475, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_475', '0101000020E6100000000000A8D29839407B7E07002D894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Елмот', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (476, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_476', '0101000020E6100000FFFFFF4FDF983940DD42C02F21894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Елмот', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (477, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_477', '0101000020E6100000000000142C9739400FD41C0841894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Западна промишлена зона 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (478, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_478', '0101000020E6100000000000F8FC963940FEA9EC343E894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Западна промишлена зона 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (479, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_479', '0101000020E61000000000007CC5953940A7C633EC3C894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Западна промишлена зона 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (480, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_480', '0101000020E610000000000048AE953940FD5E28FA3E894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Западна промишлена зона 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (69, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_69', '0101000020E61000003BC269C18BA63940F6285C8FC2894540', NULL, false, NULL, 'SCHEDULED', NULL, 'До студентски общежития', NULL, 'ВТУ - 11 блок', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (481, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_481', '0101000020E6100000FFFFFF7FAA8E39401DB5A18E7A894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Шемшево 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (482, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_482', '0101000020E6100000FFFFFFF39F8E3940BEF499957B894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Шемшево 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (483, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_483', '0101000020E61000000000008C638D394015A4F6DB14894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Шемшево 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (484, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_484', '0101000020E6100000000000DC9B8C39400192250B7A894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Шемшево 3', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (485, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_485', '0101000020E610000000000040DD8C3940150A707BF2894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Леденик 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (486, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_486', '0101000020E6100000000000FCD68B39408E10DC0F678A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Леденик - обръщало', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (488, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_488', '0101000020E610000000000028E0A13940035FBA57C2874540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Хлебозавод "Велико Търново"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (489, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_489', '0101000020E6100000000000EC94A1394072F3707411884540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Товарна гара', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (490, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_490', '0101000020E610000000000068EBA1394028D59634BD874540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Хлебозавод "Велико Търново"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (491, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_491', '0101000020E6100000FFFFFF77BEA03940C2BB40D0DC854540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ОУ "Д-р Петър Берон"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (492, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_492', '0101000020E6100000FFFFFF0F63A0394058E49AF7CF854540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'ОУ "Д-р Петър Берон"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1593, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1593', '0101000020E6100000000000684B9C3940F6B5B3011E8B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Гробищен парк - централен вход', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1594, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1594', '0101000020E6100000000000B44A9C39408F35C5271A8B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Гробищен парк - централен вход', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1596, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1596', '0101000020E6100000000000BCE99A3940D3567EAC588B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Гробищен парк - втори вход', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1597, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1597', '0101000020E6100000000000E6EC9A3940F9FA452E548B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Гробищен парк - втори вход', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1600, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1600', '0101000020E6100000000000B8B3983940F176BB9D8C8C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковец 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1601, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1601', '0101000020E6100000FFFFFFDFA9983940BB4908288E8C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковец 2', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1602, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1602', '0101000020E6100000000000F61C973940A818E3E3568D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковец 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1603, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1603', '0101000020E6100000000000BE18973940425FA059558D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковец 1', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1604, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1604', '0101000020E6100000000000B8E3953940D62930C8828D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Беляковец', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1605, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1605', '0101000020E6100000000000847D9939409ADEB77347894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Автогара Запад', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1720, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1720', '0101000020E6100000FFFFFF01F9AE394097FB863C74904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - ПТГ "В. Левски"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1652, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1652', '0101000020E6100000FFFFFFAF609939406ACCE83A188A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Mall Велико Търново', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (76, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_76', '0101000020E61000000000008692A03940F7488EB5128A4540', NULL, false, NULL, 'SCHEDULED', NULL, 'До централен пазар', NULL, 'Съдебна палата', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (328, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_328', '0101000020E610000000000036A6A03940A426E14D168A4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Съдебна палата', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1722, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1722', '0101000020E6100000000000F00AAF39406587E492F6904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - "В. Левски" 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1696, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1696', '0101000020E6100000000000409C913940E8ED23F839894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Западна промишлена зона 3-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1695, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1695', '0101000020E61000000000002A94913940CCD875A136894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Западна промишлена зона 3-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1697, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1697', '0101000020E610000000000080F1B0394089CEE465DC894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Шереметя', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1698, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1698', '0101000020E61000000000007EE4B03940DD1995D2D4894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Шереметя', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1699, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1699', '0101000020E61000000000000C3FB939407B65894E098C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1714, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1714', '0101000020E6100000FFFFFF5387B03940EE38F924CB8F4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1700, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1700', '0101000020E61000000000000A32B93940C40C7CFD018C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1701, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1701', '0101000020E61000000000001E00B93940B42C715E7E8C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1725, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1725', '0101000020E6100000FFFFFF6349B13940A47166EA60914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - "В. Левски" 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1702, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1702', '0101000020E6100000000000FCD6B83940180695D88B8C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1715, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1715', '0101000020E6100000FFFFFFB381B03940845DD142DE8F4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Център', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1703, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1703', '0101000020E61000000000000E98B8394051517DD5C48C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 3-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1713, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1713', '0101000020E6100000FFFFFF5BE8B03940A03E812B668F4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Автогара', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1704, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1704', '0101000020E6100000000000C478B839404E428235D38C4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 3-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1712, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1712', '0101000020E61000000000002CDAB239409005024E0F8F4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - МБАЛ "Св. Иван Рилски"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1705, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1705', '0101000020E610000000000012D1B739404DE09825578D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 4-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1711, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1711', '0101000020E61000000000008E0EB33940DE41C2DB028F4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - МБАЛ "Св. Иван Рилски"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1706, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1706', '0101000020E6100000000000A688B73940B71F17FB638D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 4-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1707, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1707', '0101000020E610000000000006CFB63940E55782D3C78D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 5-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1716, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1716', '0101000020E6100000000000A680B039405A9EDB61908F4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Цар Освободител', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1708, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1708', '0101000020E610000000000076AAB639408E9AFEFED78D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 5-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1709, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1709', '0101000020E61000000000003844B53940F2857426438E4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 6-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1710, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1710', '0101000020E6100000000000520CB539400DEB319A548E4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Лясковец 6-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1718, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1718', '0101000020E6100000000000B6BBB039403487F72954904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - ПГЕЕ "М. В. Ломоносов"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1717, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1717', '0101000020E6100000000000A0B3B039402541A01B4D904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - ПГЕЕ "М. В. Ломоносов"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1723, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1723', '0101000020E61000000000001640AE39407733B67590904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - "П. Р. Славейков"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1719, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1719', '0101000020E6100000000000B419AF3940EA98F0647A904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - ПТГ "В. Левски"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1724, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1724', '0101000020E61000000000008E22AE3940976C0688B0904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - "П. Р. Славейков"', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1726, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1726', '0101000020E61000000000008258B13940E6E9ED4874914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - "В. Левски" 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1721, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1721', '0101000020E6100000FFFFFF8349AF3940CFEC5C9AFC904540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - "В. Левски" 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1727, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1727', '0101000020E61000000000004261AC3940BBA4C539CA914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Съединение 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1728, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1728', '0101000020E61000000000002AA6AC394028488738C0914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Съединение 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1729, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1729', '0101000020E61000000000004A2AAE39406C9C93E7AE914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Съединение 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1730, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1730', '0101000020E6100000000000DC88AE3940EC910977A7914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Съединение 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1731, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1731', '0101000020E61000000000001422B0394007A6B84AB4914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Съединение 3-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1733, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1733', '0101000020E610000000000074A9AA39400FE889FDF6914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - П. Цвикев', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1734, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1734', '0101000020E6100000000000A299AA39404A9FE80AF9914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - П. Цвикев', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1735, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1735', '0101000020E61000000000007E55A93940308CB1F26B934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 5-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1736, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1736', '0101000020E6100000000000F03DA939406748775B68934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 5-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1737, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1737', '0101000020E61000000000003286A6394065CEEA9293934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 4-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1738, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1738', '0101000020E61000000000005C5CA63940E8DF44CE97934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 4-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1739, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1739', '0101000020E6100000000000043FA3394046279110A2934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 3-та', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1740, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1740', '0101000020E61000000000002420A239409130F10E89934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1741, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1741', '0101000020E6100000FFFFFF2D07A2394086CC6F2F84934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1742, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1742', '0101000020E610000000000018D2A139404ED1A57C6D934540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Първомайци - 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1743, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1743', '0101000020E6100000000000C03E9C39401132DB2115924540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Самоводене 2-ра', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1744, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1744', '0101000020E6100000FFFFFFF5E99C3940AF8F85455B914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Самоводене 1-ва', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1745, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1745', '0101000020E61000000000000E679E3940C53450721F8D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Пречиствателна станция', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1746, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1746', '0101000020E6100000000000E8509E39405A31D438258D4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Пречиствателна станция', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1755, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1755', '0101000020E6100000000000EE63A33940DF8846EA79894540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'В. Търново - ЖП гара - перон', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1756, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1756', '0101000020E61000000000003C32A539404DD016C52C8B4540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Трапезица - ЖП гара', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1757, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1757', '0101000020E6100000000000F4719E39407288E9549D914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Самоводене - ЖП гара', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1732, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1732', '0101000020E61000000000008495AE3940B92B30B2DC914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Горна Оряховица - Предгаров площад', NULL, 'UNKNOWN', NULL, 5);
INSERT INTO "stop" VALUES (1758, 'UNKNOWN', 'UNKNOWN', 'SCHEDULED', 'STOP_1758', '0101000020E61000000000008495AE3940203F2BC0E3914540', NULL, false, NULL, 'SCHEDULED', NULL, '', NULL, 'Г. Оряховица - ЖП гара', NULL, 'UNKNOWN', NULL, 5);


--
-- TOC entry 3041 (class 0 OID 18399)
-- Dependencies: 191 3048
-- Data for Name: stoptime; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "stoptime" VALUES (742, 25800, 25830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 741);
INSERT INTO "stoptime" VALUES (743, 25879, 25909, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 741);
INSERT INTO "stoptime" VALUES (744, 25946, 25976, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 741);
INSERT INTO "stoptime" VALUES (745, 26250, 26280, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 741);
INSERT INTO "stoptime" VALUES (746, 26437, 26467, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 741);
INSERT INTO "stoptime" VALUES (747, 26522, 26552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 741);
INSERT INTO "stoptime" VALUES (748, 26661, 26691, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 741);
INSERT INTO "stoptime" VALUES (749, 26727, 26757, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 741);
INSERT INTO "stoptime" VALUES (750, 26828, 26858, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 741);
INSERT INTO "stoptime" VALUES (751, 26989, 27019, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 741);
INSERT INTO "stoptime" VALUES (752, 27114, 27144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 741);
INSERT INTO "stoptime" VALUES (753, 27334, 27364, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 741);
INSERT INTO "stoptime" VALUES (754, 27429, 27459, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 741);
INSERT INTO "stoptime" VALUES (755, 27582, 27612, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 741);
INSERT INTO "stoptime" VALUES (757, 65400, 65430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 756);
INSERT INTO "stoptime" VALUES (758, 65479, 65509, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 756);
INSERT INTO "stoptime" VALUES (759, 65546, 65576, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 756);
INSERT INTO "stoptime" VALUES (760, 65850, 65880, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 756);
INSERT INTO "stoptime" VALUES (761, 66037, 66067, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 756);
INSERT INTO "stoptime" VALUES (762, 66122, 66152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 756);
INSERT INTO "stoptime" VALUES (763, 66261, 66291, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 756);
INSERT INTO "stoptime" VALUES (764, 66327, 66357, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 756);
INSERT INTO "stoptime" VALUES (765, 66428, 66458, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 756);
INSERT INTO "stoptime" VALUES (766, 66589, 66619, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 756);
INSERT INTO "stoptime" VALUES (767, 66714, 66744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 756);
INSERT INTO "stoptime" VALUES (768, 66934, 66964, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 756);
INSERT INTO "stoptime" VALUES (769, 67029, 67059, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 756);
INSERT INTO "stoptime" VALUES (770, 67182, 67212, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 756);
INSERT INTO "stoptime" VALUES (712, 63300, 63330, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 711);
INSERT INTO "stoptime" VALUES (713, 63457, 63487, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 711);
INSERT INTO "stoptime" VALUES (714, 63543, 63573, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 711);
INSERT INTO "stoptime" VALUES (715, 63746, 63776, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 711);
INSERT INTO "stoptime" VALUES (716, 63857, 63887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 711);
INSERT INTO "stoptime" VALUES (717, 63958, 63988, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 711);
INSERT INTO "stoptime" VALUES (718, 64076, 64106, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 711);
INSERT INTO "stoptime" VALUES (719, 64193, 64223, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 711);
INSERT INTO "stoptime" VALUES (720, 64338, 64368, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 711);
INSERT INTO "stoptime" VALUES (721, 64418, 64448, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 711);
INSERT INTO "stoptime" VALUES (722, 64709, 64739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 711);
INSERT INTO "stoptime" VALUES (723, 65012, 65042, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 711);
INSERT INTO "stoptime" VALUES (724, 65082, 65112, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 711);
INSERT INTO "stoptime" VALUES (725, 65170, 65200, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 711);
INSERT INTO "stoptime" VALUES (778, 24476, 24506, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 771);
INSERT INTO "stoptime" VALUES (779, 24593, 24623, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 771);
INSERT INTO "stoptime" VALUES (780, 24738, 24768, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 771);
INSERT INTO "stoptime" VALUES (781, 24818, 24848, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 771);
INSERT INTO "stoptime" VALUES (782, 25109, 25139, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 771);
INSERT INTO "stoptime" VALUES (783, 25412, 25442, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 771);
INSERT INTO "stoptime" VALUES (784, 25482, 25512, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 771);
INSERT INTO "stoptime" VALUES (785, 25570, 25600, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 771);
INSERT INTO "stoptime" VALUES (787, 23700, 23730, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 786);
INSERT INTO "stoptime" VALUES (788, 23857, 23887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 786);
INSERT INTO "stoptime" VALUES (789, 23943, 23973, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 786);
INSERT INTO "stoptime" VALUES (790, 24146, 24176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 786);
INSERT INTO "stoptime" VALUES (791, 24257, 24287, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 786);
INSERT INTO "stoptime" VALUES (792, 24358, 24388, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 786);
INSERT INTO "stoptime" VALUES (772, 23700, 23730, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 771);
INSERT INTO "stoptime" VALUES (773, 23857, 23887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 771);
INSERT INTO "stoptime" VALUES (774, 23943, 23973, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 771);
INSERT INTO "stoptime" VALUES (775, 24146, 24176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 771);
INSERT INTO "stoptime" VALUES (776, 24257, 24287, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 771);
INSERT INTO "stoptime" VALUES (777, 24358, 24388, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 771);
INSERT INTO "stoptime" VALUES (793, 24476, 24506, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 786);
INSERT INTO "stoptime" VALUES (794, 24593, 24623, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 786);
INSERT INTO "stoptime" VALUES (795, 24738, 24768, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 786);
INSERT INTO "stoptime" VALUES (796, 24818, 24848, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 786);
INSERT INTO "stoptime" VALUES (797, 25109, 25139, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 786);
INSERT INTO "stoptime" VALUES (798, 25412, 25442, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 786);
INSERT INTO "stoptime" VALUES (799, 25482, 25512, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 786);
INSERT INTO "stoptime" VALUES (800, 25570, 25600, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 786);
INSERT INTO "stoptime" VALUES (802, 27300, 27330, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 801);
INSERT INTO "stoptime" VALUES (803, 27457, 27487, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 801);
INSERT INTO "stoptime" VALUES (804, 27543, 27573, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 801);
INSERT INTO "stoptime" VALUES (805, 27746, 27776, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 801);
INSERT INTO "stoptime" VALUES (806, 27857, 27887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 801);
INSERT INTO "stoptime" VALUES (807, 27958, 27988, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 801);
INSERT INTO "stoptime" VALUES (808, 28076, 28106, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 801);
INSERT INTO "stoptime" VALUES (809, 28193, 28223, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 801);
INSERT INTO "stoptime" VALUES (810, 28338, 28368, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 801);
INSERT INTO "stoptime" VALUES (811, 28418, 28448, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 801);
INSERT INTO "stoptime" VALUES (812, 28709, 28739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 801);
INSERT INTO "stoptime" VALUES (813, 29012, 29042, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 801);
INSERT INTO "stoptime" VALUES (814, 29082, 29112, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 801);
INSERT INTO "stoptime" VALUES (815, 29170, 29200, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 801);
INSERT INTO "stoptime" VALUES (817, 30900, 30930, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 816);
INSERT INTO "stoptime" VALUES (818, 31057, 31087, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 816);
INSERT INTO "stoptime" VALUES (819, 31143, 31173, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 816);
INSERT INTO "stoptime" VALUES (820, 31346, 31376, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 816);
INSERT INTO "stoptime" VALUES (821, 31457, 31487, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 816);
INSERT INTO "stoptime" VALUES (822, 31558, 31588, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 816);
INSERT INTO "stoptime" VALUES (823, 31676, 31706, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 816);
INSERT INTO "stoptime" VALUES (824, 31793, 31823, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 816);
INSERT INTO "stoptime" VALUES (825, 31938, 31968, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 816);
INSERT INTO "stoptime" VALUES (826, 32018, 32048, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 816);
INSERT INTO "stoptime" VALUES (827, 32309, 32339, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 816);
INSERT INTO "stoptime" VALUES (828, 32612, 32642, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 816);
INSERT INTO "stoptime" VALUES (829, 32682, 32712, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 816);
INSERT INTO "stoptime" VALUES (830, 32770, 32800, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 816);
INSERT INTO "stoptime" VALUES (832, 63300, 63330, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 831);
INSERT INTO "stoptime" VALUES (833, 63457, 63487, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 831);
INSERT INTO "stoptime" VALUES (834, 63543, 63573, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 831);
INSERT INTO "stoptime" VALUES (835, 63746, 63776, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 831);
INSERT INTO "stoptime" VALUES (836, 63857, 63887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 831);
INSERT INTO "stoptime" VALUES (837, 63958, 63988, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 831);
INSERT INTO "stoptime" VALUES (838, 64076, 64106, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 831);
INSERT INTO "stoptime" VALUES (839, 64193, 64223, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 831);
INSERT INTO "stoptime" VALUES (840, 64338, 64368, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 831);
INSERT INTO "stoptime" VALUES (841, 64418, 64448, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 831);
INSERT INTO "stoptime" VALUES (842, 64709, 64739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 831);
INSERT INTO "stoptime" VALUES (843, 65012, 65042, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 831);
INSERT INTO "stoptime" VALUES (844, 65082, 65112, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 831);
INSERT INTO "stoptime" VALUES (845, 65170, 65200, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 831);
INSERT INTO "stoptime" VALUES (847, 48900, 48930, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 846);
INSERT INTO "stoptime" VALUES (848, 49057, 49087, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 846);
INSERT INTO "stoptime" VALUES (849, 49143, 49173, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 846);
INSERT INTO "stoptime" VALUES (850, 49346, 49376, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 846);
INSERT INTO "stoptime" VALUES (851, 49457, 49487, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 846);
INSERT INTO "stoptime" VALUES (852, 49558, 49588, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 846);
INSERT INTO "stoptime" VALUES (853, 49676, 49706, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 846);
INSERT INTO "stoptime" VALUES (854, 49793, 49823, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 846);
INSERT INTO "stoptime" VALUES (855, 49938, 49968, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 846);
INSERT INTO "stoptime" VALUES (856, 50018, 50048, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 846);
INSERT INTO "stoptime" VALUES (857, 50309, 50339, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 846);
INSERT INTO "stoptime" VALUES (858, 50612, 50642, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 846);
INSERT INTO "stoptime" VALUES (859, 50682, 50712, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 846);
INSERT INTO "stoptime" VALUES (860, 50770, 50800, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 846);
INSERT INTO "stoptime" VALUES (862, 59700, 59730, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 861);
INSERT INTO "stoptime" VALUES (863, 59857, 59887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 861);
INSERT INTO "stoptime" VALUES (864, 59943, 59973, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 861);
INSERT INTO "stoptime" VALUES (865, 60146, 60176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 861);
INSERT INTO "stoptime" VALUES (866, 60257, 60287, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 861);
INSERT INTO "stoptime" VALUES (867, 60358, 60388, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 861);
INSERT INTO "stoptime" VALUES (868, 60476, 60506, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 861);
INSERT INTO "stoptime" VALUES (869, 60593, 60623, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 861);
INSERT INTO "stoptime" VALUES (870, 60738, 60768, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 861);
INSERT INTO "stoptime" VALUES (871, 60818, 60848, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 861);
INSERT INTO "stoptime" VALUES (872, 61109, 61139, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 861);
INSERT INTO "stoptime" VALUES (873, 61412, 61442, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 861);
INSERT INTO "stoptime" VALUES (874, 61482, 61512, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 861);
INSERT INTO "stoptime" VALUES (875, 61570, 61600, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 861);
INSERT INTO "stoptime" VALUES (877, 45300, 45330, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 876);
INSERT INTO "stoptime" VALUES (878, 45457, 45487, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 876);
INSERT INTO "stoptime" VALUES (879, 45543, 45573, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 876);
INSERT INTO "stoptime" VALUES (880, 45746, 45776, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 876);
INSERT INTO "stoptime" VALUES (881, 45857, 45887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 876);
INSERT INTO "stoptime" VALUES (882, 45958, 45988, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 876);
INSERT INTO "stoptime" VALUES (883, 46076, 46106, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 876);
INSERT INTO "stoptime" VALUES (884, 46193, 46223, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 876);
INSERT INTO "stoptime" VALUES (885, 46338, 46368, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 876);
INSERT INTO "stoptime" VALUES (886, 46418, 46448, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 876);
INSERT INTO "stoptime" VALUES (887, 46709, 46739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 876);
INSERT INTO "stoptime" VALUES (888, 47012, 47042, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 876);
INSERT INTO "stoptime" VALUES (889, 47082, 47112, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 876);
INSERT INTO "stoptime" VALUES (890, 47170, 47200, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 876);
INSERT INTO "stoptime" VALUES (892, 41700, 41730, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 595, 456, 891);
INSERT INTO "stoptime" VALUES (893, 41857, 41887, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 596, 458, 891);
INSERT INTO "stoptime" VALUES (894, 41943, 41973, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 597, 459, 891);
INSERT INTO "stoptime" VALUES (895, 42146, 42176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 598, 323, 891);
INSERT INTO "stoptime" VALUES (896, 42257, 42287, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 599, 325, 891);
INSERT INTO "stoptime" VALUES (897, 42358, 42388, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 600, 327, 891);
INSERT INTO "stoptime" VALUES (898, 42476, 42506, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 601, 57, 891);
INSERT INTO "stoptime" VALUES (899, 42593, 42623, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 602, 58, 891);
INSERT INTO "stoptime" VALUES (900, 42738, 42768, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 603, 59, 891);
INSERT INTO "stoptime" VALUES (901, 42818, 42848, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 604, 352, 891);
INSERT INTO "stoptime" VALUES (902, 43109, 43139, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 605, 61, 891);
INSERT INTO "stoptime" VALUES (903, 43412, 43442, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 606, 62, 891);
INSERT INTO "stoptime" VALUES (904, 43482, 43512, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 607, 63, 891);
INSERT INTO "stoptime" VALUES (905, 43570, 43600, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 608, 64, 891);
INSERT INTO "stoptime" VALUES (967, 43800, 43830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 966);
INSERT INTO "stoptime" VALUES (968, 43879, 43909, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 966);
INSERT INTO "stoptime" VALUES (969, 43946, 43976, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 966);
INSERT INTO "stoptime" VALUES (970, 44250, 44280, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 966);
INSERT INTO "stoptime" VALUES (971, 44437, 44467, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 966);
INSERT INTO "stoptime" VALUES (972, 44522, 44552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 966);
INSERT INTO "stoptime" VALUES (973, 44661, 44691, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 966);
INSERT INTO "stoptime" VALUES (974, 44727, 44757, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 966);
INSERT INTO "stoptime" VALUES (975, 44828, 44858, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 966);
INSERT INTO "stoptime" VALUES (976, 44989, 45019, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 966);
INSERT INTO "stoptime" VALUES (977, 45114, 45144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 966);
INSERT INTO "stoptime" VALUES (978, 45334, 45364, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 966);
INSERT INTO "stoptime" VALUES (979, 45429, 45459, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 966);
INSERT INTO "stoptime" VALUES (980, 45582, 45612, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 966);
INSERT INTO "stoptime" VALUES (982, 33000, 33030, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 981);
INSERT INTO "stoptime" VALUES (922, 61800, 61830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 921);
INSERT INTO "stoptime" VALUES (923, 61879, 61909, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 921);
INSERT INTO "stoptime" VALUES (924, 61946, 61976, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 921);
INSERT INTO "stoptime" VALUES (925, 62250, 62280, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 921);
INSERT INTO "stoptime" VALUES (926, 62437, 62467, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 921);
INSERT INTO "stoptime" VALUES (927, 62522, 62552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 921);
INSERT INTO "stoptime" VALUES (928, 62661, 62691, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 921);
INSERT INTO "stoptime" VALUES (929, 62727, 62757, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 921);
INSERT INTO "stoptime" VALUES (930, 62828, 62858, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 921);
INSERT INTO "stoptime" VALUES (931, 62989, 63019, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 921);
INSERT INTO "stoptime" VALUES (932, 63114, 63144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 921);
INSERT INTO "stoptime" VALUES (933, 63334, 63364, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 921);
INSERT INTO "stoptime" VALUES (934, 63429, 63459, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 921);
INSERT INTO "stoptime" VALUES (937, 51000, 51030, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 936);
INSERT INTO "stoptime" VALUES (938, 51079, 51109, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 936);
INSERT INTO "stoptime" VALUES (939, 51146, 51176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 936);
INSERT INTO "stoptime" VALUES (940, 51450, 51480, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 936);
INSERT INTO "stoptime" VALUES (941, 51637, 51667, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 936);
INSERT INTO "stoptime" VALUES (942, 51722, 51752, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 936);
INSERT INTO "stoptime" VALUES (943, 51861, 51891, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 936);
INSERT INTO "stoptime" VALUES (944, 51927, 51957, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 936);
INSERT INTO "stoptime" VALUES (945, 52028, 52058, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 936);
INSERT INTO "stoptime" VALUES (946, 52189, 52219, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 936);
INSERT INTO "stoptime" VALUES (947, 52314, 52344, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 936);
INSERT INTO "stoptime" VALUES (948, 52534, 52564, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 936);
INSERT INTO "stoptime" VALUES (949, 52629, 52659, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 936);
INSERT INTO "stoptime" VALUES (952, 47400, 47430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 951);
INSERT INTO "stoptime" VALUES (953, 47479, 47509, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 951);
INSERT INTO "stoptime" VALUES (954, 47546, 47576, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 951);
INSERT INTO "stoptime" VALUES (955, 47850, 47880, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 951);
INSERT INTO "stoptime" VALUES (956, 48037, 48067, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 951);
INSERT INTO "stoptime" VALUES (957, 48122, 48152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 951);
INSERT INTO "stoptime" VALUES (958, 48261, 48291, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 951);
INSERT INTO "stoptime" VALUES (959, 48327, 48357, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 951);
INSERT INTO "stoptime" VALUES (960, 48428, 48458, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 951);
INSERT INTO "stoptime" VALUES (961, 48589, 48619, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 951);
INSERT INTO "stoptime" VALUES (962, 48714, 48744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 951);
INSERT INTO "stoptime" VALUES (963, 48934, 48964, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 951);
INSERT INTO "stoptime" VALUES (964, 49029, 49059, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 951);
INSERT INTO "stoptime" VALUES (965, 49182, 49212, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 951);
INSERT INTO "stoptime" VALUES (983, 33079, 33109, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 981);
INSERT INTO "stoptime" VALUES (984, 33146, 33176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 981);
INSERT INTO "stoptime" VALUES (985, 33450, 33480, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 981);
INSERT INTO "stoptime" VALUES (986, 33637, 33667, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 981);
INSERT INTO "stoptime" VALUES (987, 33722, 33752, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 981);
INSERT INTO "stoptime" VALUES (988, 33861, 33891, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 981);
INSERT INTO "stoptime" VALUES (989, 33927, 33957, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 981);
INSERT INTO "stoptime" VALUES (990, 34028, 34058, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 981);
INSERT INTO "stoptime" VALUES (991, 34189, 34219, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 981);
INSERT INTO "stoptime" VALUES (992, 34314, 34344, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 981);
INSERT INTO "stoptime" VALUES (993, 34534, 34564, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 981);
INSERT INTO "stoptime" VALUES (994, 34629, 34659, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 981);
INSERT INTO "stoptime" VALUES (995, 34782, 34812, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 981);
INSERT INTO "stoptime" VALUES (997, 29400, 29430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 996);
INSERT INTO "stoptime" VALUES (998, 29479, 29509, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 996);
INSERT INTO "stoptime" VALUES (999, 29546, 29576, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 996);
INSERT INTO "stoptime" VALUES (1000, 29850, 29880, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 996);
INSERT INTO "stoptime" VALUES (1001, 30037, 30067, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 996);
INSERT INTO "stoptime" VALUES (1002, 30122, 30152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 996);
INSERT INTO "stoptime" VALUES (1003, 30261, 30291, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 996);
INSERT INTO "stoptime" VALUES (1004, 30327, 30357, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 996);
INSERT INTO "stoptime" VALUES (1005, 30428, 30458, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 996);
INSERT INTO "stoptime" VALUES (1006, 30589, 30619, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 996);
INSERT INTO "stoptime" VALUES (1007, 30714, 30744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 996);
INSERT INTO "stoptime" VALUES (1008, 30934, 30964, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 996);
INSERT INTO "stoptime" VALUES (1009, 31029, 31059, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 996);
INSERT INTO "stoptime" VALUES (1010, 31182, 31212, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 996);
INSERT INTO "stoptime" VALUES (1012, 25800, 25830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 1011);
INSERT INTO "stoptime" VALUES (1013, 25879, 25909, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 1011);
INSERT INTO "stoptime" VALUES (1014, 25946, 25976, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 1011);
INSERT INTO "stoptime" VALUES (1015, 26250, 26280, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 1011);
INSERT INTO "stoptime" VALUES (1016, 26437, 26467, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 1011);
INSERT INTO "stoptime" VALUES (1017, 26522, 26552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 1011);
INSERT INTO "stoptime" VALUES (1018, 26661, 26691, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 1011);
INSERT INTO "stoptime" VALUES (1019, 26727, 26757, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 1011);
INSERT INTO "stoptime" VALUES (1020, 26828, 26858, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 1011);
INSERT INTO "stoptime" VALUES (1021, 26989, 27019, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 1011);
INSERT INTO "stoptime" VALUES (1022, 27114, 27144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 1011);
INSERT INTO "stoptime" VALUES (1023, 27334, 27364, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 1011);
INSERT INTO "stoptime" VALUES (1024, 27429, 27459, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 1011);
INSERT INTO "stoptime" VALUES (1025, 27582, 27612, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 1011);
INSERT INTO "stoptime" VALUES (907, 65400, 65430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 906);
INSERT INTO "stoptime" VALUES (908, 65479, 65509, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 906);
INSERT INTO "stoptime" VALUES (909, 65546, 65576, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 906);
INSERT INTO "stoptime" VALUES (910, 65850, 65880, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 906);
INSERT INTO "stoptime" VALUES (911, 66037, 66067, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 906);
INSERT INTO "stoptime" VALUES (912, 66122, 66152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 906);
INSERT INTO "stoptime" VALUES (913, 66261, 66291, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 906);
INSERT INTO "stoptime" VALUES (914, 66327, 66357, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 906);
INSERT INTO "stoptime" VALUES (915, 66428, 66458, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 906);
INSERT INTO "stoptime" VALUES (916, 66589, 66619, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 906);
INSERT INTO "stoptime" VALUES (917, 66714, 66744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 906);
INSERT INTO "stoptime" VALUES (918, 66934, 66964, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 906);
INSERT INTO "stoptime" VALUES (919, 67029, 67059, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 906);
INSERT INTO "stoptime" VALUES (920, 67182, 67212, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 906);
INSERT INTO "stoptime" VALUES (935, 63582, 63612, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 921);
INSERT INTO "stoptime" VALUES (950, 52782, 52812, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 936);
INSERT INTO "stoptime" VALUES (1027, 69000, 69030, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 611, 64, 1026);
INSERT INTO "stoptime" VALUES (1028, 69079, 69109, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 612, 69, 1026);
INSERT INTO "stoptime" VALUES (1029, 69146, 69176, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 613, 70, 1026);
INSERT INTO "stoptime" VALUES (1030, 69450, 69480, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 614, 71, 1026);
INSERT INTO "stoptime" VALUES (1031, 69637, 69667, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 615, 72, 1026);
INSERT INTO "stoptime" VALUES (1032, 69722, 69752, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 616, 73, 1026);
INSERT INTO "stoptime" VALUES (1033, 69861, 69891, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 617, 74, 1026);
INSERT INTO "stoptime" VALUES (1034, 69927, 69957, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 618, 329, 1026);
INSERT INTO "stoptime" VALUES (1035, 70028, 70058, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 619, 328, 1026);
INSERT INTO "stoptime" VALUES (1036, 70189, 70219, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 620, 326, 1026);
INSERT INTO "stoptime" VALUES (1037, 70314, 70344, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 621, 324, 1026);
INSERT INTO "stoptime" VALUES (1038, 70534, 70564, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 622, 460, 1026);
INSERT INTO "stoptime" VALUES (1039, 70629, 70659, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 623, 457, 1026);
INSERT INTO "stoptime" VALUES (1040, 70782, 70812, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 624, 456, 1026);
INSERT INTO "stoptime" VALUES (1215, 25980, 26010, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1139, 124, 1214);
INSERT INTO "stoptime" VALUES (1216, 26178, 26208, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1140, 476, 1214);
INSERT INTO "stoptime" VALUES (1217, 26221, 26251, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1141, 474, 1214);
INSERT INTO "stoptime" VALUES (1218, 26294, 26324, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1142, 472, 1214);
INSERT INTO "stoptime" VALUES (1219, 26401, 26431, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1143, 322, 1214);
INSERT INTO "stoptime" VALUES (1220, 26522, 26552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1144, 323, 1214);
INSERT INTO "stoptime" VALUES (1221, 26620, 26650, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1145, 325, 1214);
INSERT INTO "stoptime" VALUES (1222, 26709, 26739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1146, 327, 1214);
INSERT INTO "stoptime" VALUES (1223, 26813, 26843, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1147, 57, 1214);
INSERT INTO "stoptime" VALUES (1224, 26916, 26946, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1148, 58, 1214);
INSERT INTO "stoptime" VALUES (1225, 27042, 27072, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1149, 59, 1214);
INSERT INTO "stoptime" VALUES (1226, 27114, 27144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1150, 352, 1214);
INSERT INTO "stoptime" VALUES (1227, 27362, 27392, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1151, 61, 1214);
INSERT INTO "stoptime" VALUES (1228, 27619, 27649, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1152, 62, 1214);
INSERT INTO "stoptime" VALUES (1229, 27683, 27713, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1153, 63, 1214);
INSERT INTO "stoptime" VALUES (1230, 27752, 27782, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1154, 64, 1214);
INSERT INTO "stoptime" VALUES (1232, 43980, 44010, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1139, 124, 1231);
INSERT INTO "stoptime" VALUES (1233, 44178, 44208, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1140, 476, 1231);
INSERT INTO "stoptime" VALUES (1234, 44221, 44251, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1141, 474, 1231);
INSERT INTO "stoptime" VALUES (1235, 44294, 44324, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1142, 472, 1231);
INSERT INTO "stoptime" VALUES (1236, 44401, 44431, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1143, 322, 1231);
INSERT INTO "stoptime" VALUES (1237, 44522, 44552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1144, 323, 1231);
INSERT INTO "stoptime" VALUES (1238, 44620, 44650, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1145, 325, 1231);
INSERT INTO "stoptime" VALUES (1239, 44709, 44739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1146, 327, 1231);
INSERT INTO "stoptime" VALUES (1240, 44813, 44843, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1147, 57, 1231);
INSERT INTO "stoptime" VALUES (1241, 44916, 44946, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1148, 58, 1231);
INSERT INTO "stoptime" VALUES (1242, 45042, 45072, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1149, 59, 1231);
INSERT INTO "stoptime" VALUES (1243, 45114, 45144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1150, 352, 1231);
INSERT INTO "stoptime" VALUES (1244, 45362, 45392, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1151, 61, 1231);
INSERT INTO "stoptime" VALUES (1245, 45619, 45649, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1152, 62, 1231);
INSERT INTO "stoptime" VALUES (1246, 45683, 45713, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1153, 63, 1231);
INSERT INTO "stoptime" VALUES (1247, 45752, 45782, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1154, 64, 1231);
INSERT INTO "stoptime" VALUES (1249, 61980, 62010, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1139, 124, 1248);
INSERT INTO "stoptime" VALUES (1250, 62178, 62208, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1140, 476, 1248);
INSERT INTO "stoptime" VALUES (1251, 62221, 62251, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1141, 474, 1248);
INSERT INTO "stoptime" VALUES (1252, 62294, 62324, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1142, 472, 1248);
INSERT INTO "stoptime" VALUES (1253, 62401, 62431, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1143, 322, 1248);
INSERT INTO "stoptime" VALUES (1254, 62522, 62552, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1144, 323, 1248);
INSERT INTO "stoptime" VALUES (1255, 62620, 62650, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1145, 325, 1248);
INSERT INTO "stoptime" VALUES (1256, 62709, 62739, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1146, 327, 1248);
INSERT INTO "stoptime" VALUES (1257, 62813, 62843, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1147, 57, 1248);
INSERT INTO "stoptime" VALUES (1258, 62916, 62946, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1148, 58, 1248);
INSERT INTO "stoptime" VALUES (1259, 63042, 63072, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1149, 59, 1248);
INSERT INTO "stoptime" VALUES (1260, 63114, 63144, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1150, 352, 1248);
INSERT INTO "stoptime" VALUES (1261, 63362, 63392, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1151, 61, 1248);
INSERT INTO "stoptime" VALUES (1262, 63619, 63649, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1152, 62, 1248);
INSERT INTO "stoptime" VALUES (1263, 63683, 63713, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1153, 63, 1248);
INSERT INTO "stoptime" VALUES (1264, 63752, 63782, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1154, 64, 1248);
INSERT INTO "stoptime" VALUES (1266, 69180, 69210, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1139, 124, 1265);
INSERT INTO "stoptime" VALUES (1267, 69378, 69408, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1140, 476, 1265);
INSERT INTO "stoptime" VALUES (1268, 69421, 69451, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1141, 474, 1265);
INSERT INTO "stoptime" VALUES (1269, 69494, 69524, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1142, 472, 1265);
INSERT INTO "stoptime" VALUES (1270, 69601, 69631, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1143, 322, 1265);
INSERT INTO "stoptime" VALUES (1271, 69722, 69752, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1144, 323, 1265);
INSERT INTO "stoptime" VALUES (1272, 69820, 69850, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1145, 325, 1265);
INSERT INTO "stoptime" VALUES (1273, 69909, 69939, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1146, 327, 1265);
INSERT INTO "stoptime" VALUES (1274, 70013, 70043, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1147, 57, 1265);
INSERT INTO "stoptime" VALUES (1275, 70116, 70146, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1148, 58, 1265);
INSERT INTO "stoptime" VALUES (1276, 70242, 70272, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1149, 59, 1265);
INSERT INTO "stoptime" VALUES (1277, 70314, 70344, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1150, 352, 1265);
INSERT INTO "stoptime" VALUES (1278, 70562, 70592, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1151, 61, 1265);
INSERT INTO "stoptime" VALUES (1279, 70819, 70849, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1152, 62, 1265);
INSERT INTO "stoptime" VALUES (1280, 70883, 70913, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1153, 63, 1265);
INSERT INTO "stoptime" VALUES (1281, 70952, 70982, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1154, 64, 1265);
INSERT INTO "stoptime" VALUES (1283, 72780, 72810, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1139, 124, 1282);
INSERT INTO "stoptime" VALUES (1284, 72978, 73008, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1140, 476, 1282);
INSERT INTO "stoptime" VALUES (1285, 73021, 73051, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1141, 474, 1282);
INSERT INTO "stoptime" VALUES (1286, 73094, 73124, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1142, 472, 1282);
INSERT INTO "stoptime" VALUES (1287, 73201, 73231, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1143, 322, 1282);
INSERT INTO "stoptime" VALUES (1288, 73322, 73352, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1144, 323, 1282);
INSERT INTO "stoptime" VALUES (1289, 73420, 73450, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1145, 325, 1282);
INSERT INTO "stoptime" VALUES (1290, 73509, 73539, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1146, 327, 1282);
INSERT INTO "stoptime" VALUES (1291, 73613, 73643, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1147, 57, 1282);
INSERT INTO "stoptime" VALUES (1292, 73716, 73746, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1148, 58, 1282);
INSERT INTO "stoptime" VALUES (1293, 73842, 73872, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1149, 59, 1282);
INSERT INTO "stoptime" VALUES (1294, 73914, 73944, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1150, 352, 1282);
INSERT INTO "stoptime" VALUES (1295, 74162, 74192, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1151, 61, 1282);
INSERT INTO "stoptime" VALUES (1296, 74419, 74449, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1152, 62, 1282);
INSERT INTO "stoptime" VALUES (1297, 74483, 74513, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1153, 63, 1282);
INSERT INTO "stoptime" VALUES (1298, 74552, 74582, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1154, 64, 1282);
INSERT INTO "stoptime" VALUES (1300, 22380, 22410, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1158, 124, 1299);
INSERT INTO "stoptime" VALUES (1301, 22578, 22608, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1159, 476, 1299);
INSERT INTO "stoptime" VALUES (1302, 22621, 22651, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1160, 474, 1299);
INSERT INTO "stoptime" VALUES (1303, 22694, 22724, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1161, 472, 1299);
INSERT INTO "stoptime" VALUES (1304, 22801, 22831, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1162, 322, 1299);
INSERT INTO "stoptime" VALUES (1305, 22922, 22952, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1163, 323, 1299);
INSERT INTO "stoptime" VALUES (1306, 23020, 23050, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1164, 325, 1299);
INSERT INTO "stoptime" VALUES (1307, 23109, 23139, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1165, 327, 1299);
INSERT INTO "stoptime" VALUES (1308, 23213, 23243, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1166, 57, 1299);
INSERT INTO "stoptime" VALUES (1309, 23316, 23346, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1167, 58, 1299);
INSERT INTO "stoptime" VALUES (1310, 23442, 23472, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1168, 59, 1299);
INSERT INTO "stoptime" VALUES (1311, 23514, 23544, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1169, 352, 1299);
INSERT INTO "stoptime" VALUES (1312, 23762, 23792, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1170, 61, 1299);
INSERT INTO "stoptime" VALUES (1313, 24020, 24050, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1171, 62, 1299);
INSERT INTO "stoptime" VALUES (1314, 24084, 24114, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1172, 63, 1299);
INSERT INTO "stoptime" VALUES (1315, 24152, 24182, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1173, 64, 1299);
INSERT INTO "stoptime" VALUES (1316, 24421, 24451, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1174, 499, 1299);
INSERT INTO "stoptime" VALUES (1317, 24559, 24589, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1175, 1137, 1299);
INSERT INTO "stoptime" VALUES (1319, 29580, 29610, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1158, 124, 1318);
INSERT INTO "stoptime" VALUES (1320, 29778, 29808, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1159, 476, 1318);
INSERT INTO "stoptime" VALUES (1321, 29821, 29851, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1160, 474, 1318);
INSERT INTO "stoptime" VALUES (1322, 29894, 29924, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1161, 472, 1318);
INSERT INTO "stoptime" VALUES (1323, 30001, 30031, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1162, 322, 1318);
INSERT INTO "stoptime" VALUES (1324, 30122, 30152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1163, 323, 1318);
INSERT INTO "stoptime" VALUES (1325, 30220, 30250, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1164, 325, 1318);
INSERT INTO "stoptime" VALUES (1326, 30309, 30339, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1165, 327, 1318);
INSERT INTO "stoptime" VALUES (1327, 30413, 30443, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1166, 57, 1318);
INSERT INTO "stoptime" VALUES (1328, 30516, 30546, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1167, 58, 1318);
INSERT INTO "stoptime" VALUES (1329, 30642, 30672, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1168, 59, 1318);
INSERT INTO "stoptime" VALUES (1330, 30714, 30744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1169, 352, 1318);
INSERT INTO "stoptime" VALUES (1331, 30962, 30992, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1170, 61, 1318);
INSERT INTO "stoptime" VALUES (1332, 31220, 31250, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1171, 62, 1318);
INSERT INTO "stoptime" VALUES (1333, 31284, 31314, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1172, 63, 1318);
INSERT INTO "stoptime" VALUES (1334, 31352, 31382, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1173, 64, 1318);
INSERT INTO "stoptime" VALUES (1335, 31621, 31651, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1174, 499, 1318);
INSERT INTO "stoptime" VALUES (1336, 31759, 31789, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1175, 1137, 1318);
INSERT INTO "stoptime" VALUES (1338, 47580, 47610, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1158, 124, 1337);
INSERT INTO "stoptime" VALUES (1339, 47778, 47808, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1159, 476, 1337);
INSERT INTO "stoptime" VALUES (1340, 47821, 47851, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1160, 474, 1337);
INSERT INTO "stoptime" VALUES (1341, 47894, 47924, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1161, 472, 1337);
INSERT INTO "stoptime" VALUES (1342, 48001, 48031, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1162, 322, 1337);
INSERT INTO "stoptime" VALUES (1343, 48122, 48152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1163, 323, 1337);
INSERT INTO "stoptime" VALUES (1344, 48220, 48250, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1164, 325, 1337);
INSERT INTO "stoptime" VALUES (1345, 48309, 48339, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1165, 327, 1337);
INSERT INTO "stoptime" VALUES (1346, 48413, 48443, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1166, 57, 1337);
INSERT INTO "stoptime" VALUES (1347, 48516, 48546, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1167, 58, 1337);
INSERT INTO "stoptime" VALUES (1348, 48642, 48672, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1168, 59, 1337);
INSERT INTO "stoptime" VALUES (1349, 48714, 48744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1169, 352, 1337);
INSERT INTO "stoptime" VALUES (1350, 48962, 48992, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1170, 61, 1337);
INSERT INTO "stoptime" VALUES (1351, 49220, 49250, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1171, 62, 1337);
INSERT INTO "stoptime" VALUES (1352, 49284, 49314, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1172, 63, 1337);
INSERT INTO "stoptime" VALUES (1353, 49352, 49382, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1173, 64, 1337);
INSERT INTO "stoptime" VALUES (1354, 49621, 49651, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1174, 499, 1337);
INSERT INTO "stoptime" VALUES (1355, 49759, 49789, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1175, 1137, 1337);
INSERT INTO "stoptime" VALUES (1357, 58380, 58410, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1158, 124, 1356);
INSERT INTO "stoptime" VALUES (1358, 58578, 58608, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1159, 476, 1356);
INSERT INTO "stoptime" VALUES (1359, 58621, 58651, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1160, 474, 1356);
INSERT INTO "stoptime" VALUES (1360, 58694, 58724, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1161, 472, 1356);
INSERT INTO "stoptime" VALUES (1361, 58801, 58831, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1162, 322, 1356);
INSERT INTO "stoptime" VALUES (1362, 58922, 58952, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1163, 323, 1356);
INSERT INTO "stoptime" VALUES (1363, 59020, 59050, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1164, 325, 1356);
INSERT INTO "stoptime" VALUES (1364, 59109, 59139, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1165, 327, 1356);
INSERT INTO "stoptime" VALUES (1365, 59213, 59243, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1166, 57, 1356);
INSERT INTO "stoptime" VALUES (1366, 59316, 59346, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1167, 58, 1356);
INSERT INTO "stoptime" VALUES (1367, 59442, 59472, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1168, 59, 1356);
INSERT INTO "stoptime" VALUES (1368, 59514, 59544, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1169, 352, 1356);
INSERT INTO "stoptime" VALUES (1369, 59762, 59792, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1170, 61, 1356);
INSERT INTO "stoptime" VALUES (1370, 60020, 60050, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1171, 62, 1356);
INSERT INTO "stoptime" VALUES (1371, 60084, 60114, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1172, 63, 1356);
INSERT INTO "stoptime" VALUES (1372, 60152, 60182, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1173, 64, 1356);
INSERT INTO "stoptime" VALUES (1373, 60421, 60451, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1174, 499, 1356);
INSERT INTO "stoptime" VALUES (1374, 60559, 60589, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1175, 1137, 1356);
INSERT INTO "stoptime" VALUES (1376, 65580, 65610, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1158, 124, 1375);
INSERT INTO "stoptime" VALUES (1377, 65778, 65808, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1159, 476, 1375);
INSERT INTO "stoptime" VALUES (1378, 65821, 65851, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1160, 474, 1375);
INSERT INTO "stoptime" VALUES (1379, 65894, 65924, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1161, 472, 1375);
INSERT INTO "stoptime" VALUES (1380, 66001, 66031, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1162, 322, 1375);
INSERT INTO "stoptime" VALUES (1381, 66122, 66152, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1163, 323, 1375);
INSERT INTO "stoptime" VALUES (1382, 66220, 66250, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1164, 325, 1375);
INSERT INTO "stoptime" VALUES (1383, 66309, 66339, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1165, 327, 1375);
INSERT INTO "stoptime" VALUES (1384, 66413, 66443, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1166, 57, 1375);
INSERT INTO "stoptime" VALUES (1385, 66516, 66546, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1167, 58, 1375);
INSERT INTO "stoptime" VALUES (1386, 66642, 66672, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1168, 59, 1375);
INSERT INTO "stoptime" VALUES (1387, 66714, 66744, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1169, 352, 1375);
INSERT INTO "stoptime" VALUES (1388, 66962, 66992, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1170, 61, 1375);
INSERT INTO "stoptime" VALUES (1389, 67220, 67250, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1171, 62, 1375);
INSERT INTO "stoptime" VALUES (1390, 67284, 67314, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1172, 63, 1375);
INSERT INTO "stoptime" VALUES (1391, 67352, 67382, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1173, 64, 1375);
INSERT INTO "stoptime" VALUES (1392, 67621, 67651, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1174, 499, 1375);
INSERT INTO "stoptime" VALUES (1393, 67759, 67789, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1175, 1137, 1375);
INSERT INTO "stoptime" VALUES (1395, 28200, 28230, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1177, 64, 1394);
INSERT INTO "stoptime" VALUES (1396, 28271, 28301, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1178, 69, 1394);
INSERT INTO "stoptime" VALUES (1397, 28332, 28362, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1179, 70, 1394);
INSERT INTO "stoptime" VALUES (1398, 28581, 28611, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1180, 71, 1394);
INSERT INTO "stoptime" VALUES (1399, 28739, 28769, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1181, 72, 1394);
INSERT INTO "stoptime" VALUES (1400, 28815, 28845, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1182, 73, 1394);
INSERT INTO "stoptime" VALUES (1401, 28935, 28965, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1183, 74, 1394);
INSERT INTO "stoptime" VALUES (1402, 28994, 29024, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1184, 329, 1394);
INSERT INTO "stoptime" VALUES (1403, 29083, 29113, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1185, 328, 1394);
INSERT INTO "stoptime" VALUES (1404, 29223, 29253, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1186, 326, 1394);
INSERT INTO "stoptime" VALUES (1405, 29332, 29362, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1187, 324, 1394);
INSERT INTO "stoptime" VALUES (1406, 29474, 29504, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1188, 321, 1394);
INSERT INTO "stoptime" VALUES (1407, 29581, 29611, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1189, 471, 1394);
INSERT INTO "stoptime" VALUES (1408, 29654, 29684, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1190, 473, 1394);
INSERT INTO "stoptime" VALUES (1409, 29699, 29729, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1191, 475, 1394);
INSERT INTO "stoptime" VALUES (1410, 29911, 29941, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1192, 125, 1394);
INSERT INTO "stoptime" VALUES (1412, 46200, 46230, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1177, 64, 1411);
INSERT INTO "stoptime" VALUES (1413, 46271, 46301, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1178, 69, 1411);
INSERT INTO "stoptime" VALUES (1414, 46332, 46362, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1179, 70, 1411);
INSERT INTO "stoptime" VALUES (1415, 46581, 46611, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1180, 71, 1411);
INSERT INTO "stoptime" VALUES (1416, 46739, 46769, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1181, 72, 1411);
INSERT INTO "stoptime" VALUES (1417, 46815, 46845, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1182, 73, 1411);
INSERT INTO "stoptime" VALUES (1418, 46935, 46965, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1183, 74, 1411);
INSERT INTO "stoptime" VALUES (1419, 46994, 47024, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1184, 329, 1411);
INSERT INTO "stoptime" VALUES (1420, 47083, 47113, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1185, 328, 1411);
INSERT INTO "stoptime" VALUES (1421, 47223, 47253, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1186, 326, 1411);
INSERT INTO "stoptime" VALUES (1422, 47332, 47362, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1187, 324, 1411);
INSERT INTO "stoptime" VALUES (1423, 47474, 47504, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1188, 321, 1411);
INSERT INTO "stoptime" VALUES (1424, 47581, 47611, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1189, 471, 1411);
INSERT INTO "stoptime" VALUES (1425, 47654, 47684, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1190, 473, 1411);
INSERT INTO "stoptime" VALUES (1426, 47699, 47729, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1191, 475, 1411);
INSERT INTO "stoptime" VALUES (1427, 47911, 47941, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1192, 125, 1411);
INSERT INTO "stoptime" VALUES (1429, 64200, 64230, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1177, 64, 1428);
INSERT INTO "stoptime" VALUES (1430, 64271, 64301, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1178, 69, 1428);
INSERT INTO "stoptime" VALUES (1431, 64332, 64362, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1179, 70, 1428);
INSERT INTO "stoptime" VALUES (1432, 64581, 64611, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1180, 71, 1428);
INSERT INTO "stoptime" VALUES (1433, 64739, 64769, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1181, 72, 1428);
INSERT INTO "stoptime" VALUES (1434, 64815, 64845, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1182, 73, 1428);
INSERT INTO "stoptime" VALUES (1435, 64935, 64965, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1183, 74, 1428);
INSERT INTO "stoptime" VALUES (1436, 64994, 65024, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1184, 329, 1428);
INSERT INTO "stoptime" VALUES (1437, 65083, 65113, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1185, 328, 1428);
INSERT INTO "stoptime" VALUES (1438, 65223, 65253, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1186, 326, 1428);
INSERT INTO "stoptime" VALUES (1439, 65332, 65362, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1187, 324, 1428);
INSERT INTO "stoptime" VALUES (1440, 65474, 65504, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1188, 321, 1428);
INSERT INTO "stoptime" VALUES (1441, 65581, 65611, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1189, 471, 1428);
INSERT INTO "stoptime" VALUES (1442, 65654, 65684, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1190, 473, 1428);
INSERT INTO "stoptime" VALUES (1443, 65699, 65729, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1191, 475, 1428);
INSERT INTO "stoptime" VALUES (1444, 65911, 65941, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1192, 125, 1428);
INSERT INTO "stoptime" VALUES (1446, 71400, 71430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1177, 64, 1445);
INSERT INTO "stoptime" VALUES (1447, 71471, 71501, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1178, 69, 1445);
INSERT INTO "stoptime" VALUES (1448, 71532, 71562, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1179, 70, 1445);
INSERT INTO "stoptime" VALUES (1449, 71781, 71811, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1180, 71, 1445);
INSERT INTO "stoptime" VALUES (1450, 71939, 71969, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1181, 72, 1445);
INSERT INTO "stoptime" VALUES (1451, 72015, 72045, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1182, 73, 1445);
INSERT INTO "stoptime" VALUES (1452, 72135, 72165, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1183, 74, 1445);
INSERT INTO "stoptime" VALUES (1453, 72194, 72224, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1184, 329, 1445);
INSERT INTO "stoptime" VALUES (1454, 72283, 72313, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1185, 328, 1445);
INSERT INTO "stoptime" VALUES (1455, 72423, 72453, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1186, 326, 1445);
INSERT INTO "stoptime" VALUES (1456, 72532, 72562, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1187, 324, 1445);
INSERT INTO "stoptime" VALUES (1457, 72674, 72704, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1188, 321, 1445);
INSERT INTO "stoptime" VALUES (1458, 72781, 72811, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1189, 471, 1445);
INSERT INTO "stoptime" VALUES (1459, 72854, 72884, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1190, 473, 1445);
INSERT INTO "stoptime" VALUES (1460, 72899, 72929, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1191, 475, 1445);
INSERT INTO "stoptime" VALUES (1461, 73111, 73141, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1192, 125, 1445);
INSERT INTO "stoptime" VALUES (1463, 75000, 75030, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1177, 64, 1462);
INSERT INTO "stoptime" VALUES (1464, 75071, 75101, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1178, 69, 1462);
INSERT INTO "stoptime" VALUES (1465, 75132, 75162, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1179, 70, 1462);
INSERT INTO "stoptime" VALUES (1466, 75381, 75411, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1180, 71, 1462);
INSERT INTO "stoptime" VALUES (1467, 75539, 75569, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1181, 72, 1462);
INSERT INTO "stoptime" VALUES (1468, 75615, 75645, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1182, 73, 1462);
INSERT INTO "stoptime" VALUES (1469, 75735, 75765, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1183, 74, 1462);
INSERT INTO "stoptime" VALUES (1470, 75794, 75824, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1184, 329, 1462);
INSERT INTO "stoptime" VALUES (1471, 75883, 75913, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1185, 328, 1462);
INSERT INTO "stoptime" VALUES (1472, 76023, 76053, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1186, 326, 1462);
INSERT INTO "stoptime" VALUES (1473, 76132, 76162, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1187, 324, 1462);
INSERT INTO "stoptime" VALUES (1474, 76274, 76304, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1188, 321, 1462);
INSERT INTO "stoptime" VALUES (1475, 76381, 76411, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1189, 471, 1462);
INSERT INTO "stoptime" VALUES (1476, 76454, 76484, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1190, 473, 1462);
INSERT INTO "stoptime" VALUES (1477, 76499, 76529, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1191, 475, 1462);
INSERT INTO "stoptime" VALUES (1478, 76711, 76741, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1192, 125, 1462);
INSERT INTO "stoptime" VALUES (1480, 78600, 78630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1177, 64, 1479);
INSERT INTO "stoptime" VALUES (1481, 78671, 78701, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1178, 69, 1479);
INSERT INTO "stoptime" VALUES (1482, 78732, 78762, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1179, 70, 1479);
INSERT INTO "stoptime" VALUES (1483, 78981, 79011, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1180, 71, 1479);
INSERT INTO "stoptime" VALUES (1484, 79139, 79169, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1181, 72, 1479);
INSERT INTO "stoptime" VALUES (1485, 79215, 79245, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1182, 73, 1479);
INSERT INTO "stoptime" VALUES (1486, 79335, 79365, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1183, 74, 1479);
INSERT INTO "stoptime" VALUES (1487, 79394, 79424, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1184, 329, 1479);
INSERT INTO "stoptime" VALUES (1488, 79483, 79513, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1185, 328, 1479);
INSERT INTO "stoptime" VALUES (1489, 79623, 79653, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1186, 326, 1479);
INSERT INTO "stoptime" VALUES (1490, 79732, 79762, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1187, 324, 1479);
INSERT INTO "stoptime" VALUES (1491, 79874, 79904, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1188, 321, 1479);
INSERT INTO "stoptime" VALUES (1492, 79981, 80011, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1189, 471, 1479);
INSERT INTO "stoptime" VALUES (1493, 80054, 80084, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1190, 473, 1479);
INSERT INTO "stoptime" VALUES (1494, 80099, 80129, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1191, 475, 1479);
INSERT INTO "stoptime" VALUES (1495, 80311, 80341, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1192, 125, 1479);
INSERT INTO "stoptime" VALUES (1497, 24600, 24630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1195, 1137, 1496);
INSERT INTO "stoptime" VALUES (1498, 24747, 24777, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1196, 500, 1496);
INSERT INTO "stoptime" VALUES (1499, 25007, 25037, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1197, 64, 1496);
INSERT INTO "stoptime" VALUES (1500, 25078, 25108, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1198, 69, 1496);
INSERT INTO "stoptime" VALUES (1501, 25139, 25169, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1199, 70, 1496);
INSERT INTO "stoptime" VALUES (1502, 25398, 25428, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1200, 71, 1496);
INSERT INTO "stoptime" VALUES (1503, 25559, 25589, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1201, 72, 1496);
INSERT INTO "stoptime" VALUES (1504, 25635, 25665, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1202, 73, 1496);
INSERT INTO "stoptime" VALUES (1505, 25756, 25786, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1203, 74, 1496);
INSERT INTO "stoptime" VALUES (1506, 25816, 25846, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1204, 329, 1496);
INSERT INTO "stoptime" VALUES (1507, 25905, 25935, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1205, 328, 1496);
INSERT INTO "stoptime" VALUES (1508, 26044, 26074, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1206, 326, 1496);
INSERT INTO "stoptime" VALUES (1509, 26153, 26183, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1207, 324, 1496);
INSERT INTO "stoptime" VALUES (1510, 26293, 26323, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1208, 321, 1496);
INSERT INTO "stoptime" VALUES (1511, 26400, 26430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1209, 471, 1496);
INSERT INTO "stoptime" VALUES (1512, 26473, 26503, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1210, 473, 1496);
INSERT INTO "stoptime" VALUES (1513, 26518, 26548, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1211, 475, 1496);
INSERT INTO "stoptime" VALUES (1514, 26730, 26760, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1212, 125, 1496);
INSERT INTO "stoptime" VALUES (1516, 31800, 31830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1195, 1137, 1515);
INSERT INTO "stoptime" VALUES (1517, 31947, 31977, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1196, 500, 1515);
INSERT INTO "stoptime" VALUES (1518, 32207, 32237, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1197, 64, 1515);
INSERT INTO "stoptime" VALUES (1519, 32278, 32308, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1198, 69, 1515);
INSERT INTO "stoptime" VALUES (1520, 32339, 32369, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1199, 70, 1515);
INSERT INTO "stoptime" VALUES (1521, 32598, 32628, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1200, 71, 1515);
INSERT INTO "stoptime" VALUES (1522, 32759, 32789, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1201, 72, 1515);
INSERT INTO "stoptime" VALUES (1523, 32835, 32865, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1202, 73, 1515);
INSERT INTO "stoptime" VALUES (1524, 32956, 32986, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1203, 74, 1515);
INSERT INTO "stoptime" VALUES (1525, 33016, 33046, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1204, 329, 1515);
INSERT INTO "stoptime" VALUES (1526, 33105, 33135, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1205, 328, 1515);
INSERT INTO "stoptime" VALUES (1527, 33244, 33274, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1206, 326, 1515);
INSERT INTO "stoptime" VALUES (1528, 33353, 33383, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1207, 324, 1515);
INSERT INTO "stoptime" VALUES (1529, 33493, 33523, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1208, 321, 1515);
INSERT INTO "stoptime" VALUES (1530, 33600, 33630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1209, 471, 1515);
INSERT INTO "stoptime" VALUES (1531, 33673, 33703, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1210, 473, 1515);
INSERT INTO "stoptime" VALUES (1532, 33718, 33748, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1211, 475, 1515);
INSERT INTO "stoptime" VALUES (1533, 33930, 33960, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1212, 125, 1515);
INSERT INTO "stoptime" VALUES (1535, 49800, 49830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1195, 1137, 1534);
INSERT INTO "stoptime" VALUES (1536, 49947, 49977, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1196, 500, 1534);
INSERT INTO "stoptime" VALUES (1537, 50207, 50237, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1197, 64, 1534);
INSERT INTO "stoptime" VALUES (1538, 50278, 50308, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1198, 69, 1534);
INSERT INTO "stoptime" VALUES (1539, 50339, 50369, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1199, 70, 1534);
INSERT INTO "stoptime" VALUES (1540, 50598, 50628, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1200, 71, 1534);
INSERT INTO "stoptime" VALUES (1541, 50759, 50789, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1201, 72, 1534);
INSERT INTO "stoptime" VALUES (1542, 50835, 50865, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1202, 73, 1534);
INSERT INTO "stoptime" VALUES (1543, 50956, 50986, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1203, 74, 1534);
INSERT INTO "stoptime" VALUES (1544, 51016, 51046, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1204, 329, 1534);
INSERT INTO "stoptime" VALUES (1545, 51105, 51135, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1205, 328, 1534);
INSERT INTO "stoptime" VALUES (1546, 51244, 51274, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1206, 326, 1534);
INSERT INTO "stoptime" VALUES (1547, 51353, 51383, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1207, 324, 1534);
INSERT INTO "stoptime" VALUES (1548, 51493, 51523, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1208, 321, 1534);
INSERT INTO "stoptime" VALUES (1549, 51600, 51630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1209, 471, 1534);
INSERT INTO "stoptime" VALUES (1550, 51673, 51703, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1210, 473, 1534);
INSERT INTO "stoptime" VALUES (1551, 51718, 51748, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1211, 475, 1534);
INSERT INTO "stoptime" VALUES (1552, 51930, 51960, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1212, 125, 1534);
INSERT INTO "stoptime" VALUES (1554, 60600, 60630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1195, 1137, 1553);
INSERT INTO "stoptime" VALUES (1555, 60747, 60777, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1196, 500, 1553);
INSERT INTO "stoptime" VALUES (1556, 61007, 61037, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1197, 64, 1553);
INSERT INTO "stoptime" VALUES (1557, 61078, 61108, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1198, 69, 1553);
INSERT INTO "stoptime" VALUES (1558, 61139, 61169, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1199, 70, 1553);
INSERT INTO "stoptime" VALUES (1559, 61398, 61428, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1200, 71, 1553);
INSERT INTO "stoptime" VALUES (1560, 61559, 61589, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1201, 72, 1553);
INSERT INTO "stoptime" VALUES (1561, 61635, 61665, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1202, 73, 1553);
INSERT INTO "stoptime" VALUES (1562, 61756, 61786, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1203, 74, 1553);
INSERT INTO "stoptime" VALUES (1563, 61816, 61846, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1204, 329, 1553);
INSERT INTO "stoptime" VALUES (1564, 61905, 61935, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1205, 328, 1553);
INSERT INTO "stoptime" VALUES (1565, 62044, 62074, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1206, 326, 1553);
INSERT INTO "stoptime" VALUES (1566, 62153, 62183, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1207, 324, 1553);
INSERT INTO "stoptime" VALUES (1567, 62293, 62323, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1208, 321, 1553);
INSERT INTO "stoptime" VALUES (1568, 62400, 62430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1209, 471, 1553);
INSERT INTO "stoptime" VALUES (1569, 62473, 62503, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1210, 473, 1553);
INSERT INTO "stoptime" VALUES (1570, 62518, 62548, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1211, 475, 1553);
INSERT INTO "stoptime" VALUES (1571, 62730, 62760, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1212, 125, 1553);
INSERT INTO "stoptime" VALUES (1573, 67800, 67830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1195, 1137, 1572);
INSERT INTO "stoptime" VALUES (1574, 67947, 67977, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1196, 500, 1572);
INSERT INTO "stoptime" VALUES (1575, 68207, 68237, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1197, 64, 1572);
INSERT INTO "stoptime" VALUES (1576, 68278, 68308, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1198, 69, 1572);
INSERT INTO "stoptime" VALUES (1577, 68339, 68369, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 5, 1199, 70, 1572);
INSERT INTO "stoptime" VALUES (1578, 68598, 68628, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 6, 1200, 71, 1572);
INSERT INTO "stoptime" VALUES (1579, 68759, 68789, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 7, 1201, 72, 1572);
INSERT INTO "stoptime" VALUES (1580, 68835, 68865, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 8, 1202, 73, 1572);
INSERT INTO "stoptime" VALUES (1581, 68956, 68986, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 9, 1203, 74, 1572);
INSERT INTO "stoptime" VALUES (1582, 69016, 69046, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 10, 1204, 329, 1572);
INSERT INTO "stoptime" VALUES (1583, 69105, 69135, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 11, 1205, 328, 1572);
INSERT INTO "stoptime" VALUES (1584, 69244, 69274, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 12, 1206, 326, 1572);
INSERT INTO "stoptime" VALUES (1585, 69353, 69383, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 13, 1207, 324, 1572);
INSERT INTO "stoptime" VALUES (1586, 69493, 69523, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 14, 1208, 321, 1572);
INSERT INTO "stoptime" VALUES (1587, 69600, 69630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 15, 1209, 471, 1572);
INSERT INTO "stoptime" VALUES (1588, 69673, 69703, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 16, 1210, 473, 1572);
INSERT INTO "stoptime" VALUES (1589, 69718, 69748, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 17, 1211, 475, 1572);
INSERT INTO "stoptime" VALUES (1590, 69930, 69960, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 18, 1212, 125, 1572);
INSERT INTO "stoptime" VALUES (1793, 24720, 24750, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1770, 1758, 1792);
INSERT INTO "stoptime" VALUES (1788, 53100, 53130, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1770, 1758, 1787);
INSERT INTO "stoptime" VALUES (1789, 57180, 57210, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1769, 1757, 1787);
INSERT INTO "stoptime" VALUES (1790, 54060, 54090, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1768, 1756, 1787);
INSERT INTO "stoptime" VALUES (1791, 54240, 54270, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1767, 1755, 1787);
INSERT INTO "stoptime" VALUES (1800, 62400, 62430, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1770, 1758, 1799);
INSERT INTO "stoptime" VALUES (1801, 62880, 62910, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1769, 1757, 1799);
INSERT INTO "stoptime" VALUES (1802, 63360, 63390, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1768, 1756, 1799);
INSERT INTO "stoptime" VALUES (1803, 63540, 63570, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1767, 1755, 1799);
INSERT INTO "stoptime" VALUES (1794, 25200, 25230, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1769, 1757, 1792);
INSERT INTO "stoptime" VALUES (1795, 25680, 25710, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1768, 1756, 1792);
INSERT INTO "stoptime" VALUES (1796, 25860, 25890, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1767, 1755, 1792);
INSERT INTO "stoptime" VALUES (1777, 48120, 48150, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1770, 1758, 1776);
INSERT INTO "stoptime" VALUES (1778, 48600, 48630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1769, 1757, 1776);
INSERT INTO "stoptime" VALUES (1779, 49080, 49110, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1768, 1756, 1776);
INSERT INTO "stoptime" VALUES (1780, 49260, 49290, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1767, 1755, 1776);
INSERT INTO "stoptime" VALUES (1805, 72300, 72330, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1770, 1758, 1804);
INSERT INTO "stoptime" VALUES (1806, 72720, 72750, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1769, 1757, 1804);
INSERT INTO "stoptime" VALUES (1807, 73200, 73230, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1768, 1756, 1804);
INSERT INTO "stoptime" VALUES (1808, 73380, 73410, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1767, 1755, 1804);
INSERT INTO "stoptime" VALUES (1816, 32400, 32400, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1811, 1758, 1815);
INSERT INTO "stoptime" VALUES (1817, 33360, 33360, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1814, 1755, 1815);
INSERT INTO "stoptime" VALUES (1819, 67200, 67200, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1811, 1758, 1818);
INSERT INTO "stoptime" VALUES (1820, 68160, 68160, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1814, 1755, 1818);
INSERT INTO "stoptime" VALUES (1828, 18300, 18300, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1823, 1758, 1827);
INSERT INTO "stoptime" VALUES (1829, 18720, 18720, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1824, 1757, 1827);
INSERT INTO "stoptime" VALUES (1830, 19260, 19260, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1826, 1755, 1827);
INSERT INTO "stoptime" VALUES (1850, 69300, 69300, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1846, 1755, 1849);
INSERT INTO "stoptime" VALUES (1851, 70260, 70260, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1848, 1758, 1849);
INSERT INTO "stoptime" VALUES (1853, 40920, 40920, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1846, 1755, 1852);
INSERT INTO "stoptime" VALUES (1854, 41880, 41880, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1848, 1758, 1852);
INSERT INTO "stoptime" VALUES (1856, 73500, 73500, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1839, 1755, 1855);
INSERT INTO "stoptime" VALUES (1857, 74100, 74100, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1841, 1757, 1855);
INSERT INTO "stoptime" VALUES (1858, 74460, 74460, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1842, 1758, 1855);
INSERT INTO "stoptime" VALUES (1860, 24360, 24390, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1833, 1755, 1859);
INSERT INTO "stoptime" VALUES (1861, 24600, 24630, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1834, 1756, 1859);
INSERT INTO "stoptime" VALUES (1862, 25260, 25290, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1835, 1757, 1859);
INSERT INTO "stoptime" VALUES (1863, 25680, 25710, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1836, 1758, 1859);
INSERT INTO "stoptime" VALUES (1865, 37020, 37050, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1833, 1755, 1864);
INSERT INTO "stoptime" VALUES (1866, 37200, 37230, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1834, 1756, 1864);
INSERT INTO "stoptime" VALUES (1867, 37680, 37710, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1835, 1757, 1864);
INSERT INTO "stoptime" VALUES (1868, 38100, 38130, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1836, 1758, 1864);
INSERT INTO "stoptime" VALUES (1870, 50700, 50730, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1833, 1755, 1869);
INSERT INTO "stoptime" VALUES (1871, 50880, 50910, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1834, 1756, 1869);
INSERT INTO "stoptime" VALUES (1872, 51360, 51390, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1835, 1757, 1869);
INSERT INTO "stoptime" VALUES (1873, 51780, 51810, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1836, 1758, 1869);
INSERT INTO "stoptime" VALUES (1875, 59340, 59370, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1833, 1755, 1874);
INSERT INTO "stoptime" VALUES (1876, 59520, 59550, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1834, 1756, 1874);
INSERT INTO "stoptime" VALUES (1877, 60000, 60030, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1835, 1757, 1874);
INSERT INTO "stoptime" VALUES (1878, 60420, 60450, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1836, 1758, 1874);
INSERT INTO "stoptime" VALUES (1880, 64800, 64830, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 1, 1833, 1755, 1879);
INSERT INTO "stoptime" VALUES (1881, 64980, 65010, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 2, 1834, 1756, 1879);
INSERT INTO "stoptime" VALUES (1882, 65460, 65490, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 3, 1835, 1757, 1879);
INSERT INTO "stoptime" VALUES (1883, 65880, 65910, 'SCHEDULED', 'SCHEDULED', NULL, NULL, 4, 1836, 1758, 1879);


--
-- TOC entry 3042 (class 0 OID 18405)
-- Dependencies: 192 3048
-- Data for Name: stoptype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3043 (class 0 OID 18411)
-- Dependencies: 193 3048
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "trip" VALUES (1135, NULL, 72000, 'TRIP_1135', 3600, NULL, 25200, 'Марно поле-Чолаковци', NULL, NULL, NULL, true, NULL, 1109, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (311, NULL, 70500, 'TRIP_311', 3600, NULL, 23700, '40 - Картала-Царевец', NULL, NULL, NULL, true, NULL, 134, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (312, NULL, 72900, 'TRIP_312', 3600, NULL, 26100, '40 - Царевец-Картала', NULL, NULL, NULL, true, NULL, 148, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (307, NULL, 73980, 'TRIP_307', 3600, NULL, 23580, '4 - ВТУ-Картала', NULL, NULL, NULL, true, NULL, 90, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (376, NULL, 75000, 'TRIP_376', 1200, NULL, 22200, '13 - Бузлуджа-ВТУ Делник', NULL, NULL, NULL, true, NULL, 341, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (378, NULL, 76980, 'TRIP_378', 1200, NULL, 24180, '13 - ВТУ-Бузлуджа Делник', NULL, NULL, NULL, true, NULL, 359, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (741, NULL, NULL, 'TRIP_30_BUZ_PR_1', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 33, NULL, NULL);
INSERT INTO "trip" VALUES (408, NULL, 74400, 'TRIP_408', 1200, NULL, 22800, '20 - Бузлуджа-Царевец Делник', NULL, NULL, NULL, true, NULL, 380, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (756, NULL, NULL, 'TRIP_30_BUZ_PR_2', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 33, NULL, NULL);
INSERT INTO "trip" VALUES (409, NULL, 70800, 'TRIP_409', 3600, NULL, 27600, '20 - Бузлуджа-Царевец Празник', NULL, NULL, NULL, true, NULL, 380, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (711, NULL, NULL, 'TRIP_30_VTU_PR_2', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 33, NULL, NULL);
INSERT INTO "trip" VALUES (410, NULL, 75600, 'TRIP_410', 1200, NULL, 24000, '20 - Царевец-Бузлуджа Делник', NULL, NULL, NULL, true, NULL, 395, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (771, NULL, NULL, 'TRIP_30_VTU_PR_1', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 33, NULL, NULL);
INSERT INTO "trip" VALUES (411, NULL, 72000, 'TRIP_411', 3600, NULL, 28800, '20 - Царевец-Бузлуджа Празник', NULL, NULL, NULL, true, NULL, 395, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (786, NULL, NULL, 'TRIP30VTUDEL1', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (801, NULL, NULL, 'TRIP30VTUDEL2', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (308, NULL, 74700, 'TRIP_308', 1800, NULL, 22500, '9 - Картала-Чолаковци', NULL, NULL, NULL, true, NULL, 180, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (309, NULL, 74700, 'TRIP_309', 1800, NULL, 22500, '9 - Чолаковци-Картала', NULL, NULL, NULL, true, NULL, 164, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (816, NULL, NULL, 'TRIP30VTUDEL3', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (831, NULL, NULL, 'TRIP30VTUDEL8', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (846, NULL, NULL, 'TRIP30VTUDEL6', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (861, NULL, NULL, 'TRIP30VTUDEL7', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (306, NULL, 72000, 'TRIP_306', 3600, NULL, 21600, '4 - Картала-ВТУ', NULL, NULL, NULL, true, NULL, 65, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (876, NULL, NULL, 'TRIP30VTUDEL5', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (891, NULL, NULL, 'TRIP30VTUDEL4', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 594, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (906, NULL, NULL, 'TRIP30BUZDEL8', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (921, NULL, NULL, 'TRIP30BUZDEL7', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (936, NULL, NULL, 'TRIP30BUZDEL6', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (951, NULL, NULL, 'TRIP30BUZDEL5', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (966, NULL, NULL, 'TRIP30BUZDEL4', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (981, NULL, NULL, 'TRIP30BUZDEL3', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (591, NULL, 76800, 'TRIP_591', 1200, NULL, 21600, '5 - Колю Фичето-ВТУ Делник', NULL, NULL, NULL, true, NULL, 556, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (996, NULL, NULL, 'TRIP30BUZDEL2', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (592, NULL, 75600, 'TRIP_592', 3600, NULL, 21600, '5 - Колю Фичето-ВТУ Празник', NULL, NULL, NULL, true, NULL, 556, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (1011, NULL, NULL, 'TRIP30BUZDEL1', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (661, NULL, 73800, 'TRIP_661', 1800, NULL, 25200, '50 - Зона Б-Мавриков Делник', NULL, NULL, NULL, true, NULL, 627, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (1026, NULL, NULL, 'TRIP30BUZDEL9', NULL, NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, false, NULL, 610, 593, 32, NULL, NULL);
INSERT INTO "trip" VALUES (662, NULL, 64800, 'TRIP_662', 3600, NULL, 28800, '50 - Зона Б-Мавриков Празник', NULL, NULL, NULL, true, NULL, 627, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (412, NULL, 72600, 'TRIP_412', 3600, NULL, 22200, '13 - Бузлуджа-ВТУ Празник 1', NULL, NULL, NULL, true, NULL, 341, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (664, NULL, 66300, 'TRIP_664', 3600, NULL, 30300, '50 - Мавриков-Зона Б - Празник', NULL, NULL, NULL, true, NULL, 643, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (663, NULL, 75300, 'TRIP_663', 1800, NULL, 26700, '50 - Мавриков-Зона Б - Делник', NULL, NULL, NULL, true, NULL, 643, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (1041, NULL, 73800, 'TRIP_1041', 3600, NULL, 23400, '13 - Бузлуджа-ВТУ Празник 2', NULL, NULL, NULL, true, NULL, 341, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (413, NULL, 74580, 'TRIP_413', 3600, NULL, 24180, '13 - ВТУ-Бузлуджа Празник 1', NULL, NULL, NULL, true, NULL, 359, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (1042, NULL, 75780, 'TRIP_1042', 3600, NULL, 25380, '13 - ВТУ-Бузлуджа Празник 2', NULL, NULL, NULL, true, NULL, 359, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (1080, NULL, 68400, 'TRIP_1080', 3600, NULL, 21600, 'Чолаковци-Марно поле', NULL, NULL, NULL, true, NULL, 1044, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1081, NULL, 70200, 'TRIP_1081', 3600, NULL, 23400, 'Марно поле-Чолаковци', NULL, NULL, NULL, true, NULL, 1062, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1134, NULL, 70200, 'TRIP_1134', 3600, NULL, 23400, 'Чолаковци-Марно поле', NULL, NULL, NULL, true, NULL, 1083, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1231, NULL, NULL, 'TRIP_70_VTU_PR2', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 1138, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1248, NULL, NULL, 'TRIP_70_VTU_PR3', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 1138, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1214, '', NULL, 'TRIP_70_VTU_PR1', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 1138, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1265, NULL, NULL, 'TRIP_70_VTU_PR4', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 1138, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1282, NULL, NULL, 'TRIP_70_VTU_PR5', NULL, NULL, NULL, NULL, NULL, 'ВТУ', NULL, false, NULL, 1138, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1299, NULL, NULL, 'TRIP_70_MCH_PR1', NULL, NULL, NULL, NULL, NULL, 'с. Малки Чифлик', NULL, false, NULL, 1157, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1318, NULL, NULL, 'TRIP_70_MCH_PR2', NULL, NULL, NULL, NULL, NULL, 'с. Малки Чифлик', NULL, false, NULL, 1157, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1337, NULL, NULL, 'TRIP_70_MCH_PR3', NULL, NULL, NULL, NULL, NULL, 'с. Малки Чифлик', NULL, false, NULL, 1157, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1356, NULL, NULL, 'TRIP_70_MCH_PR4', NULL, NULL, NULL, NULL, NULL, 'с. Малки Чифлик', NULL, false, NULL, 1157, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1375, NULL, NULL, 'TRIP_70_MCH_PR5', NULL, NULL, NULL, NULL, NULL, 'с. Малки Чифлик', NULL, false, NULL, 1157, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1394, NULL, NULL, 'TRIP_70_VTUCH_PR1', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1176, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1428, NULL, NULL, 'TRIP_70_VTUCH_PR3', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1176, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1411, NULL, NULL, 'TRIP_70_VTUCH_PR2', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1176, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1445, NULL, NULL, 'TRIP_70_VTUCH_PR4', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1176, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1462, NULL, NULL, 'TRIP_70_VTUCH_PR5', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1176, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1479, NULL, NULL, 'TRIP_70_VTUCH_PR6', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1176, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1496, NULL, NULL, 'TRIP_70_MCHCH_PR1', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1194, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1515, NULL, NULL, 'TRIP_70_MCHCH_PR2', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1194, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1534, NULL, NULL, 'TRIP_70_MCHCH_PR3', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1194, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1553, NULL, NULL, 'TRIP_70_MCHCH_PR4', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1194, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1572, NULL, NULL, 'TRIP_70_MCHCH_PR5', NULL, NULL, NULL, NULL, NULL, 'Чолаковци', NULL, false, NULL, 1194, 1136, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1638, NULL, 73200, 'TRIP_1638', 3600, NULL, 22800, 'Автогара Запад-Беляковец', NULL, NULL, NULL, true, NULL, 1606, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1639, NULL, 75000, 'TRIP_1639', 3600, NULL, 24600, 'Беляковец-Автогара Запад', NULL, NULL, NULL, true, NULL, 1621, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1691, NULL, 70800, 'TRIP_1691', 3600, NULL, 20400, 'Чолаковци-Мавриков', NULL, NULL, NULL, true, NULL, 1644, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1692, NULL, 72600, 'TRIP_1692', 3600, NULL, 22200, 'Мавриков-Чолаковци', NULL, NULL, NULL, true, NULL, 1669, NULL, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1787, NULL, NULL, 'BDZ_GO_SA_TR_VT_3', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1766, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1799, NULL, NULL, 'BDZ_GO_SA_TR_VT_4', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1766, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1792, NULL, NULL, 'BDZ_GO_SA_TR_VT_2', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1766, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1776, NULL, NULL, 'BDZ_GO_SA_TR_VT_1', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1766, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1804, NULL, NULL, 'BDZ_GO_SA_TR_VT_5', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1766, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1815, NULL, NULL, 'BDZ_GO_VT_1', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1810, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1818, NULL, NULL, 'BDZ_GO_VT_2', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1810, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1827, NULL, NULL, 'BDZ_GO_SA_VT_1', NULL, NULL, NULL, NULL, NULL, 'Велико Търново', NULL, false, NULL, 1822, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1849, NULL, NULL, 'BDZ_VT_GO_2', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1759, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1852, NULL, NULL, 'BDZ_VT_GO_1', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1759, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1855, NULL, NULL, 'BDZ_VT_SA_GO_1', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1838, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1859, NULL, NULL, 'BDZ_VT_TR_SA_GO_1', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1832, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1864, NULL, NULL, 'BDZ_VT_TR_SA_GO_2', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1832, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1869, NULL, NULL, 'BDZ_VT_TR_SA_GO_3', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1832, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1874, NULL, NULL, 'BDZ_VT_TR_SA_GO_4', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1832, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1879, NULL, NULL, 'BDZ_VT_TR_SA_GO_5', NULL, NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, false, NULL, 1832, 1754, 107, NULL, NULL);
INSERT INTO "trip" VALUES (1966, NULL, 76500, 'TRIP_1966', 1800, NULL, 22500, 'Г.Оряховица-В.Търново', NULL, NULL, NULL, true, NULL, 1885, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (1967, NULL, 72900, 'TRIP_1967', 1800, NULL, 22500, 'В.Търново-Г.Оряховица', NULL, NULL, NULL, true, NULL, 1885, NULL, 32, NULL, NULL);
INSERT INTO "trip" VALUES (1968, NULL, 71100, 'TRIP_1968', 3600, NULL, 24300, 'Г.Оряховица-В.Търново Празник', NULL, NULL, NULL, true, NULL, 1885, NULL, 33, NULL, NULL);
INSERT INTO "trip" VALUES (1969, NULL, 71100, 'TRIP_1969', 3600, NULL, 24300, 'В.Търново-Г.Оряховица Празник', NULL, NULL, NULL, true, NULL, 1885, NULL, 33, NULL, NULL);


--
-- TOC entry 3044 (class 0 OID 18417)
-- Dependencies: 194 3048
-- Data for Name: trippattern; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "trippattern" VALUES (643, '{q~eGetq{CsA`AwBfBUj@Ud@QfASxCCtBZ|Mj@fG^Jn@F`D@dAK`AA`AZh@Fl@@d@Gr@OfCsALIHODQ@Q@YA]a@}CF}@f@g@`ASXA\Fl@L|Ad@n@Vl@n@pAtBt@|Bn@bCf@tBn@`BThAN|AApA@`BOhEGj@Sv@Qv@IlA{@~D{BrCU\wAdD[j@a@j@aAvA}@zAw@~AKRWnA?bB@`BZrGDzB~HpI~ClD~CjDzB~BzBlCzAtBdC|E`@x@XbAb@~Ad@|@bCpDtCjAt@TVLf@`@b@d@TZNZVp@fAjF|@jPr@`L@xBp@~Hj@bIt@pKFr@C\EZGZ?V@TFNJJL?LELI`@@b@FLKFO@QMiBBUDUNQRMn@OxB?^ARENMHOLa@Jo@R}ATaCR}@Ru@fDmIfBqEh@qAb@]\_@b@_@nAy@|@yATo@T_ATgAJq@Ds@`@A`AB`@@XFPPJYRuAPwAAm@Ea@K_@UUKIMCi@A_@F?V??????????????????', NULL, NULL, NULL, NULL, 'Зона Б', NULL, NULL, NULL, true, NULL, 626, 660);
INSERT INTO "trippattern" VALUES (359, 'gy{eGkgq{CcAb@y@j@_CnBwCbCwBzA{AhAkBbA}BNkBWoAKg@FUTSXIPCT?f@Pv@T`@jCdEVf@n@pANd@Jf@XpALdD?p@MhBUrBY~Bc@fB_A`EuAbF{@~AqA`BGL?RJFJBhDi@jAS|G_@`AG`AJTDRHn@VfDfCH@lCi@PDNJNPTZDn@tFQPBV\fErMpBvUEfBMXOTSRWJY?WCc@Yu@eAiAyAkAqAuAeAm@Wm@SkACcB^y@P}@?eAPoAf@}@A}@OcAc@gAy@g@k@]Q]MY@Y?yNrBoC|A{At@m@V}A\Qh@@^|DjErBxBrAxAtBrCj@~@d@|@hA`C^p@XhAb@zA^r@jC|DjDnAt@VnAnAh@x@j@~Bl@vCz@nPr@`L@|B|A~Rr@tKHbAOl@Av@P\Xp@Lz@^pFFhBGn@QTUNMZAn@Nb@b@V`@MZdAXxET|BRxCXEfEnAr@LnCy@hC}AxB_Bf@O~AL{@{FIk@d@Y^BXj@b@ZhBVp@Oj@sAz@_@rBi@xAQCs@ViGAyBk@uCsA{CJS??????????????????????????????????????', NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, NULL, NULL, true, NULL, 313, 375);
INSERT INTO "trippattern" VALUES (180, 'gy}eGcek{C?wBxAf@~C~Bd@`GBv@KrATbAHt@l@tLFdF@dFH`BBp@PjBt@bEp@Uh@CXr@E`CLr@`@XVyD`@aGh@aIjA{GnAyGf@}Cb@iD\{Kv@eUZuIFsCQi@o@_C{CgGsEcGwFcGsAuA?m@T[|Ac@dCiApC_BdKyApC[t@Nj@d@dAtAx@p@|@h@~ANlBTjBx@zCjAhBHnAM|@Qt@Wr@a@~A{AnCuBrAm@`AWfBq@bDSlDDjDE~FP^DhG`BjGxAwAtKgB~N?tFVtC`@dBt@|BhF|Jr@hBp@zCRvAJzABjMBxLFzZGvAsBxXC`BFjB^lCdArCjEfId@nA~AzG|@rCz@rCLl@qDlFwDtFKO????????????', NULL, NULL, NULL, NULL, 'Чолаковци', NULL, NULL, NULL, true, NULL, 163, 195);
INSERT INTO "trippattern" VALUES (341, 'cqzeGyji{CLQhAbC\p@t@nDBtBOdDGxAD`AcBPyC|@Y\M^[h@g@Hs@Qu@G_@W]q@[AUFUNJr@Jx@ZxBP`AaBMu@ZkBrAiC|AaCx@e@Ea@IaEmAk@iHc@_FWy@Fo@?_@OWE_@G{@GaCi@eIj@uBEe@O[UA[[Mg@OuBaA{MqAwOu@{Lo@{LIkAc@mB]qBk@yAo@w@eAs@oEaByBgDo@cAOk@m@_Ce@}@eC_FwGgI{@y@gBmBoAsAEe@Tg@x@QhA]rFyCbLaBr@Kp@Gd@?d@R^Vj@v@bAhAd@Zl@XxBRzAZt@Tr@`@zB|@`BPdBLpA?r@Nv@Zb@^bBlB^Vb@`@l@|@h@lAX`AFh@Dh@EZITMPSJO?S?[UM[G[B_At@qHHgA@eAAqAI{AqBqUeEkM[e@eGPAe@[g@_@]e@@{Bd@aDeCeAc@oAUmETiDPqF~@MCGK?QFQhAsAR[p@oA|BuI|@eEj@yEL{BE}AEqBMg@a@gBs@_ByDkGU{@@{@\k@NSPI^ChAHZFrAN`BGf@KzBoAfA}@j@_@|EyDzBoB|ByA??????????????????????????????????????????', NULL, NULL, NULL, NULL, 'ВТУ', NULL, NULL, NULL, true, NULL, 313, 358);
INSERT INTO "trippattern" VALUES (164, 'ogyeGsuf{ChGeJKm@}A}E}BmJoAuCgDeG}@kC_@sCGmBBwApBuWFwBEi\EaYIqBYiBaAaEiGqLm@cBk@{BSsCC{B?{Bn@sFp@iFzA{LmO{DcAIoEQwISoCPyCp@cC~@wFbDiA\o@Am@Ow@e@s@k@y@g@{@W{@AaAR}@?gBXsAd@aAUaAY{A{@g@_AkAYiGz@oG~@}GfDqA`@]`@Dj@lFvFtC`DbC`DlDbHn@bCPf@@x@eBnf@U`Hc@zDy@lEgCpNsArGQdAKhASd@o@b@mAd@y@_EOcCI_CIaMa@cIQcD[kAHsAE{Aa@aF_D_C{Ai@e@~@E|@F`Bl@HCsBW@??????????', NULL, NULL, NULL, NULL, 'Картала', NULL, NULL, NULL, true, NULL, 163, 179);
INSERT INTO "trippattern" VALUES (380, 'cqzeGyji{CJSnBdEf@fCH|AAdAOvDE|@@v@gBT}Bn@YNQLSt@YZe@JaB[c@Q[q@g@Ic@^Jx@Jp@ZxBR|@cBMy@^eBlAgC~AeCz@q@IyEsAi@gHSgCIkA]cAFY@_@EYMWIoAIuCi@eI`@aAJaAMc@]KYYMi@U{BeA{NmAoNs@{Lo@yLGkAaAmE[oAi@y@o@m@q@c@kE}AgDgFSq@i@_Cc@}@cCsEoCuD_DkDwCwCsCgD{JsKE_CIyBOsCC}DX{An@wAfC_ElAmBrAeDPUzBqCrBkAfAuAb@[LgADiDWcEKiA????', NULL, NULL, NULL, NULL, 'Царевец', NULL, NULL, NULL, true, NULL, 379, 394);
INSERT INTO "trippattern" VALUES (395, 'yj}eGkzo{CB`BSdFi@zBKnAy@vD{BzCYXmAbDaD`F{AhCa@xAAfA?rCTtDHhB@hBbItI|HvIrCzCjC|CfAhBpB|D`@|@X`Ad@hBbDbFxEdB|ApAt@zAnA~Fx@fPr@jL@rBp@~Hj@zHz@|LCn@MjANh@Xf@Nt@^fFFpCMp@[LSd@Aj@Lb@ZTX@NGT\LbAVtDh@|GVG~DjAx@RjCy@xCeBjBwAn@SvALy@_GEe@d@YV@X\P^`Cb@d@E^k@Zu@vAe@xA_@rAQCkAX}FG{Bk@sCWk@y@aBLU??????????', NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, NULL, NULL, true, NULL, 379, 407);
INSERT INTO "trippattern" VALUES (627, 'iuzeG{jk{Cw@NKbCMjACxAG|@]hBi@nBaA|AiAx@o@d@}@x@kBzE_E|JSf@Md@Qx@E^WjCO`AQ~@OXQJOBm@@kB?SCS?SLSNMRI\?XHjA@XELMDMCISES@SJc@AWEUKOSIWKSg@KkAGy@_AgMc@yF_@eEQmBs@wLY_FU{EGgAgAcF[_A[k@i@g@s@k@oEaBi@o@iBqC_@s@Me@o@aCc@w@m@oAiA{BsAoByAiBeBmBuDaEqAsAkAwAkBoBkGyGE}BIyBOyCCaB?}AXyAjA_CtAyBzAyBtAkDZ]vBuCrBkAt@_ALO\UJUDYBc@DwCSoEUiAUcAKGKCKEGUMcBUeAo@_BqAkF}@mCmAuBq@q@eBm@gBc@[?c@Da@Ho@j@C`@A\`@`D@^C\CTOToBfAg@Rs@Nm@Fs@Ee@Ig@UgA?eAJaD?eAOMEk@cGS{HIgDDsBPqCTqARg@Tg@vAkAv@m@|@o@BL????????????', NULL, NULL, NULL, NULL, 'Мавриков', NULL, NULL, NULL, true, NULL, 626, 642);
INSERT INTO "trippattern" VALUES (1044, 'cwyeGcbm{CLWBWEQGSMGS?O@IDIJE\QpAe@rDq@tFEj@Az@?|@BfBRtCLp@Pp@v@dCzDpHd@|@h@lAXz@VdAVpAL|@Fz@Br@BpA@rK@bG@nCB|MBpJC`BCv@}@xLw@dKA`ABv@DdAZxBx@fClDxGl@nA`@bArAnFn@fC|AzE@NBRMTcDvEwAtByAzB_KjO_@`@u@j@m@Pq@Fo@?eASwBu@aAa@a@K_@AS?WH{@d@eAz@}AvAWNQF_@F[@YC[Gk@WoBuAcEaDgEgD{AaA_Aw@k@c@YWY]MOK]G_@m@aIS_DWaDqAwPg@uGk@cH_@mECa@KYMWFW@WCa@MUIqAImCO_CYiEV{@Ty@C]ISIG_@OMMM_@SeCMyAMgB]oEMeBq@oI[iDq@oL[}EUgFGeAGSi@kCUgAUo@[q@e@g@c@_@a@YmE}AgA_BeAaB_@u@Ka@W}@YcAg@_AmB{Dq@cAy@kAaAkAyDeEiBmBoAuACUFYJ[r@M`A[dAg@xDuB`HcAjAQt@MBd@KpAI^O^F\OH????????????????????????????', NULL, NULL, NULL, NULL, 'Марно Поле', NULL, NULL, NULL, true, NULL, 1043, 1061);
INSERT INTO "trippattern" VALUES (90, 'gy{eGmgq{CcAd@]R]V}@v@_Av@yD~Ca@Vi@b@kBrAwAv@_ANeAFgAOm@IiAKg@B_@b@S^ER?R?VFZFVJRd@r@dA`BbAfBt@~A^xANh@B`@@^FnC?`@Eb@GdAi@rEe@vBkA|Eg@pBWz@Sh@a@x@m@v@_AlA?NDNNBLCvCe@jAQzCUxBKrAGV@h@Hh@Nf@R|@n@dAx@f@d@jASx@SRCPD\ZV`@?`@FFh@AbBEdBGRHTZdElMNfBZlDl@zGXnDAl@Gp@Sf@c@`@UDW@WIWO_@a@[e@aAsAcAiAe@c@e@]c@[e@S{@Q{@CqB`@i@LeA@q@Lq@Rq@VaAA_AS}@c@SMi@a@OQ_@a@QMc@MQAgAHeMfBUFiCtA_Ah@kAd@o@Pm@NO`@?d@tFdGdClCzBxCt@nAhAzB~@hBp@bCLh@Br@q@hRW`I[dIUdHa@jDyAhImBjKkAhGMn@UjBWb@g@\oAd@w@cESaCG}BImMw@iNW}@H}ACgAa@iFoCsBi@YeA]c@fAE^@l@DjAl@FCqBW???????????????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'Картала', NULL, NULL, NULL, true, NULL, 9, 105);
INSERT INTO "trippattern" VALUES (134, 'ey}eGcek{CC{BzAj@lA|@pA`AA{F|BwJPUBiAHOXWh@YNG?V@dACvB@xEnBxGMzCi@rLi@vMKdDAX?~@LtGJ`BbAdDFb@[|EJf@f@Zd@qHRmCf@_ItCgPl@kD`@iD^yKp@wRh@{NC{@Ok@q@cCyAyCoA_CuAmBmDcEwD}DgG_HmG{GC}BI{BOsCEqDXcBj@oA|AkCnBuC`ByDlCkDrBkAdAqAd@]LgABcEUmDKeA????????', NULL, NULL, NULL, NULL, 'Царевец', NULL, NULL, NULL, true, NULL, 114, 147);
INSERT INTO "trippattern" VALUES (148, 'wj}eGkzo{C@bBMlCCz@Gj@c@dBKjAy@dE_CvCSZuAfDeD`Fw@xAe@`AWtA?zA@dBTfEBv@Br@@zAxIjJ~IxJvC`DbArAdAzAhAzBv@xA^v@p@fCNr@?|@aBze@KjCIjC]bDoAbH{B~Le@bCg@fCIf@G\OpAOZUZu@^u@Xy@qEOcBC}@EmACuA?wCE}Ey@yNUw@H{AC}@c@sFsCuBs@]u@WDxBU?????????????????????????????????', NULL, NULL, NULL, NULL, 'Картала', NULL, NULL, NULL, true, NULL, 114, 158);
INSERT INTO "trippattern" VALUES (1083, 'ewyeGcbm{CN[BUGUMSKCQBKAKLILIj@m@~Ey@zGCdA@jCBt@RpC\xAp@tBTf@Xh@pClFv@zAXp@^pAb@rBJr@L~@B|@B|@@xJ@vE?pFFrZArAcAhNu@xJAz@B~@Bx@Z~Bz@fCf@fAx@xAfArBr@xAh@zAp@lCjAtEnA~DHTD\KVsAjBqAnB{AxBwAtBoIhMm@|@Y^]Zc@V_@Nc@Fa@@{@Iy@QaA[}Ao@o@OSCU?QBQBaAl@eCvB[VYPUFYBi@?k@Ok@YgAu@eAy@{D{C}CcCsA}@q@i@a@[}@s@_@c@MQK]G]SiCYwDS_DW_DyBoYk@cH_@iEA[GYSc@FS@]C]MUEm@Eq@IoCg@{Hl@oBA_@KUIGMCWHUd@Ql@mBpCON_A\qBP?~CAhV?|IiEvI}MfXwApCqAnCUd@Y`@UHUFQAUEOOOSKWEc@?cB@kBR_\HqNJoTDeD?mAMe@M]L{Bj@_Ij@uIrCyOl@gD`@oDNiFLkDXoId@cMPgFFsBCcAMe@o@_Cc@{@eBiDc@y@cAuAoAcBoAuAsE}EsAwAAYRo@p@Mj@Qh@StDoBv@e@xCa@hG_ABb@M~AUr@D^OF??????????', NULL, NULL, NULL, NULL, 'Марно поле', NULL, NULL, NULL, true, NULL, 1082, 1108);
INSERT INTO "trippattern" VALUES (1062, 'gw|eGumm{CVvAd@}EDWAUIU]IkDf@mDf@gANwBlAwBhAi@Pg@Nu@NSj@B^zDfErCxCjAvAlA|An@`AxBlEb@z@XbATx@Lf@\n@fAbBdAzAbBr@fBj@\T`@\VTTVZl@Vv@TdAh@jCHTXlG^zGn@nKB`@@jBn@zHVbDT|Cx@xL@ZCXEVEP?\BXNP\bABX\dEBl@FrBAb@Mb@OBKJKNG\@\H\JNPJT?RGLNLb@NhBNrBh@bH|@bL~@nLl@|HTxCJrAFrA@^K~@?PDTLJR@x@Pf@H|Al@zA`AzD|CdEbDp@f@bAp@f@R^H\Bf@Ed@OvAoAnAgAbAm@\IPAT@d@Jz@Xt@\pA`@dARdA?l@Mt@_@d@g@hCwDnDqFpDmFvFkIHKFOEa@q@qB_A{Cs@{C}@kD[y@s@}A_CeEe@aAu@wBOs@U_BGqAAkADeAx@wK\kEVcDFcBAcNEwMCmR?gEC}@KmAQqAWsAYiAUm@M]qAgCaCoEm@wAm@cBe@qBSwDAyA@aBpA_LXSVEJKHOZg@P]?_@KUOMW@OBMVIj@QC??????????????????', NULL, NULL, NULL, NULL, 'Чолаковци', NULL, NULL, NULL, true, NULL, 1043, 1079);
INSERT INTO "trippattern" VALUES (594, '{rzeGyli{CP?FGDM@MEOIKK?k@g@qA{@a@E[DSPuEnFMBMGYYO[QWa@c@MSCKAOFSLObAu@TQJSHWFcB@Mh@}@b@m@Va@JUjAoEd@gBHg@?kAIm@[yAe@oAi@cAMsAiAt@kB~AKTgFpMcAfCWt@S~@WlCQrAMp@GZKNKLQFQBiB?g@?g@Aa@TQVGZAXL|AALENQBOOGW?WJi@C]GUQK]MMSIWEc@M_Bq@eJmAiOO_BCc@q@yK[mFWkFGeAeAeF_@cAa@q@]]o@g@WMcBm@aBm@kC}Da@u@Mk@o@{Bc@w@{BqEmDyEyGgHoAwAA[Ro@p@KzAg@hFsCbC]|GcAdBS`@?j@PZV\b@x@bAl@f@`@X\NjALjALv@N|@ZrAn@fBn@|ARzAFfBD`A\ZL\ZxAbBnAdAp@dAh@lATx@JhACVERQ^QHWBWEWWMg@Cq@TmCd@aEH}A?}AKyBqBoUeEmMOSOMOEk@DiABkBFQC?c@[e@]YUCkCf@[OcAy@_As@iAi@u@Os@EwF\oAFoDh@{AVIEEECM@MvAgBbAkBjBiHfA{En@uFLkBMqEk@kCu@aB_EwGOw@?a@BUHS^g@RKTCrAJjBVlBI^KZOjBkAhBsAfFcErBeB^Wr@_@t@@t@HW_@]EKDCK????????????????????', NULL, NULL, NULL, NULL, 'ВТУ', NULL, NULL, NULL, false, NULL, 593, 609);
INSERT INTO "trippattern" VALUES (610, 'gy{eGkgq{Ck@T}@h@oCzBcCnBgCnBcBlA_B|@k@L}ADmBWsAI_@D_@^Yn@?l@Nv@lD|F~@lBt@xCJjEIxACb@m@~EcBrHqAxEu@|AcBrBAH?PDHL@hG}@nDQxCQ\?`ANl@V\LjCvBXN~Be@PCN@`@`@V`@AV@HFBvBGz@Cv@EL@\^fAbDbCrHTpCZxD|@dKAhAGf@Q^UX[Ng@@g@YYYa@m@kBcCq@q@w@o@_Ag@y@QcAEaAPwA^cA?mATiAb@kACaAUk@[i@][SY][[]O_@Ie@@g@FqAP_KxAmCtAiAp@cA`@k@Nq@NSh@?\pAvAjBtB|C~CfCdDv@hAzBnE`@x@XbAb@~Ab@z@dCtDhE`B\LZXr@p@\n@Tp@d@pBb@xB\zG`@rGn@bLBxBp@nIVpCR|C\dFZnE@XEf@I`@?^DVLPT?TM`@?XFNCJIDS?SM_BBWJYLMTMh@KbAAdA?TCTGLQJUPcAXeCLqALo@XgAlCwGlD}IhAcAjBuAPxAFh@B~BH`B?v@Cf@aAhDw@nCIn@ItCChAC`@K^SViAx@QPIT@TJTXXZ`@\j@ZTH?JItEoFNMZCP@PDd@Zd@\RZDN?Z?JBHJHMh@??????????????????????????????????????', NULL, NULL, NULL, NULL, 'Бузлуджа', NULL, NULL, NULL, false, NULL, 593, 625);
INSERT INTO "trippattern" VALUES (1109, 'gw|eGwmm{CVzAd@{EDa@CSEMOIOEkHhAoBT{BlAyBhAg@Ri@Pu@JSn@@ZtFbGtAvAj@p@xAjB|@nA`@t@rAnCr@vAn@|BLd@Dx@[`Je@fMc@hMQhFAp@S`BMlAuBlLmAvG_BlISfBOpBSdDLb@d@XJZLb@@pBEhCCdGGtHItPS`^ApD@ZH^Zb@`@P^AVMX_@Vi@rAsC|BqE~LqV`EiI?_J@iV@{CnBUhAQXOPSLULOPKP?PFN`@Pl@`@fFFrABjAEZIXUFSZG^B\F\RNRHNANIXj@NrBPrBh@bH|BpYbAvMRhD@d@M|@F`@JJRBx@PfAVbA^xA`Aj@d@pCxBvErDvA`Ax@^\DX@`@E^Kz@q@bA}@p@k@~@k@VIb@CXDr@PvAl@tAd@l@Jn@Dx@Ef@Oh@]j@g@~DeGdHmK|D_GfA_BBMCMCQg@{Ak@iBoA}E{@kDi@qAg@cAaDaGcAyC[}BG{AAwA~@}Lv@eKDwA?_FAqECiOEmWCuAIuAOkAc@sBe@aBaBgDaCoEm@kA}@_DQ{@MqAGsACoB@iBpAuKXYZCl@cAN]@[EOKOKGY@OFKTGj@QE??????????????????????????????????????????', NULL, NULL, NULL, NULL, 'Чолаковци', NULL, NULL, NULL, true, NULL, 1082, 1133);
INSERT INTO "trippattern" VALUES (1138, 'kjyeGwqf{CaKfOc@h@i@b@[N_@Hi@Bq@Au@O}Ag@kAi@y@Qc@E_@?_@Ra@T{DfD_@Lo@Dc@Gi@Os@_@uMeKcBgAcAy@}@q@m@u@S{@yAaSg@yGqAyPk@eHe@kFIWMYFW@WASESIOGu@KoDi@cIVy@Rw@A]CQMMWGSOO]C[SqBw@wK{@{KYsCCk@_AsOSmDQoDGgAGSg@kCUeAYu@_@u@g@g@s@i@yEgBmC_E]u@Ma@o@aCcC{Eq@mAkCmD}CeDiCoCmAuACYRo@|A]h@SjFuCvHiAlBWzASh@AVFTH^VX^x@bAVXZT^TZLb@HZB`AHz@NjA^xCpAXJZFx@Jv@Fz@Dx@A^@v@Tb@Rb@X~AjBbAv@`@f@`@r@^~@X~@Db@Bd@?XKZOVQHc@?QIMOK[G[?a@HcAJ_Ab@aEJwA@wAKiC{@uJY_DMyAOiBeEkM[a@SE[DqABiADu@@GI@_@W][_@WCiCh@QE_BoAcAy@m@Sk@Q_@G]?_CF{BL{ALuAPkDl@OCGKAOHOrA_Bn@gAf@_BpA_F~@iEZiBToBNaBDkAGaDGs@Kq@a@uAa@_Aq@oAsAwBs@gAQYKYGg@?i@FSJSNSNOZKj@@t@HzATVBrAK\Eb@QxA{@`CgBnCwBjAcArBaBZYbAk@f@SAI??????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'Света Гора (ВТУ)', NULL, NULL, NULL, NULL, NULL, 1136, 1155);
INSERT INTO "trippattern" VALUES (65, 'ey}eGgek{CCsB|Aj@|CxBb@jFBlAItAV`ADz@n@hLB`BDfJJvCPpBv@`E~@Y\@LRFPAn@CdBBRHTd@\NsCVeDP_Cj@wIrCyOl@kD^_D^aLzAqb@C}@Qo@k@uBaDqGo@_AsBmCaAgAaFkFqAuA?YPq@ZEr@QhAa@hAm@rC_B|IoAfC_@t@Gd@F`@R^`@j@r@n@v@j@^j@Xp@JvAJ`ATdA\fAf@tAj@`@JnANfBJh@Aj@Bf@Lv@TZVZZl@r@\^t@l@XVh@v@h@lARn@FRDZDd@?XCVSb@KHOB[@OGKKOYGWAY@]JiANyATwBHy@F{@?u@?s@C_AG}@y@mJ[sDYmDiEuMSWKIU@cBDyADg@@EK?]Y_@W[OEK?oCj@yCaC_Ae@oAWk@?oDNkDVmFz@K?IKAWnA_Bf@w@b@_Al@uBh@wBh@sBd@yBZgBPyAN}AJsBC{@?{@GaAGo@c@cB]}@a@u@{AiC}AaCKg@AO?c@DSHWPUPQXMZ?dAL`BTP@~AITETKdBaArAcAj@a@`F}DvBiB^[|A_A??F@????????????@?????????????A?A?A???C??A??????????????????????????????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'ВТУ', NULL, NULL, NULL, true, NULL, 9, 104);
INSERT INTO "trippattern" VALUES (1176, 'iy{eGigq{C_A`@y@h@_ClB_EdDiAv@wAfA_B~@]Lm@Fc@@_@DsBYuDhBnHbQOfLkDjQwDlHxPeAvE~@dJ`CpAxAxEUtEfMz@|Jr@fJmAdEeCoBq@_AcD_DeD{@uFf@aDbAqEiAyCwB_P`CqJfEUpAzDvDfGhH|C|EpBzEt@fCnClEfFbBxA`B|BxHr@xPz@vKElC`BtR|@rMOjBp@rBh@|IGbBs@?DhBd@j@j@Mf@rGjDtb@zA~RChBzAlAtVzO`AJ`AKl@]jAcAr@o@l@c@n@_@x@El@JdC`ArA`@dAJhAIXKZOp@i@dBgCbBgCfHqKRX??????????????????', NULL, NULL, NULL, NULL, 'Чолаковци', NULL, NULL, NULL, NULL, NULL, 1136, 1193);
INSERT INTO "trippattern" VALUES (1621, 'u`bfGcdd{CZGBo@hBaKbC_OLi@rA_BvCuDpCyClDkC`@_@b@k@bE_G~@qAp@c@pAg@j@UfAs@dAs@|CmBbAo@vByBp@g@~@YzA[fA[dDiBzAeAzAkAzByB`EsExEyFpC{CnCeDt@kAZ}@TaAnDsO`CiKl@{BFMP]TYTQ^?tELpAGhIoAdDi@tCqAp@W`@AHDRX@PCtCH\f@^NsCVaDPeCh@qIlAwGfAgGl@eD^gDTcHHyBf@_OPwEVaHF{B?c@C]^v@jC|DpE`Bx@j@f@j@PVVh@Pl@R`Ah@jCFR^nH\zFn@lK@Z@jBn@~HZxDXlEn@`JB\?\Gf@I\@ZBNNP\fAb@pFFxBB`@EXIZMBKHMRENCR@ZHZPPTHPANGNVH\^zEh@~Gt@hJ\rEh@xGP~Ba@`AJnBLA??????????????????????????', NULL, NULL, NULL, NULL, 'Автогара Запад', NULL, NULL, NULL, true, NULL, 1591, 1636);
INSERT INTO "trippattern" VALUES (1194, 'gjzeG}mu{CUNUJUBU@UFWJ[Ps@|@_BxB_@Z_@ReADeAG_@AOFKNMZW|@u@xCgBfF}AbEmAbDQh@KTMTOLOFc@@?XBnCVjHVdHX~GT|GDrFHjRKd@IJQJSBi@CKAIGSxCYrHSlDCf@Kn@Md@MTKL}@Ri@Jk@DgBSW_@SEWBw@\w@d@iCvB}EzDm@b@sAbAwAx@_@Pk@Hm@Bi@DgBYiAKW?OBMHQPQVM\?j@D\FVVd@vAxBpAxBf@bAX`AXfAJz@BnABhA?VE|@G~@W`CM`AUpAcAhEgAhEa@nAc@~@_AnAc@f@MT@THHN?vDo@dCUfCQzCKXBZFx@Vh@Vr@j@hBxAjCk@R?VNNPT`@@`@LDb@?tAG~@CXAVCPFV`@dEjMtAxO\|DCjAGd@S`@UTQJSB[?UI_@Yo@{@oBkCi@i@q@i@w@c@o@Uw@Ic@A}@N}A^cA@m@Hw@Ts@X_AA}@Qy@_@eAu@a@e@_@Yg@Qq@@yAR}K~AoFtCo@Te@Lu@NOh@A^|DfEvD`EjBdC`AvAx@dBx@|A`@x@XdAb@xAZt@pCbEtEbBr@f@h@n@V^Pb@Rn@Px@b@zBJ`@^rH\vFl@hKB\@tBn@`IVxCTbDt@rKDb@?\Cb@ENEZ?TBPFLHH\fA`@pFFtA@`AARI`@SFMLKTCRAVFZHPLJJDN@NEHANVDRBP^rEh@bH|@~K~@tLbAlMRnDBXK~@AXDRLHVBr@P|@RdA^`BdAj@d@vGhFfCnBfAl@b@Jb@B^C\Gh@_@pCcCx@i@b@Kb@?d@Hz@ZvBv@`ATt@Dl@Aj@Mf@Wf@a@Zc@nDoFhEqG|A}BRV??????????????????????????????????????????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'Чолаковци', NULL, NULL, NULL, NULL, NULL, 1136, 1213);
INSERT INTO "trippattern" VALUES (1157, 'kjyeGyqf{CqFjImC~Dc@f@i@`@k@Tk@Fm@?i@Gi@KmAa@mAg@m@Sc@G]?a@HYPo@`@qCbCUNWJ]Do@?{@W{@k@eCkBoFiE{BaBw@g@cA{@{@m@m@w@M]Ig@i@yHWiDUsCyBqYk@eHe@oFIWMWFU@]E_@ISK}@GaD_@oFKyAVw@Rw@?a@MWUKWKKUIWUaCeA}N{@oKKgAC_@u@yLWmE_@oHq@cD]yASc@Qc@q@u@{@o@qEaByAyBi@y@g@}@Mg@o@}BgCcFa@w@gA{AoA_B_CgCeDoDqAuAAUFWJ[t@OpAc@tDoB|@e@rC_@fG_AbBUl@?XLPHZVV\v@~@TXXRz@d@r@JnAJh@Hj@NbA\`Af@~@\j@RhALfAJrBBf@Fb@Nd@Pf@`@xAbBx@n@\\^l@Td@Xl@Tv@DXDZ@f@CTEPMVIFKDa@BSMOOK[EW?a@Dg@RuB`@uDHoA?gACcACgA_AiKu@wIkDoKY}@QWQMiAD_A@_ADY@[CAe@U_@[[QE_BXy@NyBeBu@i@m@WcAU_@?_@?qBHqBLaBLqAR_Df@O@IICULStAgBd@w@Tk@f@eBd@kB`AaE\_BXgB^{DFqAGiDEi@Q{@Uw@Uo@k@kAgAmBqAmB]k@I]Eg@?a@FUPWPSPQLCRAlALnBX|@G~@KtAq@fDcClCuBjCyBlAeAdAk@f@SRCTDZ^hBRn@G~A[NSN_@Lo@JaANuCb@sKJqAFFFBl@BJ?VIJMLk@IeQEkFUcIk@wN]uJCmDb@C\U\w@|DiKxB{Gr@yCL[R[XEx@DdABVCVITOVUtBuCf@i@f@Ub@K^Al@]??????????????????????????????????????????????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'с. Малки Чифлик', NULL, NULL, NULL, NULL, NULL, 1136, 1156);
INSERT INTO "trippattern" VALUES (1644, 'kjyeGwqf{CwAtBsB~CeBhCkAdB]d@u@h@]Ni@He@@m@CeASoAc@qAi@k@Og@Ec@F}@h@i@`@cBxAm@f@[Jk@Da@C_@Ik@YqA{@iEiDcDgCo@g@}AcAiA_Aw@m@u@}@Ou@UqCWqDi@_Ii@wGi@yGg@}Gk@gHa@sEGg@Sa@FW@WAYGSQUSGM?UHMLITCVB^HV@j@Mv@i@~B]vAm@|AsBlEmGrMy@`BeDpG}ExJuBbEmApBs@pAMR[Te@LY?WEUSSWUg@Km@Cw@AqC@aBNk[Pea@HsETuBNiCh@yHj@mIrC{Oj@cD^}CR{FLkDZsIb@aMPgFFqBAgAMc@q@_C_@y@wBeEqAmBwAiBcCmCaDiDqFeGaHoHE}BI}BQyCAmD@WVmAf@gAtAcCxBcD|AsDV]|BwClBeAx@cATUTMHWD[Ba@BwAB}@QwCC_AUcAU}@EKQEKGGSG}@Gg@S}@m@}Am@_Cq@qCq@qBu@sAq@{@i@]qAc@aBc@]Ac@FUBWHg@d@Gb@?\`@~C@`@Cd@IX[Xu@\y@`@s@Ta@Hg@B{@G{@Ya@Eq@By@FkD@mAUi@yF]yL?qA@gARyCNgAVy@R_@VWr@m@j@e@vAaADJ????????????????????', NULL, NULL, NULL, NULL, 'Мавриков', NULL, NULL, NULL, true, NULL, 1643, 1668);
INSERT INTO "trippattern" VALUES (1669, 'uq~eGwsq{COEe@^g@ZgAz@a@`@W\Wn@Mh@Kl@Q~BE|BD~BHzBLxFj@xF`@Lf@H~B@j@A|@Ix@A^FXJ^Jv@Dl@Cx@Qn@Yl@]x@a@NWD_@@YAa@QkAOsADy@h@i@|@Qd@?f@Hp@NvAd@^PZXd@l@r@hAZr@V|@f@lBf@rBXfARb@Tj@TdANhB?d@Ad@Bx@?l@I|AEtAGx@Ut@Qz@IhA{@~D{BvCY^oA`DcCnDuA`CQ\[x@UnA@zDP|CHvBBzB~GnH|A~A`AlAxB~BjAnAt@x@zB`ChChDr@nA`BbDd@~@n@~BLb@Dh@Ah@GjBu@dTe@hMWhH]`Dm@fD_B|Iu@|DqAxGMt@Q~AKhAWnEChGGfJItQK`OI`QCrCFlH?jBBjAFdANx@HVd@x@h@v@Tl@HX@X?XI\SVUJa@ESMMWG_@?_@Dc@Hg@J_@r@sBx@kBrBsDlA}BdBmDhCmFlAgCv@iBjDcI`BeDfE{InBeEl@}A^y@^gAr@cCH]LAPINZHVNjBNpBh@dHpApPj@`HRbCl@hITpD@TAXIl@?VDNJJLBZDb@H`ATlAf@~@l@~@r@lEjD~CbCtA`Aj@Xl@Lj@Ad@I~@s@bB{Ad@]h@[XKVEh@FTBvAh@hAb@l@Pf@Hp@Fd@Cd@Gd@Qr@i@Za@rB}CxBgDpCeEzA{BRX??????????????????????????????????', NULL, NULL, NULL, NULL, 'Чолаковци', NULL, NULL, NULL, true, NULL, 1643, 1690);
INSERT INTO "trippattern" VALUES (556, 'a~|eGa|f{CAiShB?d@S|CoF\o@Vy@TwAHSNI`JD?}F@kVAwCyLhAmFNoAAa@M][gCeFImAN_Cb@qGDcAvCaPj@_Db@qDLgEPqExAyb@C{@Mg@m@sBc@_A{BqEeCiDaDkDaDgDqA}AA_@Ri@hBe@`CiAhCwAfK}A|BYd@?~@b@p@t@~@hAj@b@j@XvBTf@Dh@L`A\pD|A`BRdBLhAA~A^x@h@|AhBbAx@bAxA\v@XbAFx@Cx@Sb@e@Ng@OQ]Ka@?u@|@uIFcA?y@CcACmAuBeVgEoMUYQIYD}ABqADo@?Ae@U_@c@a@WAeCh@WM_BoA{@m@{@_@k@Km@GyAJqDPyAHqDj@aAPMAGIAO@K|AmBz@aBtAiFzA}Gr@sFJoBMoEYqAU_Au@_ByAgCaBiCOy@?o@N]PUTW\GvAJlBTxAEd@IbAg@`Ao@tB{A~E_EaFZ[DWHSNk@f@{A`AcAfAm@\aA?wAKoAiAqA_AOCM?oB\}B^SL[b@Sb@AXIV_BzAUF_@?@gF@s@Fk@XgAh@}@fB}BhBeCRc@N_@Hc@?e@Ea@M[OSSSWGa@CcCp@{@Do@GyCg@{Ba@]AgADyARsAh@iA^sAZUD_CH}@Ds@Lq@\a@PgC`DIPERCTARDTnAfGZjART|@dAv@Tx@JnAE`@@n@?ZCXAXFh@g@p@Qr@CfB\hBv@z@x@x@tAnAvDhAtEl@|AThAN`B?lA?bBQvEGd@Ux@Mn@IfAy@|D}BvCW\mAxCc@t@cCpDcBdDU`B@pDJ|BNhCBhCtH`I~DlE~DlEfDrDbCjDzBnEb@z@h@zBNb@B|@cBpf@S|Gc@tDm@zCuCbPo@lD_@hBMr@_@vDYbENh@f@XLyCN]T@~BjD^d@b@JnA@nFOzIw@zAQ@xCApJ?vJ?zF?bBgErIcIbPgChFYX??????????????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'кв.Колю Фичето-ВТУ', NULL, NULL, NULL, true, NULL, 417, 590);
INSERT INTO "trippattern" VALUES (1606, 'mr{eGc|f{CJfAF`@L`@b@PTjD?ZAPGj@CPFXHHVDLGJMBU@OGQKOIUMk@UeD]yEQgCQsBg@yGqAwPk@gHa@qEGi@Sc@FQ@WAUESGQIw@KqDi@_Ij@kB?[CQIMMI[MMOIYUgCy@yKiAqNQgBs@wLWoEWmFGeAGSi@mCSaAWu@_@s@k@m@s@i@uEcBiA_BcA_B_@u@Bb@?\GtBSfFa@~LYpIK|BSfG?Rc@pDmA`H}@bFu@bEqApGMv@UbBITSVaAj@o@RcChAg@LqEt@aGz@uAHsEKa@C]Xc@r@a@vAuC~LyAnGwAjGQr@]bAm@~@gD|D{BdCoDfE}DrEsBxBmBbBcDxBmBbA_Ab@gB\gAXc@Vc@\i@h@m@p@g@b@}A~@_BbAsChBm@Z{@Zi@Vg@\gB`CyClE}@dAuDnCgCnCsF|GM\CNQbAoBpLgBtJE^Ad@[F?I??????????????????????', NULL, NULL, NULL, NULL, 'с. Беляковец', NULL, NULL, NULL, true, NULL, 1591, 1637);
INSERT INTO "trippattern" VALUES (1759, 'm|{eG_mn{CoCoDo@m@s@s@cAo@g@Wk@Qi@MaA?y@Du@H_B^eAP}Cj@{ATy@Hy@?}@OeAWy@]{@m@qBoBiDsDuAwA[a@yCuCaAcAwEaFgBeBa@YgAo@g@SeAUoAEa@?w@Hi@Jy@\y@j@g@`@g@l@m@~@e@lAe@nAc@vA}@xC_@dAa@x@k@v@g@l@{@r@k@\mDnBkBdA}@j@{@n@c@`@c@j@}AxBqA~AcAjA}AhA{A|@gE~BoAr@aAn@iA~@g@j@s@`Ak@`AaBlDYdAeAxFwB`Lc@dBcBhF]|AU`B}AzJs@rE[dBYfAWv@k@tA}@vAaC`Dw@bAy@x@y@p@o@^yIhEeB~@cAp@yA|@oAp@y@Xu@N}@HyA@kBJaBReEz@iAHoBDoML{Dk@oB[m@Em@?eAJgDh@g@Du@?_EEuA?i@@cANo@Pu@\mClBmA|@o@\q@`@YHsATm@BcACaAGaD[yEc@{BMaCGsBAqBBeENiABoA?iHK}GQeCe@sAc@gC}@kDsAqDeBwAw@cAcAa@c@y@qAMYm@mA[w@[cAu@sCi@oCc@kCU_BSsBWgCa@cD_@gC]sAkAuDyBcHU}@UeAO_AOcAYmCKaBG}AA}BByRL_k@F}TD}TDcLDsSB_F@qJCoAImAOcB]_CyA_IkAwGW_BMwAMqBAuAPsCLkAXiAZ{@x@{BrAeDZgAXyAHu@Do@Bm@\{ORuKBqAFkE\gNPwHPkGNkGn@D??????????????????????????????', NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, NULL, NULL, NULL, NULL, 1754, 1764);
INSERT INTO "trippattern" VALUES (1822, 'qvhfGi_w{C????????????????????????f@Bg@Co@EOjGQjGQvH]fNGjECpAStK]zOCl@En@It@YxA[fAsAdDy@zB[z@YhAMjAQrC@tALpBLvAV~AjAvGxA~H\~BNbBHlABnAApJC~EErSEbLE|TG|TM~j@CxR@|BF|AJ`BXlCNbAN~@TdAT|@xBbHjAtD\rA^fC`@bDVfCRrBT~Ab@jCh@nCt@rCZbAZv@z@fBx@pA`@b@bAbAvAv@pDdBjDrAfC|@rAb@dCd@|GPhHJnA?hACdEOpBCrB@`CFzBLxEb@`DZ`AFbABl@CrAUXIp@a@n@]lA}@lCmBt@]n@QbAOh@AtA?~DDt@?f@EfDi@dAKl@?l@DnBZzDj@nMMnBEhAIdE{@`BSjBKxAA|@It@Ox@YnAq@xA}@bAq@dB_AxIiEn@_@x@q@x@y@v@cA`CaD|@wAj@uAVw@XgAZeBr@sE|A{JTaB\}AbBiFb@eBvBaLdAyFXeA`BmDj@aAr@aAf@k@hA_A`Ao@nAs@fE_CzA}@|AiAbAkApA_B|AyBb@k@b@a@z@o@|@k@jBeAlDoBj@]z@s@f@m@j@w@`@y@^eA|@yCb@wAd@oAd@mAl@_Af@m@f@a@x@k@x@]h@Kv@I`@?nADdATf@RfAn@`@XfBdBvE`F`AbAxCtCZ`@tAvAhDrDpBnBz@l@x@\dAV|@Nx@?x@IzAU|Ck@dAQ~A_@t@Ix@E`A?h@Lj@Pf@VbAn@r@r@n@l@nCnD????', NULL, NULL, NULL, NULL, 'Самоводене и В.Търново', NULL, NULL, NULL, NULL, NULL, 1754, 1821);
INSERT INTO "trippattern" VALUES (1766, 'qvhfGi_w{C????????????????????????f@Bg@Co@EOjGQjGQvH]fNGjECpAStK]zOCl@En@It@YxA[fAsAdDy@zB[z@YhAMjAQrC@tALpBLvAV~AjAvGxA~H\~BNbBHlABnAApJC~EErSEbLE|TG|TM~j@CxR@|BF|AJ`BXlCNbAN~@TdAT|@xBbHjAtD\rA^fC`@bDVfCRrBT~Ab@jCh@nCt@rCZbAZv@z@fBx@pA`@b@bAbAvAv@pDdBjDrAfC|@rAb@dCd@|GPhHJnA?hACdEOpBCrB@`CFzBLxEb@`DZ`AFbABl@CrAUXIp@a@n@]lA}@lCmBt@]n@QbAOh@AtA?~DDt@?f@EfDi@dAKl@?l@DnBZzDj@nMMnBEhAIdE{@`BSjBKxAA|@It@Ox@YnAq@xA}@bAq@dB_AxIiEn@_@x@q@x@y@v@cA`CaD|@wAj@uAVw@XgAZeBr@sE|A{JTaB\}AbBiFb@eBvBaLdAyFXeA`BmDj@aAr@aAf@k@hA_A`Ao@nAs@fE_CzA}@|AiAbAkApA_B|AyBb@k@b@a@z@o@|@k@jBeAlDoBj@]z@s@f@m@j@w@`@y@^eA|@yCb@wAd@oAd@mAl@_Af@m@f@a@x@k@x@]h@Kv@I`@?nADdATf@RfAn@`@XfBdBvE`F`AbAxCtCZ`@tAvAhDrDpBnBz@l@x@\dAV|@Nx@?x@IzAU|Ck@dAQ~A_@t@Ix@E`A?h@Lj@Pf@VbAn@r@r@n@l@nCnD????', NULL, NULL, NULL, NULL, 'Самоводене, Трапезица и В.Търново', NULL, NULL, NULL, NULL, NULL, 1754, 1765);
INSERT INTO "trippattern" VALUES (1810, 'qvhfGi_w{C????????????????????????f@Bg@Co@EOjGQjGQvH]fNGjECpAStK]zOCl@En@It@YxA[fAsAdDy@zB[z@YhAMjAQrC@tALpBLvAV~AjAvGxA~H\~BNbBHlABnAApJC~EErSEbLE|TG|TM~j@CxR@|BF|AJ`BXlCNbAN~@TdAT|@xBbHjAtD\rA^fC`@bDVfCRrBT~Ab@jCh@nCt@rCZbAZv@z@fBx@pA`@b@bAbAvAv@pDdBjDrAfC|@rAb@dCd@|GPhHJnA?hACdEOpBCrB@`CFzBLxEb@`DZ`AFbABl@CrAUXIp@a@n@]lA}@lCmBt@]n@QbAOh@AtA?~DDt@?f@EfDi@dAKl@?l@DnBZzDj@nMMnBEhAIdE{@`BSjBKxAA|@It@Ox@YnAq@xA}@bAq@dB_AxIiEn@_@x@q@x@y@v@cA`CaD|@wAj@uAVw@XgAZeBr@sE|A{JTaB\}AbBiFb@eBvBaLdAyFXeA`BmDj@aAr@aAf@k@hA_A`Ao@nAs@fE_CzA}@|AiAbAkApA_B|AyBb@k@b@a@z@o@|@k@jBeAlDoBj@]z@s@f@m@j@w@`@y@^eA|@yCb@wAd@oAd@mAl@_Af@m@f@a@x@k@x@]h@Kv@I`@?nADdATf@RfAn@`@XfBdBvE`F`AbAxCtCZ`@tAvAhDrDpBnBz@l@x@\dAV|@Nx@?x@IzAU|Ck@dAQ~A_@t@Ix@E`A?h@Lj@Pf@VbAn@r@r@n@l@nCnD????', NULL, NULL, NULL, NULL, 'Велико Търново', NULL, NULL, NULL, NULL, NULL, 1754, 1809);
INSERT INTO "trippattern" VALUES (1832, 'm|{eG_mn{CoCoDo@m@s@s@cAo@g@Wk@Qi@MaA?y@Du@H_B^eAP}Cj@{ATy@Hy@?}@OeAWy@]{@m@qBoBiDsDuAwA[a@yCuCaAcAwEaFgBeBa@YgAo@g@SeAUoAEa@?w@Hi@Jy@\y@j@g@`@g@l@m@~@e@lAe@nAc@vA}@xC_@dAa@x@k@v@g@l@{@r@k@\mDnBkBdA}@j@{@n@c@`@c@j@}AxBqA~AcAjA}AhA{A|@gE~BoAr@aAn@iA~@g@j@s@`Ak@`AaBlDYdAeAxFwB`Lc@dBcBhF]|AU`B}AzJs@rE[dBYfAWv@k@tA}@vAaC`Dw@bAy@x@y@p@o@^yIhEeB~@cAp@yA|@oAp@y@Xu@N}@HyA@kBJaBReEz@iAHoBDoML{Dk@oB[m@Em@?eAJgDh@g@Du@?_EEuA?i@@cANo@Pu@\mClBmA|@o@\q@`@YHsATm@BcACaAGaD[yEc@{BMaCGsBAqBBeENiABoA?iHK}GQeCe@sAc@gC}@kDsAqDeBwAw@cAcAa@c@y@qAMYm@mA[w@[cAu@sCi@oCc@kCU_BSsBWgCa@cD_@gC]sAkAuDyBcHU}@UeAO_AOcAYmCKaBG}AA}BByRL_k@F}TD}TDcLDsSB_F@qJCoAImAOcB]_CyA_IkAwGW_BMwAMqBAuAPsCLkAXiAZ{@x@{BrAeDZgAXyAHu@Do@Bm@\{ORuKBqAFkE\gNPwHPkGNkGn@D??????????????????????????????', NULL, NULL, NULL, NULL, 'Трапезица, Самоводене и Г.Оряховица', NULL, NULL, NULL, NULL, NULL, 1754, 1831);
INSERT INTO "trippattern" VALUES (1838, 'm|{eG_mn{CoCoDo@m@s@s@cAo@g@Wk@Qi@MaA?y@Du@H_B^eAP}Cj@{ATy@Hy@?}@OeAWy@]{@m@qBoBiDsDuAwA[a@yCuCaAcAwEaFgBeBa@YgAo@g@SeAUoAEa@?w@Hi@Jy@\y@j@g@`@g@l@m@~@e@lAe@nAc@vA}@xC_@dAa@x@k@v@g@l@{@r@k@\mDnBkBdA}@j@{@n@c@`@c@j@}AxBqA~AcAjA}AhA{A|@gE~BoAr@aAn@iA~@g@j@s@`Ak@`AaBlDYdAeAxFwB`Lc@dBcBhF]|AU`B}AzJs@rE[dBYfAWv@k@tA}@vAaC`Dw@bAy@x@y@p@o@^yIhEeB~@cAp@yA|@oAp@y@Xu@N}@HyA@kBJaBReEz@iAHoBDoML{Dk@oB[m@Em@?eAJgDh@g@Du@?_EEuA?i@@cANo@Pu@\mClBmA|@o@\q@`@YHsATm@BcACaAGaD[yEc@{BMaCGsBAqBBeENiABoA?iHK}GQeCe@sAc@gC}@kDsAqDeBwAw@cAcAa@c@y@qAMYm@mA[w@[cAu@sCi@oCc@kCU_BSsBWgCa@cD_@gC]sAkAuDyBcHU}@UeAO_AOcAYmCKaBG}AA}BByRL_k@F}TD}TDcLDsSB_F@qJCoAImAOcB]_CyA_IkAwGW_BMwAMqBAuAPsCLkAXiAZ{@x@{BrAeDZgAXyAHu@Do@Bm@\{ORuKBqAFkE\gNPwHPkGNkGn@D??????????????????????????????', NULL, NULL, NULL, NULL, 'Самоводене и Г.Оряховица', NULL, NULL, NULL, NULL, NULL, 1754, 1837);
INSERT INTO "trippattern" VALUES (1885, '_uhfGi_w{CHsEFaEBcDDiATyAnCcMpById@oBrCgNRe@TWvAPx@Fb@Ad@tA|@~BxAvB\v@VbAPt@H~@`@hHHx@Rt@Rl@lBbGlBnFxBfGrBtFVt@tCtLtBYfEk@vEk@c@{JWiDeAsQlEkUHSTIhAOd@St@N`Bh@dBd@dATjA`@xFNh@BHGd@FxCPnA@vCUz@IjCGPaEBiENs@rBaN`B}D`AcFRs@hCyFbBeDrBuDnCqDlMwQlBiC|AyCh@qBBk@Ao@E[G_@g@gB_BaGQy@M}@IkACmADeBF}Ap@wFv@uGpAkK^kA`@_A|@yA`@g@\YvA_ArE{CzAiAb@c@X[n@k@nF{ElGiFfD{AbMoDjFyAfEaBjEoBpFyBnAc@tD}@nDe@t@AhGOpGO~HMhI_@~Di@tHmBdAzKHr@`@Vb@A^RX`@rBrUr@lHjAfJrAhIzA~HvCzNvCdO~ChOfAfFx@~ENvC?xCKnHC|ETnETxAXrAt@dCdAtBhAzAfKfJxDlDbBzA`AhBl@jBTpAF~@PtDv@nVVpCn@vDtAtEtAxDlBfFnFfOdB|Ex@|D^dC`Dn_@j@lHTjFBxDb@tLb@bLTbHBlCJrUHhQVlZHpFGxIy@bH_AnH[zCQdHU|HEtA?nCFrCBd@b@dFRnCb@zEx@rJEhAId@U`@OLMJ]D_@Cm@c@q@_AgB_Cq@s@q@e@i@]e@Sw@Oy@Ck@HkBd@cA?eARwAh@oAEk@O_Ac@cAs@c@g@UQi@S_@AsALcHdAsC`@YNc@TsDnBuAb@s@NSn@DZxDdEvDbElAzAtAnB|BrE`@x@XdAb@|A^r@bA|AfA~At@\|CdAx@n@l@n@\t@Pf@VhAh@lCFN^rHZvFp@~KBbCbA|LXzDz@|L?XCXERE^?XDVLL\hAb@nFHdCAh@Kb@UDMNITCTB^H\PNRHPENEN\HR`@`Ff@bH|@|K~@lLPfCa@~@LrBJE????????????????????????????????????', NULL, NULL, NULL, NULL, 'Велико Търново', NULL, NULL, NULL, true, NULL, 1884, 1915);
INSERT INTO "trippattern" VALUES (1917, 'ar{eGi|f{C??????????????????????????????KBJnAH\J\NLRBRnD@TATEZC\BZJJJBP@NOFS?SCSMOKYIa@Go@MgBk@mIW{Cg@}Ga@cFo@qIk@eH[qDEi@EWIUMWHS@SAYEUIOEi@Cc@CgAEkAi@gI`@kAJe@AWEQIOSGWKKUGOE]QoB]sEUaDi@gHc@kFOyAAQU}DYoE[wFOyCGmAGkAGOi@mCWiAQg@]u@m@o@y@o@}CeAw@]eA_B_AwAc@y@Ok@m@wBd@]d@WpGOnBFv@Pt@`@fHtH`D^hALvAN~El@hC}Xt@yHJ{BEmBy@sJc@{ESoCc@eFCe@GsC?oCDuAT}HPeHZ{C~@oHx@cHFyIIeGWyYIiQKsUCmCUcHc@cLc@uLCyDEoAO{Ck@mHaDo_@_@eCy@}DuAyD}@kCUm@kDqJmBgFuAyDuAuEo@wDWqCw@oVQuDG_AIg@Ki@m@kBaAiBcB{AyDmDgKgJiA{AeAuBu@eCYsAUyAUoEB}EHkD@cC?yCOwCy@_FgAgF_DiOwCeOwC{N{A_IsAiIkAgJs@mHkBiTDcANk@ZUf@Sb@]La@Du@?wDIcAs@gCkHlAuHlBuBLiIP{GRsDJcFJcFNyABu@HgB\uD`AkBf@kD~AeDvA_EfBwAh@sLdDgFzAgA\gBv@uFxEeFtEcBxA_@f@sAdAMJOXsH`FYXu@bAs@jAm@hBeClSw@fGKzBCtBHpBXbBnAxEv@rCRv@B\@p@A\EZg@`Bm@lAm@jAmBhC{FdIqEpGkDzEwAjCcBdDiCxFSr@aAbFaB|DsB`NOr@ChEQ`EkCF{@HwCTqAC}BMYAe@GIFi@CyFOkAa@eAUeBe@aBi@u@Oe@R]Fk@FUHIR_BpIwAzHUz@b@jHV`EHfBVhDb@zJwEj@gEj@uBXuCuLWu@sBuF{@cCM[o@gBmBoFmBcGSm@Su@Iy@a@iHI_AQu@WcA]w@yAwB}@_CIU[_Ac@@y@GwAQUVSd@sCfNe@nBqBxIoCbMUxAEhACbDG`EIrE????????????????????????????????????????????', NULL, NULL, NULL, NULL, 'Горна Оряховица', NULL, NULL, NULL, true, NULL, 1884, 1916);


--
-- TOC entry 3045 (class 0 OID 18424)
-- Dependencies: 195 3048
-- Data for Name: trippattern_trippatternstop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1045);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1046);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1047);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1048);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1049);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1050);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1051);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1052);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1053);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1054);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1055);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1056);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1057);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1947);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1948);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1949);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1918);
INSERT INTO "trippattern_trippatternstop" VALUES (1810, 1811);
INSERT INTO "trippattern_trippatternstop" VALUES (1810, 1814);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1058);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1059);
INSERT INTO "trippattern_trippatternstop" VALUES (1044, 1060);
INSERT INTO "trippattern_trippatternstop" VALUES (1822, 1823);
INSERT INTO "trippattern_trippatternstop" VALUES (1822, 1824);
INSERT INTO "trippattern_trippatternstop" VALUES (1822, 1826);
INSERT INTO "trippattern_trippatternstop" VALUES (1766, 1770);
INSERT INTO "trippattern_trippatternstop" VALUES (1766, 1769);
INSERT INTO "trippattern_trippatternstop" VALUES (1766, 1768);
INSERT INTO "trippattern_trippatternstop" VALUES (1766, 1767);
INSERT INTO "trippattern_trippatternstop" VALUES (1832, 1833);
INSERT INTO "trippattern_trippatternstop" VALUES (1832, 1834);
INSERT INTO "trippattern_trippatternstop" VALUES (1832, 1835);
INSERT INTO "trippattern_trippatternstop" VALUES (1832, 1836);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 381);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 382);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 383);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 384);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 385);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 386);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 387);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 388);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 389);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 390);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 391);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 392);
INSERT INTO "trippattern_trippatternstop" VALUES (380, 393);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 181);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 182);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 360);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 361);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 362);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 363);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 364);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 365);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 366);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 367);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 368);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 369);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 370);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 371);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 372);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 373);
INSERT INTO "trippattern_trippatternstop" VALUES (359, 374);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 183);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 184);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1950);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1951);
INSERT INTO "trippattern_trippatternstop" VALUES (1759, 1846);
INSERT INTO "trippattern_trippatternstop" VALUES (1759, 1848);
INSERT INTO "trippattern_trippatternstop" VALUES (1838, 1839);
INSERT INTO "trippattern_trippatternstop" VALUES (1838, 1841);
INSERT INTO "trippattern_trippatternstop" VALUES (1838, 1842);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 185);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 186);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 187);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 188);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 189);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 190);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 191);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 192);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 193);
INSERT INTO "trippattern_trippatternstop" VALUES (180, 194);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 396);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 397);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 398);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 399);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 400);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 401);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 402);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 403);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 404);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 405);
INSERT INTO "trippattern_trippatternstop" VALUES (395, 406);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 342);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 343);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 344);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 345);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 346);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 347);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 165);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 166);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 167);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 168);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 169);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 171);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 172);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 173);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 174);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 175);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 176);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 177);
INSERT INTO "trippattern_trippatternstop" VALUES (164, 178);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 348);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 349);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 350);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 351);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 353);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 354);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 355);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 356);
INSERT INTO "trippattern_trippatternstop" VALUES (341, 357);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 611);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 612);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 613);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 614);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 615);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 616);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 617);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 618);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 619);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 620);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 621);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 622);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 623);
INSERT INTO "trippattern_trippatternstop" VALUES (610, 624);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 628);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 629);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 630);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 631);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 632);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 633);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 634);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 635);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 636);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 637);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 638);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 639);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 640);
INSERT INTO "trippattern_trippatternstop" VALUES (627, 641);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1063);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1064);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1065);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1066);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1067);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1068);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1952);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1953);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1954);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1955);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1956);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1957);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1958);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1959);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1960);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1961);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1962);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1963);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1964);
INSERT INTO "trippattern_trippatternstop" VALUES (1885, 1965);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1069);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1070);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1071);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1072);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1073);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1074);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 595);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 596);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 597);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 598);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 599);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 600);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 601);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 602);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 603);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 604);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 605);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 606);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 607);
INSERT INTO "trippattern_trippatternstop" VALUES (594, 608);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1075);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1076);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1077);
INSERT INTO "trippattern_trippatternstop" VALUES (1062, 1078);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 647);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 648);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 649);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 650);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 651);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 652);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 653);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 654);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 655);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 656);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 657);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 658);
INSERT INTO "trippattern_trippatternstop" VALUES (643, 659);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1084);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1085);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1086);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1087);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1088);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1089);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1090);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1091);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1092);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1093);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1094);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1095);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1096);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1097);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1099);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1100);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1101);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1102);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1103);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1104);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1105);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1106);
INSERT INTO "trippattern_trippatternstop" VALUES (1083, 1107);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1110);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1111);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1112);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1113);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1114);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1115);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1116);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1117);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1118);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1119);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1120);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1121);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1122);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1123);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1124);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1125);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1126);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1127);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1128);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1129);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1130);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1131);
INSERT INTO "trippattern_trippatternstop" VALUES (1109, 1132);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1158);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1159);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1160);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1161);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1162);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1163);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1164);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1165);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1166);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1167);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1168);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1169);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1170);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1171);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1172);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1173);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1174);
INSERT INTO "trippattern_trippatternstop" VALUES (1157, 1175);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1177);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1178);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1179);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1180);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1181);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1182);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1183);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1184);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1185);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1186);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1187);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1188);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1189);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1190);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1191);
INSERT INTO "trippattern_trippatternstop" VALUES (1176, 1192);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1139);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1140);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1141);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1142);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1143);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1144);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1145);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1146);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1147);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1148);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1149);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1150);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1151);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1152);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1153);
INSERT INTO "trippattern_trippatternstop" VALUES (1138, 1154);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1670);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1671);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1672);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1673);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 149);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 150);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 151);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 152);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 153);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 154);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 155);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 156);
INSERT INTO "trippattern_trippatternstop" VALUES (148, 157);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1674);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1675);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1676);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1677);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1678);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1679);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1680);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1681);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1682);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1683);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1684);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1685);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1686);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1687);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1688);
INSERT INTO "trippattern_trippatternstop" VALUES (1669, 1689);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1645);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1646);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1647);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1648);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1649);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1650);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1651);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1653);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1654);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1655);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1656);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1657);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1658);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1659);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1660);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1661);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1662);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1663);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1664);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1665);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1666);
INSERT INTO "trippattern_trippatternstop" VALUES (1644, 1667);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1607);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1608);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1609);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1610);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1611);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1612);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1613);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1614);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1615);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1616);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1617);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1195);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 66);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 67);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 68);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 80);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 81);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 82);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 83);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 84);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 85);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 86);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 87);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 88);
INSERT INTO "trippattern_trippatternstop" VALUES (65, 89);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1196);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1197);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1198);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1199);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1200);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1201);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1202);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1203);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1204);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1205);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1206);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1207);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1208);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1209);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1210);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1211);
INSERT INTO "trippattern_trippatternstop" VALUES (1194, 1212);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1618);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1619);
INSERT INTO "trippattern_trippatternstop" VALUES (1606, 1620);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1933);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1934);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1935);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1936);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1937);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1938);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1939);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1942);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1943);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1944);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1622);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1623);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1624);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1625);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1626);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1627);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1628);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 135);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 136);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 137);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 138);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 139);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 140);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 141);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 142);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 143);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 144);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 145);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 91);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 92);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 93);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 94);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 95);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 96);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 97);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 98);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 99);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 100);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 101);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 102);
INSERT INTO "trippattern_trippatternstop" VALUES (90, 103);
INSERT INTO "trippattern_trippatternstop" VALUES (134, 146);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1629);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1630);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1631);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1632);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1633);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1634);
INSERT INTO "trippattern_trippatternstop" VALUES (1621, 1635);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1945);
INSERT INTO "trippattern_trippatternstop" VALUES (1917, 1946);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 557);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 558);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 559);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 560);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 561);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 562);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 563);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 564);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 565);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 566);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 567);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 568);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 569);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 570);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 571);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 572);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 573);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 574);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 575);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 576);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 577);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 578);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 579);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 580);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 581);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 582);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 583);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 584);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 585);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 586);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 587);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 588);
INSERT INTO "trippattern_trippatternstop" VALUES (556, 589);


--
-- TOC entry 3046 (class 0 OID 18427)
-- Dependencies: 196 3048
-- Data for Name: trippatternstop; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "trippatternstop" VALUES (149, 0, 30, 0, 1, 148, 122);
INSERT INTO "trippatternstop" VALUES (351, 5471.4442246266826, 30, 116, 10, 341, 59);
INSERT INTO "trippatternstop" VALUES (166, 704.3434459840754, 30, 85, 2, 164, 127);
INSERT INTO "trippatternstop" VALUES (167, 2172.7297952238241, 30, 176, 3, 164, 129);
INSERT INTO "trippatternstop" VALUES (168, 2874.191381326687, 30, 84, 4, 164, 131);
INSERT INTO "trippatternstop" VALUES (169, 3768.4396317739147, 30, 107, 5, 164, 132);
INSERT INTO "trippatternstop" VALUES (171, 5324.8842446284598, 30, 187, 6, 164, 73);
INSERT INTO "trippatternstop" VALUES (172, 6082.0221430020156, 30, 91, 7, 164, 74);
INSERT INTO "trippatternstop" VALUES (182, 518.279544100517, 30, 62, 2, 180, 53);
INSERT INTO "trippatternstop" VALUES (183, 1720.2210121517751, 30, 144, 3, 180, 54);
INSERT INTO "trippatternstop" VALUES (173, 6371.0263620919914, 30, 35, 8, 164, 75);
INSERT INTO "trippatternstop" VALUES (66, 0, 30, 0, 1, 65, 52);
INSERT INTO "trippatternstop" VALUES (353, 5817.4906036495413, 30, 50, 11, 341, 352);
INSERT INTO "trippatternstop" VALUES (174, 6856.3786609513154, 30, 58, 9, 164, 76);
INSERT INTO "trippatternstop" VALUES (184, 2218.9755023072844, 30, 60, 4, 180, 55);
INSERT INTO "trippatternstop" VALUES (185, 2639.4201729686747, 30, 50, 5, 180, 56);
INSERT INTO "trippatternstop" VALUES (186, 3335.9935947399426, 30, 84, 6, 180, 57);
INSERT INTO "trippatternstop" VALUES (165, 0, 30, 0, 1, 164, 125);
INSERT INTO "trippatternstop" VALUES (354, 7635.4957577395371, 30, 262, 12, 341, 61);
INSERT INTO "trippatternstop" VALUES (355, 9531.7491941550361, 30, 273, 13, 341, 62);
INSERT INTO "trippatternstop" VALUES (361, 342.04519337601266, 30, 51, 2, 359, 69);
INSERT INTO "trippatternstop" VALUES (365, 3978.7598299201336, 30, 56, 6, 359, 73);
INSERT INTO "trippatternstop" VALUES (366, 4733.8822849501566, 30, 109, 7, 359, 74);
INSERT INTO "trippatternstop" VALUES (367, 4981.6079222555099, 30, 36, 8, 359, 329);
INSERT INTO "trippatternstop" VALUES (175, 7610.3821535103352, 30, 90, 10, 164, 77);
INSERT INTO "trippatternstop" VALUES (176, 8429.1660203189313, 30, 98, 11, 164, 78);
INSERT INTO "trippatternstop" VALUES (187, 3942.376868076386, 30, 73, 7, 180, 58);
INSERT INTO "trippatternstop" VALUES (177, 9488.1654478457422, 30, 127, 12, 164, 79);
INSERT INTO "trippatternstop" VALUES (188, 4743.8743058033624, 30, 96, 8, 180, 59);
INSERT INTO "trippatternstop" VALUES (189, 5094.8934449366279, 30, 42, 9, 180, 60);
INSERT INTO "trippatternstop" VALUES (190, 6416.2303509720787, 30, 159, 10, 180, 133);
INSERT INTO "trippatternstop" VALUES (91, 0, 30, 0, 1, 90, 64);
INSERT INTO "trippatternstop" VALUES (396, 0, 30, 0, 1, 395, 122);
INSERT INTO "trippatternstop" VALUES (398, 1040.2881795110625, 30, 76, 3, 395, 118);
INSERT INTO "trippatternstop" VALUES (399, 1764.4113487388699, 30, 104, 4, 395, 329);
INSERT INTO "trippatternstop" VALUES (400, 2254.4310558978727, 30, 71, 5, 395, 328);
INSERT INTO "trippatternstop" VALUES (181, 0.99941161986264304, 30, 0, 1, 180, 52);
INSERT INTO "trippatternstop" VALUES (178, 10051.205435060552, 30, 68, 13, 164, 52);
INSERT INTO "trippatternstop" VALUES (342, 0.54473214187404051, 30, 0, 1, 341, 314);
INSERT INTO "trippatternstop" VALUES (343, 524.1267099164088, 30, 75, 2, 341, 316);
INSERT INTO "trippatternstop" VALUES (360, 0, 30, 0, 1, 359, 64);
INSERT INTO "trippatternstop" VALUES (344, 905.64146052057583, 30, 55, 3, 341, 319);
INSERT INTO "trippatternstop" VALUES (345, 1635.3460239680862, 30, 105, 4, 341, 322);
INSERT INTO "trippatternstop" VALUES (346, 2393.7201708671928, 30, 109, 5, 341, 323);
INSERT INTO "trippatternstop" VALUES (347, 2956.8442295469945, 30, 81, 6, 341, 325);
INSERT INTO "trippatternstop" VALUES (348, 3449.2019756764694, 30, 71, 7, 341, 327);
INSERT INTO "trippatternstop" VALUES (349, 4063.2981749009377, 30, 88, 8, 341, 57);
INSERT INTO "trippatternstop" VALUES (350, 4669.7368506650673, 30, 87, 9, 341, 58);
INSERT INTO "trippatternstop" VALUES (397, 512.38320365598065, 30, 74, 2, 395, 468);
INSERT INTO "trippatternstop" VALUES (191, 7463.0680158659816, 30, 126, 11, 180, 130);
INSERT INTO "trippatternstop" VALUES (192, 8056.9866866688681, 30, 71, 12, 180, 128);
INSERT INTO "trippatternstop" VALUES (193, 9567.4682706388994, 30, 181, 13, 180, 126);
INSERT INTO "trippatternstop" VALUES (194, 10306.730266355738, 30, 89, 14, 180, 124);
INSERT INTO "trippatternstop" VALUES (381, 0.56143315029071561, 30, 0, 1, 380, 314);
INSERT INTO "trippatternstop" VALUES (382, 525.38448071097605, 30, 76, 2, 380, 316);
INSERT INTO "trippatternstop" VALUES (383, 904.16185400936502, 30, 55, 3, 380, 319);
INSERT INTO "trippatternstop" VALUES (384, 1635.4867234386761, 30, 105, 4, 380, 322);
INSERT INTO "trippatternstop" VALUES (385, 2393.4160367897857, 30, 109, 5, 380, 323);
INSERT INTO "trippatternstop" VALUES (386, 2956.5823977742989, 30, 81, 6, 380, 325);
INSERT INTO "trippatternstop" VALUES (67, 517.04100861857444, 30, 74, 2, 65, 53);
INSERT INTO "trippatternstop" VALUES (93, 601.24396535592734, 30, 36, 3, 90, 70);
INSERT INTO "trippatternstop" VALUES (154, 3045.551677121342, 30, 108, 6, 148, 77);
INSERT INTO "trippatternstop" VALUES (151, 1039.8724664273027, 30, 76, 3, 148, 118);
INSERT INTO "trippatternstop" VALUES (92, 342.25931794120794, 30, 50, 2, 90, 69);
INSERT INTO "trippatternstop" VALUES (94, 2508.1940631600028, 30, 274, 4, 90, 71);
INSERT INTO "trippatternstop" VALUES (95, 3597.1979745216463, 30, 157, 5, 90, 72);
INSERT INTO "trippatternstop" VALUES (96, 3981.4978071386827, 30, 55, 6, 90, 73);
INSERT INTO "trippatternstop" VALUES (152, 1806.5304433951394, 30, 110, 4, 148, 75);
INSERT INTO "trippatternstop" VALUES (559, 592.89295552316935, 30, 33, 3, 556, 433);
INSERT INTO "trippatternstop" VALUES (137, 1195.6636483304078, 30, 69, 3, 134, 116);
INSERT INTO "trippatternstop" VALUES (156, 4925.2681837469509, 30, 153, 8, 148, 79);
INSERT INTO "trippatternstop" VALUES (155, 3864.238923724879, 30, 118, 7, 148, 78);
INSERT INTO "trippatternstop" VALUES (97, 4736.4478214267529, 30, 109, 7, 90, 74);
INSERT INTO "trippatternstop" VALUES (98, 5025.364600099042, 30, 42, 8, 90, 75);
INSERT INTO "trippatternstop" VALUES (99, 5511.362052339512, 30, 70, 9, 90, 76);
INSERT INTO "trippatternstop" VALUES (157, 5338.1731329856057, 30, 81, 9, 148, 52);
INSERT INTO "trippatternstop" VALUES (100, 6264.4073681302816, 30, 108, 10, 90, 77);
INSERT INTO "trippatternstop" VALUES (101, 7083.067004776155, 30, 118, 11, 90, 78);
INSERT INTO "trippatternstop" VALUES (153, 2292.7075963215975, 30, 70, 5, 148, 76);
INSERT INTO "trippatternstop" VALUES (560, 1044.1158922338284, 30, 54, 4, 556, 430);
INSERT INTO "trippatternstop" VALUES (561, 1460.0706491897333, 30, 50, 5, 556, 428);
INSERT INTO "trippatternstop" VALUES (562, 2231.672538936718, 30, 93, 6, 556, 54);
INSERT INTO "trippatternstop" VALUES (150, 509.69058992651105, 30, 74, 2, 148, 468);
INSERT INTO "trippatternstop" VALUES (135, 1.326261476897828, 30, 0, 1, 134, 52);
INSERT INTO "trippatternstop" VALUES (138, 2589.6689139114551, 30, 201, 4, 134, 54);
INSERT INTO "trippatternstop" VALUES (139, 3088.2479919596553, 30, 72, 5, 134, 55);
INSERT INTO "trippatternstop" VALUES (140, 3508.6511155394501, 30, 61, 6, 134, 56);
INSERT INTO "trippatternstop" VALUES (141, 4204.648939601595, 30, 100, 7, 134, 57);
INSERT INTO "trippatternstop" VALUES (142, 4811.0638378966214, 30, 87, 8, 134, 58);
INSERT INTO "trippatternstop" VALUES (143, 5362.0105445741156, 30, 79, 9, 134, 117);
INSERT INTO "trippatternstop" VALUES (144, 5972.8364795398347, 30, 88, 10, 134, 119);
INSERT INTO "trippatternstop" VALUES (145, 6271.7503553951547, 30, 43, 11, 134, 120);
INSERT INTO "trippatternstop" VALUES (146, 6515.109450124015, 30, 35, 12, 134, 121);
INSERT INTO "trippatternstop" VALUES (387, 3449.0177367323945, 30, 71, 7, 380, 327);
INSERT INTO "trippatternstop" VALUES (388, 4063.5221460967014, 30, 88, 8, 380, 57);
INSERT INTO "trippatternstop" VALUES (389, 4670.0385075570721, 30, 87, 9, 380, 58);
INSERT INTO "trippatternstop" VALUES (390, 5220.5118915449648, 30, 79, 10, 380, 117);
INSERT INTO "trippatternstop" VALUES (391, 5831.2815264849614, 30, 88, 11, 380, 119);
INSERT INTO "trippatternstop" VALUES (392, 6130.1646524538655, 30, 43, 12, 380, 120);
INSERT INTO "trippatternstop" VALUES (393, 6373.5475356222405, 30, 35, 13, 380, 121);
INSERT INTO "trippatternstop" VALUES (618, 4981.2476296745945, 30, 36, 8, 610, 329);
INSERT INTO "trippatternstop" VALUES (595, 0, 30, 0, 1, 594, 456);
INSERT INTO "trippatternstop" VALUES (596, 880.83468423601846, 30, 127, 2, 594, 458);
INSERT INTO "trippatternstop" VALUES (597, 1269.5746078431503, 30, 56, 3, 594, 459);
INSERT INTO "trippatternstop" VALUES (598, 2472.6908444575802, 30, 173, 4, 594, 323);
INSERT INTO "trippatternstop" VALUES (374, 9569.4851009312679, 30, 70, 15, 359, 315);
INSERT INTO "trippatternstop" VALUES (364, 3593.7179622632025, 30, 157, 5, 359, 72);
INSERT INTO "trippatternstop" VALUES (368, 5471.7079170152347, 30, 71, 9, 359, 328);
INSERT INTO "trippatternstop" VALUES (369, 6383.3267016290265, 30, 131, 10, 359, 326);
INSERT INTO "trippatternstop" VALUES (370, 7043.6577999873634, 30, 95, 11, 359, 324);
INSERT INTO "trippatternstop" VALUES (356, 9811.1657294782508, 30, 40, 14, 341, 63);
INSERT INTO "trippatternstop" VALUES (371, 7964.1966859200666, 30, 133, 12, 359, 321);
INSERT INTO "trippatternstop" VALUES (401, 3166.0944740414147, 30, 131, 6, 395, 326);
INSERT INTO "trippatternstop" VALUES (402, 3826.5852266709635, 30, 95, 7, 395, 324);
INSERT INTO "trippatternstop" VALUES (403, 4745.1644890985717, 30, 132, 8, 395, 321);
INSERT INTO "trippatternstop" VALUES (404, 5518.1320585645535, 30, 111, 9, 395, 318);
INSERT INTO "trippatternstop" VALUES (405, 5863.1004827529059, 30, 50, 10, 395, 317);
INSERT INTO "trippatternstop" VALUES (406, 6348.5876049435174, 30, 70, 11, 395, 315);
INSERT INTO "trippatternstop" VALUES (357, 10131.962154906294, 30, 46, 15, 341, 64);
INSERT INTO "trippatternstop" VALUES (372, 8739.0239916348546, 30, 112, 13, 359, 318);
INSERT INTO "trippatternstop" VALUES (373, 9086.7810221823147, 30, 50, 14, 359, 317);
INSERT INTO "trippatternstop" VALUES (362, 599.51758364137686, 30, 36, 3, 359, 70);
INSERT INTO "trippatternstop" VALUES (599, 3035.8302579275291, 30, 81, 5, 594, 325);
INSERT INTO "trippatternstop" VALUES (600, 3528.2562954386422, 30, 71, 6, 594, 327);
INSERT INTO "trippatternstop" VALUES (601, 4141.5176358702074, 30, 88, 7, 594, 57);
INSERT INTO "trippatternstop" VALUES (602, 4748.0590238419836, 30, 87, 8, 594, 58);
INSERT INTO "trippatternstop" VALUES (363, 2502.235260705032, 30, 274, 4, 359, 71);
INSERT INTO "trippatternstop" VALUES (1060, 10216.060051480699, 30, 81, 16, 1044, 469);
INSERT INTO "trippatternstop" VALUES (619, 5471.4953398752868, 30, 71, 9, 610, 328);
INSERT INTO "trippatternstop" VALUES (603, 5549.1771805989183, 30, 115, 9, 594, 59);
INSERT INTO "trippatternstop" VALUES (604, 5895.5168798771183, 30, 50, 10, 594, 352);
INSERT INTO "trippatternstop" VALUES (620, 6382.2442955798133, 30, 131, 10, 610, 326);
INSERT INTO "trippatternstop" VALUES (605, 7709.1794812876287, 30, 261, 11, 594, 61);
INSERT INTO "trippatternstop" VALUES (606, 9603.0976857760688, 30, 273, 12, 594, 62);
INSERT INTO "trippatternstop" VALUES (607, 9883.31115099612, 30, 40, 13, 594, 63);
INSERT INTO "trippatternstop" VALUES (608, 10283.880713884526, 30, 58, 14, 594, 64);
INSERT INTO "trippatternstop" VALUES (621, 7042.6597817623115, 30, 95, 11, 610, 324);
INSERT INTO "trippatternstop" VALUES (622, 8360.9914584910566, 30, 190, 12, 610, 460);
INSERT INTO "trippatternstop" VALUES (623, 8815.0347745246581, 30, 65, 13, 610, 457);
INSERT INTO "trippatternstop" VALUES (624, 9666.4838020574389, 30, 123, 14, 610, 456);
INSERT INTO "trippatternstop" VALUES (611, 0, 30, 0, 1, 610, 64);
INSERT INTO "trippatternstop" VALUES (612, 341.64567087170713, 30, 49, 2, 610, 69);
INSERT INTO "trippatternstop" VALUES (613, 599.70033877344531, 30, 37, 3, 610, 70);
INSERT INTO "trippatternstop" VALUES (614, 2504.0810484306171, 30, 274, 4, 610, 71);
INSERT INTO "trippatternstop" VALUES (615, 3594.5438834627475, 30, 157, 5, 610, 72);
INSERT INTO "trippatternstop" VALUES (616, 3979.5972280866094, 30, 55, 6, 610, 73);
INSERT INTO "trippatternstop" VALUES (617, 4734.1853240699875, 30, 109, 7, 610, 74);
INSERT INTO "trippatternstop" VALUES (1085, 120.9233389218215, 30, 15, 2, 1083, 133);
INSERT INTO "trippatternstop" VALUES (1084, 0, 30, 0, 1, 1083, 489);
INSERT INTO "trippatternstop" VALUES (1141, 1510.5751101269591, 30, 13, 3, 1138, 474);
INSERT INTO "trippatternstop" VALUES (1086, 1167.6108427431416, 30, 126, 3, 1083, 130);
INSERT INTO "trippatternstop" VALUES (1087, 1761.6323557332285, 30, 71, 4, 1083, 128);
INSERT INTO "trippatternstop" VALUES (1088, 3271.9974704397259, 30, 181, 5, 1083, 126);
INSERT INTO "trippatternstop" VALUES (1099, 9287.5862049671996, 30, 54, 15, 1083, 453);
INSERT INTO "trippatternstop" VALUES (1100, 9801.2073897102237, 30, 62, 16, 1083, 449);
INSERT INTO "trippatternstop" VALUES (1101, 10076.945457956186, 30, 33, 17, 1083, 447);
INSERT INTO "trippatternstop" VALUES (1102, 10880.065412979569, 30, 96, 18, 1083, 54);
INSERT INTO "trippatternstop" VALUES (1139, 0, 30, 0, 1, 1138, 124);
INSERT INTO "trippatternstop" VALUES (1140, 1398.1305566007311, 30, 168, 2, 1138, 476);
INSERT INTO "trippatternstop" VALUES (1103, 11378.709537302913, 30, 60, 19, 1083, 55);
INSERT INTO "trippatternstop" VALUES (1142, 1869.7720572449816, 30, 43, 4, 1138, 472);
INSERT INTO "trippatternstop" VALUES (1104, 11799.200544456158, 30, 50, 20, 1083, 56);
INSERT INTO "trippatternstop" VALUES (1105, 12494.995217866684, 30, 83, 21, 1083, 57);
INSERT INTO "trippatternstop" VALUES (1143, 2511.5486188224536, 30, 77, 5, 1138, 322);
INSERT INTO "trippatternstop" VALUES (648, 814.79797456988729, 30, 117, 2, 643, 338);
INSERT INTO "trippatternstop" VALUES (649, 1236.5534861569595, 30, 61, 3, 643, 337);
INSERT INTO "trippatternstop" VALUES (650, 2122.4904830808509, 30, 128, 4, 643, 122);
INSERT INTO "trippatternstop" VALUES (651, 2632.2300134612133, 30, 73, 5, 643, 468);
INSERT INTO "trippatternstop" VALUES (652, 3162.1638396692629, 30, 76, 6, 643, 118);
INSERT INTO "trippatternstop" VALUES (653, 3885.7292908701979, 30, 104, 7, 643, 329);
INSERT INTO "trippatternstop" VALUES (1053, 5867.1278523725259, 30, 43, 9, 1044, 472);
INSERT INTO "trippatternstop" VALUES (654, 4375.7845382856331, 30, 71, 8, 643, 328);
INSERT INTO "trippatternstop" VALUES (655, 5285.9065679135701, 30, 131, 9, 643, 326);
INSERT INTO "trippatternstop" VALUES (656, 5946.4323322317086, 30, 95, 10, 643, 324);
INSERT INTO "trippatternstop" VALUES (657, 7267.580730232944, 30, 190, 11, 643, 460);
INSERT INTO "trippatternstop" VALUES (1072, 4964.4593366615936, 30, 15, 10, 1062, 475);
INSERT INTO "trippatternstop" VALUES (1050, 3994.7322292493864, 30, 87, 6, 1044, 124);
INSERT INTO "trippatternstop" VALUES (1073, 6460.0006233368422, 30, 179, 11, 1062, 125);
INSERT INTO "trippatternstop" VALUES (1074, 7169.808836767279, 30, 85, 12, 1062, 127);
INSERT INTO "trippatternstop" VALUES (1051, 5395.6358046139394, 30, 168, 7, 1044, 476);
INSERT INTO "trippatternstop" VALUES (1055, 7266.6721372287693, 30, 91, 11, 1044, 323);
INSERT INTO "trippatternstop" VALUES (1054, 6508.9827121326452, 30, 77, 10, 1044, 322);
INSERT INTO "trippatternstop" VALUES (557, 1.0172733000105751, 30, 0, 1, 556, 435);
INSERT INTO "trippatternstop" VALUES (1056, 7829.9924039002672, 30, 68, 12, 1044, 325);
INSERT INTO "trippatternstop" VALUES (1045, 0, 30, 0, 1, 1044, 489);
INSERT INTO "trippatternstop" VALUES (658, 7644.9018759946866, 30, 54, 12, 643, 462);
INSERT INTO "trippatternstop" VALUES (659, 7948.9421987977385, 30, 44, 13, 643, 461);
INSERT INTO "trippatternstop" VALUES (628, 4.1246156516572494, 30, 1, 1, 627, 461);
INSERT INTO "trippatternstop" VALUES (629, 462.23864749493168, 30, 66, 2, 627, 459);
INSERT INTO "trippatternstop" VALUES (630, 1664.4395036054459, 30, 173, 3, 627, 323);
INSERT INTO "trippatternstop" VALUES (631, 2227.4199195420842, 30, 81, 4, 627, 325);
INSERT INTO "trippatternstop" VALUES (632, 2720.0821920233943, 30, 71, 5, 627, 327);
INSERT INTO "trippatternstop" VALUES (633, 3333.1238301672329, 30, 88, 6, 627, 57);
INSERT INTO "trippatternstop" VALUES (634, 3939.4204581868057, 30, 87, 7, 627, 58);
INSERT INTO "trippatternstop" VALUES (635, 4490.3069078208391, 30, 79, 8, 627, 117);
INSERT INTO "trippatternstop" VALUES (636, 5101.363214598513, 30, 88, 9, 627, 119);
INSERT INTO "trippatternstop" VALUES (637, 5399.7028888479335, 30, 43, 10, 627, 120);
INSERT INTO "trippatternstop" VALUES (1057, 8322.4794718397698, 30, 59, 13, 1044, 327);
INSERT INTO "trippatternstop" VALUES (638, 5642.8799231529401, 30, 35, 11, 627, 121);
INSERT INTO "trippatternstop" VALUES (639, 6420.7371605236149, 30, 112, 12, 627, 336);
INSERT INTO "trippatternstop" VALUES (640, 7013.7870205204454, 30, 85, 13, 627, 339);
INSERT INTO "trippatternstop" VALUES (641, 7803.5729735624745, 30, 114, 14, 627, 340);
INSERT INTO "trippatternstop" VALUES (1058, 8935.7867941989298, 30, 74, 14, 1044, 57);
INSERT INTO "trippatternstop" VALUES (1059, 9542.3658074195773, 30, 73, 15, 1044, 58);
INSERT INTO "trippatternstop" VALUES (647, 2.4391787729387628, 30, 0, 1, 643, 340);
INSERT INTO "trippatternstop" VALUES (1048, 1760.9014945415254, 30, 71, 4, 1044, 128);
INSERT INTO "trippatternstop" VALUES (1089, 3995.4079352531153, 30, 87, 6, 1083, 124);
INSERT INTO "trippatternstop" VALUES (1063, 3.0301395088642855, 30, 0, 1, 1062, 469);
INSERT INTO "trippatternstop" VALUES (1075, 8637.9979972644651, 30, 176, 13, 1062, 129);
INSERT INTO "trippatternstop" VALUES (1076, 9340.431333735376, 30, 84, 14, 1062, 131);
INSERT INTO "trippatternstop" VALUES (1077, 10267.940283413467, 30, 111, 15, 1062, 489);
INSERT INTO "trippatternstop" VALUES (1078, 10399.609754114335, 30, 16, 16, 1062, 133);
INSERT INTO "trippatternstop" VALUES (1046, 120.23009009954313, 30, 14, 2, 1044, 133);
INSERT INTO "trippatternstop" VALUES (1090, 5395.6962843868059, 30, 168, 7, 1083, 476);
INSERT INTO "trippatternstop" VALUES (1052, 5507.6433794749883, 30, 13, 8, 1044, 474);
INSERT INTO "trippatternstop" VALUES (1047, 1166.434629700198, 30, 126, 3, 1044, 130);
INSERT INTO "trippatternstop" VALUES (1049, 3270.8092277329401, 30, 181, 5, 1044, 126);
INSERT INTO "trippatternstop" VALUES (1064, 613.64345716610501, 30, 73, 2, 1062, 74);
INSERT INTO "trippatternstop" VALUES (1065, 861.02641372104142, 30, 30, 3, 1062, 329);
INSERT INTO "trippatternstop" VALUES (1066, 1351.0650946614328, 30, 59, 4, 1062, 328);
INSERT INTO "trippatternstop" VALUES (1067, 2261.8410310053646, 30, 109, 5, 1062, 326);
INSERT INTO "trippatternstop" VALUES (1068, 2922.3122879941984, 30, 79, 6, 1062, 324);
INSERT INTO "trippatternstop" VALUES (1069, 3842.0844889698396, 30, 110, 7, 1062, 321);
INSERT INTO "trippatternstop" VALUES (1070, 4480.2082871447692, 30, 77, 8, 1062, 471);
INSERT INTO "trippatternstop" VALUES (1091, 5507.3534235282914, 30, 13, 8, 1083, 474);
INSERT INTO "trippatternstop" VALUES (1071, 4838.9469850817104, 30, 43, 9, 1062, 473);
INSERT INTO "trippatternstop" VALUES (1092, 5866.9027281345152, 30, 43, 9, 1083, 472);
INSERT INTO "trippatternstop" VALUES (1093, 6508.7093329086274, 30, 77, 10, 1083, 322);
INSERT INTO "trippatternstop" VALUES (1094, 7506.9964676543859, 30, 120, 11, 1083, 427);
INSERT INTO "trippatternstop" VALUES (1095, 7920.616378132404, 30, 50, 12, 1083, 429);
INSERT INTO "trippatternstop" VALUES (1096, 8328.4192541712036, 30, 49, 13, 1083, 439);
INSERT INTO "trippatternstop" VALUES (1144, 3269.6224544111355, 30, 91, 6, 1138, 323);
INSERT INTO "trippatternstop" VALUES (1097, 8836.4535495420278, 30, 61, 14, 1083, 436);
INSERT INTO "trippatternstop" VALUES (1106, 13101.301214556881, 30, 73, 22, 1083, 58);
INSERT INTO "trippatternstop" VALUES (1107, 13775.744839642688, 30, 81, 23, 1083, 469);
INSERT INTO "trippatternstop" VALUES (1145, 3832.8832461633833, 30, 68, 7, 1138, 325);
INSERT INTO "trippatternstop" VALUES (1146, 4325.2064392798984, 30, 59, 8, 1138, 327);
INSERT INTO "trippatternstop" VALUES (1147, 4938.6137821905049, 30, 74, 9, 1138, 57);
INSERT INTO "trippatternstop" VALUES (1148, 5544.9702336501032, 30, 73, 10, 1138, 58);
INSERT INTO "trippatternstop" VALUES (1149, 6346.3606731504824, 30, 96, 11, 1138, 59);
INSERT INTO "trippatternstop" VALUES (1150, 6692.8331553970029, 30, 42, 12, 1138, 352);
INSERT INTO "trippatternstop" VALUES (1165, 4324.3011174376707, 30, 59, 8, 1157, 327);
INSERT INTO "trippatternstop" VALUES (1172, 10682.921719761564, 30, 34, 15, 1157, 63);
INSERT INTO "trippatternstop" VALUES (1159, 1397.5703938624083, 30, 168, 2, 1157, 476);
INSERT INTO "trippatternstop" VALUES (1166, 4937.5689087933379, 30, 74, 9, 1157, 57);
INSERT INTO "trippatternstop" VALUES (1161, 1869.216310979529, 30, 43, 4, 1157, 472);
INSERT INTO "trippatternstop" VALUES (1167, 5543.9446504143707, 30, 73, 10, 1157, 58);
INSERT INTO "trippatternstop" VALUES (1168, 6345.8641198817568, 30, 96, 11, 1157, 59);
INSERT INTO "trippatternstop" VALUES (1160, 1509.6964735018125, 30, 13, 3, 1157, 474);
INSERT INTO "trippatternstop" VALUES (1110, 4.1994107652066024, 30, 1, 1, 1109, 469);
INSERT INTO "trippatternstop" VALUES (1111, 616.18451404465918, 30, 73, 2, 1109, 74);
INSERT INTO "trippatternstop" VALUES (1112, 907.54233100836996, 30, 35, 3, 1109, 75);
INSERT INTO "trippatternstop" VALUES (1113, 1393.481054433563, 30, 58, 4, 1109, 76);
INSERT INTO "trippatternstop" VALUES (1114, 2146.6608472980242, 30, 90, 5, 1109, 77);
INSERT INTO "trippatternstop" VALUES (1115, 2965.4207398023227, 30, 98, 6, 1109, 78);
INSERT INTO "trippatternstop" VALUES (1116, 3753.9319758229085, 30, 95, 7, 1109, 446);
INSERT INTO "trippatternstop" VALUES (1117, 4066.590184110717, 30, 38, 8, 1109, 448);
INSERT INTO "trippatternstop" VALUES (1118, 4617.0570756802963, 30, 66, 9, 1109, 452);
INSERT INTO "trippatternstop" VALUES (1119, 5095.551317955953, 30, 57, 10, 1109, 437);
INSERT INTO "trippatternstop" VALUES (1120, 5570.5882773713392, 30, 57, 11, 1109, 440);
INSERT INTO "trippatternstop" VALUES (1121, 5974.0759172950884, 30, 48, 12, 1109, 430);
INSERT INTO "trippatternstop" VALUES (1122, 6390.1659891620711, 30, 50, 13, 1109, 428);
INSERT INTO "trippatternstop" VALUES (1123, 7236.4706310053725, 30, 102, 14, 1109, 321);
INSERT INTO "trippatternstop" VALUES (1169, 6691.8828604674854, 30, 42, 12, 1157, 352);
INSERT INTO "trippatternstop" VALUES (1124, 7874.6151070709984, 30, 77, 15, 1109, 471);
INSERT INTO "trippatternstop" VALUES (1125, 8233.3450788212394, 30, 43, 16, 1109, 473);
INSERT INTO "trippatternstop" VALUES (1126, 8359.2135588129022, 30, 15, 17, 1109, 475);
INSERT INTO "trippatternstop" VALUES (1127, 9853.66622250201, 30, 179, 18, 1109, 125);
INSERT INTO "trippatternstop" VALUES (1128, 10563.317392802681, 30, 85, 19, 1109, 127);
INSERT INTO "trippatternstop" VALUES (1129, 12031.646921778281, 30, 176, 20, 1109, 129);
INSERT INTO "trippatternstop" VALUES (1130, 12732.813706569081, 30, 84, 21, 1109, 131);
INSERT INTO "trippatternstop" VALUES (1131, 13662.090472214535, 30, 112, 22, 1109, 489);
INSERT INTO "trippatternstop" VALUES (1132, 13794.545291081036, 30, 16, 23, 1109, 133);
INSERT INTO "trippatternstop" VALUES (1171, 10402.726831217456, 30, 228, 14, 1157, 62);
INSERT INTO "trippatternstop" VALUES (1173, 11001.72336136336, 30, 38, 16, 1157, 64);
INSERT INTO "trippatternstop" VALUES (580, 14285.221535156819, 30, 64, 24, 556, 118);
INSERT INTO "trippatternstop" VALUES (581, 4322.587949766249, 30, 90, 25, 556, 75);
INSERT INTO "trippatternstop" VALUES (582, 15537.810143752822, 30, 90, 26, 556, 76);
INSERT INTO "trippatternstop" VALUES (579, 13755.225870114598, 30, 61, 23, 556, 468);
INSERT INTO "trippatternstop" VALUES (1933, 0.23085023544193065, 30, 0, 1, 1917, 1605);
INSERT INTO "trippatternstop" VALUES (1162, 2511.0232186286034, 30, 77, 5, 1157, 322);
INSERT INTO "trippatternstop" VALUES (1170, 8506.1564409129442, 30, 218, 13, 1157, 61);
INSERT INTO "trippatternstop" VALUES (1163, 3268.739092625131, 30, 91, 6, 1157, 323);
INSERT INTO "trippatternstop" VALUES (1164, 3831.8332579824155, 30, 68, 7, 1157, 325);
INSERT INTO "trippatternstop" VALUES (1151, 8509.7023080835788, 30, 218, 13, 1138, 61);
INSERT INTO "trippatternstop" VALUES (1152, 10404.60585621242, 30, 227, 14, 1138, 62);
INSERT INTO "trippatternstop" VALUES (1153, 10685.298218378604, 30, 34, 15, 1138, 63);
INSERT INTO "trippatternstop" VALUES (1154, 11009.700966968299, 30, 39, 16, 1138, 64);
INSERT INTO "trippatternstop" VALUES (1158, 0, 30, 0, 1, 1157, 124);
INSERT INTO "trippatternstop" VALUES (1195, 0, 30, 0, 1, 1194, 1137);
INSERT INTO "trippatternstop" VALUES (1196, 973.46886365808905, 30, 117, 2, 1194, 500);
INSERT INTO "trippatternstop" VALUES (1197, 2889.1300641223502, 30, 230, 3, 1194, 64);
INSERT INTO "trippatternstop" VALUES (87, 8802.7252898134193, 30, 274, 11, 65, 62);
INSERT INTO "trippatternstop" VALUES (84, 4744.7493989382419, 30, 116, 8, 65, 59);
INSERT INTO "trippatternstop" VALUES (88, 9082.9774011374739, 30, 40, 12, 65, 63);
INSERT INTO "trippatternstop" VALUES (85, 5091.5645383626716, 30, 51, 9, 65, 352);
INSERT INTO "trippatternstop" VALUES (1198, 3230.9946740572077, 30, 41, 4, 1194, 69);
INSERT INTO "trippatternstop" VALUES (89, 9403.9538204963028, 30, 73, 13, 65, 64);
INSERT INTO "trippatternstop" VALUES (1199, 3489.2306205165605, 30, 31, 5, 1194, 70);
INSERT INTO "trippatternstop" VALUES (1200, 5395.9372981060869, 30, 229, 6, 1194, 71);
INSERT INTO "trippatternstop" VALUES (1201, 6484.4904307967863, 30, 131, 7, 1194, 72);
INSERT INTO "trippatternstop" VALUES (102, 8142.7805994819646, 30, 153, 12, 90, 79);
INSERT INTO "trippatternstop" VALUES (103, 8705.0710536509359, 30, 82, 13, 90, 52);
INSERT INTO "trippatternstop" VALUES (68, 1720.3353727525396, 30, 172, 3, 65, 54);
INSERT INTO "trippatternstop" VALUES (82, 3335.4779379852889, 30, 100, 6, 65, 57);
INSERT INTO "trippatternstop" VALUES (81, 2639.3593632328539, 30, 61, 5, 65, 56);
INSERT INTO "trippatternstop" VALUES (80, 2218.9539727186957, 30, 72, 4, 65, 55);
INSERT INTO "trippatternstop" VALUES (86, 6905.7043706259838, 30, 261, 10, 65, 61);
INSERT INTO "trippatternstop" VALUES (1202, 6868.9630257832614, 30, 46, 8, 1194, 73);
INSERT INTO "trippatternstop" VALUES (1203, 7624.4981317064894, 30, 91, 9, 1194, 74);
INSERT INTO "trippatternstop" VALUES (1204, 7871.9215608577688, 30, 30, 10, 1194, 329);
INSERT INTO "trippatternstop" VALUES (1205, 8361.7840230901911, 30, 59, 11, 1194, 328);
INSERT INTO "trippatternstop" VALUES (1206, 9272.9183489184288, 30, 109, 12, 1194, 326);
INSERT INTO "trippatternstop" VALUES (1207, 9933.3825127372929, 30, 79, 13, 1194, 324);
INSERT INTO "trippatternstop" VALUES (1622, 1.1803854307022841, 30, 0, 1, 1621, 1604);
INSERT INTO "trippatternstop" VALUES (1208, 10851.855497500734, 30, 110, 14, 1194, 321);
INSERT INTO "trippatternstop" VALUES (1209, 11489.989518629927, 30, 77, 15, 1194, 471);
INSERT INTO "trippatternstop" VALUES (1623, 552.83557270404117, 30, 66, 2, 1621, 1603);
INSERT INTO "trippatternstop" VALUES (1607, 0, 30, 0, 1, 1606, 1605);
INSERT INTO "trippatternstop" VALUES (1210, 11848.431711881592, 30, 43, 16, 1194, 473);
INSERT INTO "trippatternstop" VALUES (1211, 11974.656814638431, 30, 15, 17, 1194, 475);
INSERT INTO "trippatternstop" VALUES (1212, 13491.392717470042, 30, 182, 18, 1194, 125);
INSERT INTO "trippatternstop" VALUES (1608, 747.42266353238369, 30, 90, 2, 1606, 472);
INSERT INTO "trippatternstop" VALUES (1609, 1389.1904611035811, 30, 77, 3, 1606, 322);
INSERT INTO "trippatternstop" VALUES (1610, 2146.2211763678224, 30, 91, 4, 1606, 323);
INSERT INTO "trippatternstop" VALUES (1177, 0, 30, 0, 1, 1176, 64);
INSERT INTO "trippatternstop" VALUES (1178, 340.57025258668006, 30, 41, 2, 1176, 69);
INSERT INTO "trippatternstop" VALUES (1179, 599.04017474017837, 30, 31, 3, 1176, 70);
INSERT INTO "trippatternstop" VALUES (83, 3941.8750062039285, 30, 87, 7, 65, 58);
INSERT INTO "trippatternstop" VALUES (1611, 2709.4104477001774, 30, 68, 5, 1606, 325);
INSERT INTO "trippatternstop" VALUES (1180, 2422.7888438967998, 30, 219, 4, 1176, 71);
INSERT INTO "trippatternstop" VALUES (1181, 3493.5427677997263, 30, 128, 5, 1176, 72);
INSERT INTO "trippatternstop" VALUES (1182, 3875.1274470395874, 30, 46, 6, 1176, 73);
INSERT INTO "trippatternstop" VALUES (1183, 4626.6429586332051, 30, 90, 7, 1176, 74);
INSERT INTO "trippatternstop" VALUES (1184, 4869.8311481901228, 30, 29, 8, 1176, 329);
INSERT INTO "trippatternstop" VALUES (1185, 5359.0377964291738, 30, 59, 9, 1176, 328);
INSERT INTO "trippatternstop" VALUES (1186, 6271.9522278019722, 30, 110, 10, 1176, 326);
INSERT INTO "trippatternstop" VALUES (1187, 6933.0164372356267, 30, 79, 11, 1176, 324);
INSERT INTO "trippatternstop" VALUES (1188, 7867.0975490032879, 30, 112, 12, 1176, 321);
INSERT INTO "trippatternstop" VALUES (1189, 8505.2485566844043, 30, 77, 13, 1176, 471);
INSERT INTO "trippatternstop" VALUES (1190, 8863.7208125676007, 30, 43, 14, 1176, 473);
INSERT INTO "trippatternstop" VALUES (1191, 8985.3555775915829, 30, 15, 15, 1176, 475);
INSERT INTO "trippatternstop" VALUES (1192, 10498.869405495512, 30, 182, 16, 1176, 125);
INSERT INTO "trippatternstop" VALUES (1174, 12992.960498281858, 30, 239, 17, 1157, 499);
INSERT INTO "trippatternstop" VALUES (1175, 13891.312492713407, 30, 108, 18, 1157, 1137);
INSERT INTO "trippatternstop" VALUES (136, 718.90693613748419, 30, 103, 2, 134, 115);
INSERT INTO "trippatternstop" VALUES (1612, 3201.8712646271165, 30, 59, 6, 1606, 327);
INSERT INTO "trippatternstop" VALUES (1613, 3693.3921933590041, 30, 59, 7, 1606, 465);
INSERT INTO "trippatternstop" VALUES (1624, 1479.0739240943074, 30, 111, 3, 1621, 1601);
INSERT INTO "trippatternstop" VALUES (1625, 2872.3472861378341, 30, 167, 4, 1621, 1597);
INSERT INTO "trippatternstop" VALUES (1626, 3491.1398890811561, 30, 74, 5, 1621, 1594);
INSERT INTO "trippatternstop" VALUES (1627, 4505.0135583352667, 30, 122, 6, 1621, 54);
INSERT INTO "trippatternstop" VALUES (1628, 5003.7452863476537, 30, 60, 7, 1621, 55);
INSERT INTO "trippatternstop" VALUES (1614, 4527.6587007766821, 30, 100, 8, 1606, 77);
INSERT INTO "trippatternstop" VALUES (1615, 5346.4546473126275, 30, 98, 9, 1606, 78);
INSERT INTO "trippatternstop" VALUES (1629, 5424.2070336927127, 30, 50, 8, 1621, 56);
INSERT INTO "trippatternstop" VALUES (1630, 5989.9430163563375, 30, 68, 9, 1621, 466);
INSERT INTO "trippatternstop" VALUES (1616, 6100.8248688601225, 30, 91, 10, 1606, 1593);
INSERT INTO "trippatternstop" VALUES (1631, 6954.2518456823263, 30, 116, 10, 1621, 326);
INSERT INTO "trippatternstop" VALUES (1947, 24232.113118101101, 30, 57, 13, 1917, 1723);
INSERT INTO "trippatternstop" VALUES (1632, 7614.7757229078015, 30, 79, 11, 1621, 324);
INSERT INTO "trippatternstop" VALUES (1633, 8535.0241314538016, 30, 110, 12, 1621, 321);
INSERT INTO "trippatternstop" VALUES (1617, 6725.0093639722863, 30, 75, 11, 1606, 1596);
INSERT INTO "trippatternstop" VALUES (1618, 8095.4371134323783, 30, 164, 12, 1606, 1600);
INSERT INTO "trippatternstop" VALUES (1619, 9029.4413381516169, 30, 112, 13, 1606, 1602);
INSERT INTO "trippatternstop" VALUES (1620, 9593.3321465236622, 30, 68, 14, 1606, 1604);
INSERT INTO "trippatternstop" VALUES (1634, 9173.158067449127, 30, 77, 13, 1621, 471);
INSERT INTO "trippatternstop" VALUES (1635, 9354.271025430513, 30, 22, 14, 1621, 1605);
INSERT INTO "trippatternstop" VALUES (1948, 24933.932321158736, 30, 84, 14, 1917, 1721);
INSERT INTO "trippatternstop" VALUES (1949, 25862.19591309653, 30, 111, 15, 1917, 1725);
INSERT INTO "trippatternstop" VALUES (1918, 27245.783734816221, 30, 166, 16, 1917, 1732);
INSERT INTO "trippatternstop" VALUES (1665, 10789.55362851411, 30, 93, 20, 1644, 336);
INSERT INTO "trippatternstop" VALUES (1666, 11381.995128185468, 30, 71, 21, 1644, 339);
INSERT INTO "trippatternstop" VALUES (1667, 12169.662629526309, 30, 95, 22, 1644, 340);
INSERT INTO "trippatternstop" VALUES (1685, 10081.624997502669, 30, 90, 16, 1669, 321);
INSERT INTO "trippatternstop" VALUES (1686, 10719.726233995072, 30, 77, 17, 1669, 471);
INSERT INTO "trippatternstop" VALUES (1687, 11078.37138032584, 30, 43, 18, 1669, 473);
INSERT INTO "trippatternstop" VALUES (1688, 11204.300001740638, 30, 15, 19, 1669, 475);
INSERT INTO "trippatternstop" VALUES (1689, 12722.743513505513, 30, 182, 20, 1669, 125);
INSERT INTO "trippatternstop" VALUES (558, 317.18983078759203, 30, 38, 2, 556, 434);
INSERT INTO "trippatternstop" VALUES (563, 2730.5967593804289, 30, 60, 7, 556, 55);
INSERT INTO "trippatternstop" VALUES (568, 5599.0664789749717, 30, 41, 12, 556, 352);
INSERT INTO "trippatternstop" VALUES (565, 3847.1644709713896, 30, 84, 9, 556, 57);
INSERT INTO "trippatternstop" VALUES (576, 12284.457643307484, 30, 46, 20, 556, 334);
INSERT INTO "trippatternstop" VALUES (575, 11897.943157376816, 30, 175, 19, 556, 333);
INSERT INTO "trippatternstop" VALUES (1670, 0.15271640524953364, 30, 0, 1, 1669, 340);
INSERT INTO "trippatternstop" VALUES (1671, 816.7775537242245, 30, 98, 2, 1669, 338);
INSERT INTO "trippatternstop" VALUES (569, 7415.5545725961365, 30, 218, 13, 556, 61);
INSERT INTO "trippatternstop" VALUES (571, 9589.0497946318101, 30, 34, 15, 556, 63);
INSERT INTO "trippatternstop" VALUES (1672, 1237.3988111056876, 30, 50, 3, 1669, 337);
INSERT INTO "trippatternstop" VALUES (1673, 2124.9746510026616, 30, 107, 4, 1669, 122);
INSERT INTO "trippatternstop" VALUES (1674, 2634.563847308877, 30, 61, 5, 1669, 468);
INSERT INTO "trippatternstop" VALUES (1675, 3164.482443219084, 30, 64, 6, 1669, 118);
INSERT INTO "trippatternstop" VALUES (1676, 3931.3833355870679, 30, 92, 7, 1669, 75);
INSERT INTO "trippatternstop" VALUES (1677, 4417.0869116121294, 30, 58, 8, 1669, 76);
INSERT INTO "trippatternstop" VALUES (1678, 5170.5027858320045, 30, 90, 9, 1669, 77);
INSERT INTO "trippatternstop" VALUES (1679, 5989.1244723644486, 30, 98, 10, 1669, 78);
INSERT INTO "trippatternstop" VALUES (1680, 6911.8761757445991, 30, 111, 11, 1669, 443);
INSERT INTO "trippatternstop" VALUES (1681, 7515.8306542478558, 30, 72, 12, 1669, 450);
INSERT INTO "trippatternstop" VALUES (1682, 8091.5393448722007, 30, 69, 13, 1669, 455);
INSERT INTO "trippatternstop" VALUES (572, 9873.1072573034235, 30, 34, 16, 556, 330);
INSERT INTO "trippatternstop" VALUES (1645, 0, 30, 0, 1, 1644, 124);
INSERT INTO "trippatternstop" VALUES (1646, 1397.1992425407454, 30, 168, 2, 1644, 476);
INSERT INTO "trippatternstop" VALUES (1647, 1509.5240618013827, 30, 13, 3, 1644, 474);
INSERT INTO "trippatternstop" VALUES (1648, 1868.7337049134219, 30, 43, 4, 1644, 472);
INSERT INTO "trippatternstop" VALUES (1649, 2510.5526975833191, 30, 77, 5, 1644, 322);
INSERT INTO "trippatternstop" VALUES (1650, 2964.4456121994003, 30, 54, 6, 1644, 454);
INSERT INTO "trippatternstop" VALUES (1651, 3496.0722312272001, 30, 64, 7, 1644, 442);
INSERT INTO "trippatternstop" VALUES (1653, 3967.3592266977093, 30, 57, 8, 1644, 1652);
INSERT INTO "trippatternstop" VALUES (1654, 4546.6355945375271, 30, 70, 9, 1644, 451);
INSERT INTO "trippatternstop" VALUES (1655, 5049.4797681159625, 30, 60, 10, 1644, 444);
INSERT INTO "trippatternstop" VALUES (1656, 6086.3367499308406, 30, 124, 11, 1644, 54);
INSERT INTO "trippatternstop" VALUES (1657, 6585.0039007571031, 30, 60, 12, 1644, 55);
INSERT INTO "trippatternstop" VALUES (1658, 7005.3886155205255, 30, 50, 13, 1644, 56);
INSERT INTO "trippatternstop" VALUES (1659, 7701.4030984799201, 30, 84, 14, 1644, 57);
INSERT INTO "trippatternstop" VALUES (1660, 8307.8903831424359, 30, 73, 15, 1644, 58);
INSERT INTO "trippatternstop" VALUES (1661, 8858.7684146503161, 30, 66, 16, 1644, 117);
INSERT INTO "trippatternstop" VALUES (1662, 9469.429308232704, 30, 73, 17, 1644, 119);
INSERT INTO "trippatternstop" VALUES (1663, 9768.2145647143152, 30, 36, 18, 1644, 120);
INSERT INTO "trippatternstop" VALUES (1664, 10011.440412688891, 30, 29, 19, 1644, 121);
INSERT INTO "trippatternstop" VALUES (1683, 8729.7081090294687, 30, 77, 14, 1669, 438);
INSERT INTO "trippatternstop" VALUES (1684, 9329.3596153953149, 30, 72, 15, 1669, 441);
INSERT INTO "trippatternstop" VALUES (570, 9309.2474484531012, 30, 227, 14, 556, 62);
INSERT INTO "trippatternstop" VALUES (1841, 8677.4071929317743, 0, 624, 2, 1838, 1757);
INSERT INTO "trippatternstop" VALUES (573, 10277.768600399821, 30, 49, 17, 556, 331);
INSERT INTO "trippatternstop" VALUES (577, 12449.537753237653, 30, 20, 21, 556, 335);
INSERT INTO "trippatternstop" VALUES (578, 13245.501174064535, 30, 96, 22, 556, 122);
INSERT INTO "trippatternstop" VALUES (1846, 7.5579126707082063, 0, 1, 1, 1759, 1755);
INSERT INTO "trippatternstop" VALUES (587, 18568.799431061572, 30, 50, 31, 556, 429);
INSERT INTO "trippatternstop" VALUES (588, 18976.484423652491, 30, 49, 32, 556, 439);
INSERT INTO "trippatternstop" VALUES (567, 5253.2841674747797, 30, 90, 11, 556, 59);
INSERT INTO "trippatternstop" VALUES (566, 14920.909524556933, 30, 90, 10, 556, 58);
INSERT INTO "trippatternstop" VALUES (564, 3151.0947421171236, 30, 50, 8, 556, 56);
INSERT INTO "trippatternstop" VALUES (1848, 15779.190124983967, 0, 1136, 2, 1759, 1758);
INSERT INTO "trippatternstop" VALUES (574, 10437.843875690427, 30, 19, 18, 556, 332);
INSERT INTO "trippatternstop" VALUES (585, 18020.003107844444, 30, 109, 29, 556, 416);
INSERT INTO "trippatternstop" VALUES (589, 19485.019508520916, 30, 61, 33, 556, 436);
INSERT INTO "trippatternstop" VALUES (1811, 20.19965316371842, 0, 1, 1, 1810, 1758);
INSERT INTO "trippatternstop" VALUES (1814, 15812.023319060079, 0, 1137, 2, 1810, 1755);
INSERT INTO "trippatternstop" VALUES (583, 16291.242721731936, 30, 90, 27, 556, 77);
INSERT INTO "trippatternstop" VALUES (584, 17110.12902956982, 30, 98, 28, 556, 78);
INSERT INTO "trippatternstop" VALUES (586, 18155.204879038487, 30, 16, 30, 556, 427);
INSERT INTO "trippatternstop" VALUES (1767, 15812.023319060079, 30, 122, 4, 1766, 1755);
INSERT INTO "trippatternstop" VALUES (1823, 20.19965316371842, 0, 1, 1, 1822, 1758);
INSERT INTO "trippatternstop" VALUES (1768, 14121.638021445087, 30, 503, 3, 1766, 1756);
INSERT INTO "trippatternstop" VALUES (1824, 7141.6556686836584, 0, 513, 2, 1822, 1757);
INSERT INTO "trippatternstop" VALUES (1826, 15812.023319060079, 0, 624, 3, 1822, 1755);
INSERT INTO "trippatternstop" VALUES (1833, 7.5579126707082063, 30, 0, 1, 1832, 1755);
INSERT INTO "trippatternstop" VALUES (1834, 1697.9432102862268, 30, 122, 2, 1832, 1756);
INSERT INTO "trippatternstop" VALUES (1770, 20.19965316371842, 30, 1, 1, 1766, 1758);
INSERT INTO "trippatternstop" VALUES (1769, 7141.6556686836584, 30, 513, 2, 1766, 1757);
INSERT INTO "trippatternstop" VALUES (1835, 8677.4071929317743, 30, 503, 3, 1832, 1757);
INSERT INTO "trippatternstop" VALUES (1836, 15779.190124983967, 30, 511, 4, 1832, 1758);
INSERT INTO "trippatternstop" VALUES (1839, 7.5579126707082063, 0, 1, 1, 1838, 1755);
INSERT INTO "trippatternstop" VALUES (1842, 15779.190124983967, 0, 511, 3, 1838, 1758);
INSERT INTO "trippatternstop" VALUES (1950, 0, 30, 0, 1, 1885, 1732);
INSERT INTO "trippatternstop" VALUES (1951, 1305.2591711826633, 30, 157, 2, 1885, 1726);
INSERT INTO "trippatternstop" VALUES (1952, 2416.4860792698482, 30, 133, 3, 1885, 1722);
INSERT INTO "trippatternstop" VALUES (1934, 756.2326403789292, 30, 91, 2, 1917, 472);
INSERT INTO "trippatternstop" VALUES (1935, 1398.0337954672011, 30, 77, 3, 1917, 322);
INSERT INTO "trippatternstop" VALUES (1936, 2157.2608359473529, 30, 91, 4, 1917, 323);
INSERT INTO "trippatternstop" VALUES (1937, 2720.481072621802, 30, 68, 5, 1917, 325);
INSERT INTO "trippatternstop" VALUES (1938, 3212.8964865180574, 30, 59, 6, 1917, 327);
INSERT INTO "trippatternstop" VALUES (1939, 3826.4635179767592, 30, 74, 7, 1917, 57);
INSERT INTO "trippatternstop" VALUES (1953, 2906.7050951328215, 30, 59, 4, 1885, 1724);
INSERT INTO "trippatternstop" VALUES (1954, 3428.9215687584215, 30, 63, 5, 1885, 1720);
INSERT INTO "trippatternstop" VALUES (1955, 4236.2694662077138, 30, 97, 6, 1885, 1717);
INSERT INTO "trippatternstop" VALUES (1956, 4598.6954319355755, 30, 43, 7, 1885, 1715);
INSERT INTO "trippatternstop" VALUES (1957, 4839.9069456711577, 30, 29, 8, 1885, 1716);
INSERT INTO "trippatternstop" VALUES (1958, 6000.8251603537956, 30, 139, 9, 1885, 1712);
INSERT INTO "trippatternstop" VALUES (1959, 22156.759102628985, 30, 1939, 10, 1885, 73);
INSERT INTO "trippatternstop" VALUES (1960, 23160.430569112228, 30, 120, 11, 1885, 329);
INSERT INTO "trippatternstop" VALUES (1961, 23650.167903164212, 30, 59, 12, 1885, 328);
INSERT INTO "trippatternstop" VALUES (1962, 24561.108375576558, 30, 109, 13, 1885, 326);
INSERT INTO "trippatternstop" VALUES (1963, 25221.551053478332, 30, 79, 14, 1885, 324);
INSERT INTO "trippatternstop" VALUES (1964, 26143.021023438941, 30, 111, 15, 1885, 321);
INSERT INTO "trippatternstop" VALUES (1965, 26964.566811893925, 30, 99, 16, 1885, 1605);
INSERT INTO "trippatternstop" VALUES (1942, 4552.7929150233103, 30, 87, 8, 1917, 463);
INSERT INTO "trippatternstop" VALUES (1943, 21149.318740414037, 30, 1992, 9, 1917, 1711);
INSERT INTO "trippatternstop" VALUES (1944, 22587.185451709258, 30, 173, 10, 1917, 1714);
INSERT INTO "trippatternstop" VALUES (1945, 23025.215102381309, 30, 53, 11, 1917, 1718);
INSERT INTO "trippatternstop" VALUES (1946, 23759.848813051078, 30, 88, 12, 1917, 1719);


--
-- TOC entry 3047 (class 0 OID 18430)
-- Dependencies: 197 3048
-- Data for Name: tripshape; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "tripshape" VALUES (40, 0, NULL, '', '0102000020E610000002000000C060376C5B9C3940922749D74C8A45404E7FF623459C3940195B0872508A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (47, 0, NULL, '', '0102000020E610000002000000C060376C5B9C3940922749D74C8A45404E7FF623459C3940195B0872508A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (31, 0, NULL, '', '0102000020E610000009000000E60AEF72119F3940986E1283C08A4540BD22F8DF4A9E39408A93FB1D8A8A454015799274CD9C3940FCA9F1D24D8A4540CCBE2B82FF9D39403CDA38622D8A4540CA3CF207039F39402E56D4601A8A4540C73368E89FA03940E0675C38108A454061C8EA56CFA13940EDD3F198818A454061C8EA56CFA13940EDD3F198818A454061C8EA56CFA13940EDD3F198818A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (265, 0, NULL, '', '0102000020E61000001000000058B2632310A73940DAACFA5C6D8945403CC269C18BA6394019FF3EE3C289454083FA96395DA63940832F4CA60A8A4540969526A5A0A33940921D1B8178894540D2A92B9FE5A1394021C8410933894540431CEBE236A239404BC8073D9B8945406EA301BC05A2394074EACA67798A454061376C5B94A1394098A3C7EF6D8A454046425BCEA5A03940A72215C6168A4540E6797077D69E3940C4B12E6EA3894540BEC11726539D3940A1A17F828B894540ECDD1FEF559B394037C8242367894540B3EF8AE07F9B3940FF261422E0884540A5FCA4DAA79B39408EB454DE8E8845404E840D4FAF9C3940AA656B7D918845404E840D4FAF9C3940AA656B7D91884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (248, 0, NULL, '', '0102000020E61000001000000086E63A8DB49C39408ED13AAA9A884540C1CAA145B69B3940A3409FC893884540FA6184F0689B3940F801486DE28845406CEC12D55B9B39407732384A5E894540E90E62670A9D394085D382177D8945402EE7525C559E3940A1BE654E978945403A0664AF779F3940B6679604A8894540462575029AA039402E39EE940E8A4540D252793BC2A13940FB1D8A027D8A4540271422E010A239408381E7DEC38945404417D4B7CCA13940847CD0B359894540C1ADBB79AAA33940E0EEACDD7689454059E2016553A63940A6052FFA0A8A4540A01F46088FA6394035936FB6B989454058B2632310A73940D9ACFA5C6D89454058B2632310A73940D9ACFA5C6D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (302, 0, NULL, '', '0102000020E610000060000000B020CD5834A53940FC00A436718A454006DD5ED218A539406EA818E76F8A4540B11BB62DCAA4394019B2BAD5738A4540EA094B3CA0A43940E06C73637A8A45400747C9AB73A43940F5F8BD4D7F8A4540B2DCD26A48A43940BCB376DB858A45406BF6402B30A439400AA2EE03908A4540085F984C15A4394011E4A084998A4540EC909BE106A43940D89E5912A08A4540C23E3A75E5A339402DB29DEFA78A4540D04E0647C9A33940C971A774B08A45407BE40F069EA3394002F1BA7EC18A4540FB449E245DA339409ECDAACFD58A45405F4BC8073DA33940B359F5B9DA8A4540B5B0A71DFEA23940B359F5B9DA8A4540A7B8AAECBBA23940E5797077D68A45402719390B7BA239405721E527D58A4540A8052FFA0AA23940D79E5912A08A45409B99999999A139409EC893A46B8A4540D46A48DC63A139405E07CE19518A4540B828B34126A13940D0747632388A45402A3FA9F6E9A03940C2F01131258A4540634A24D1CBA03940263108AC1C8A45408E28ED0DBEA0394058518369188A4540D59AE61DA7A03940AD47E17A148A45409CFEEC478AA039402D39EE940E8A45408030F0DC7BA03940822F4CA60A8A4540483D44A33BA03940A6CB6262F38945408165A54929A03940912232ACE2894540F3EF332E1CA03940C325C79DD2894540812BD9B111A039404A3CA06CCA8945400100000000A0394067D0D03FC18945403A2861A6ED9F3940A01518B2BA8945400FF3E505D89F3940AE5FB01BB6894540ACE7A4F78D9F3940D218ADA3AA894540032B8716D99E3940A70018CFA08945402080D4264E9E39402E17F19D988945402E73BA2C269E3940E76A2BF6978945404C1AA375549D3940601A868F8889454006F52D73BA9C3940EE552B137E89454086C954C1A89C39400A0742B280894540A35D85949F9C394051B3075A81894540079E7B0F979C39407589EAAD81894540878F8829919C3940E7305F5E8089454095D920938C9C3940EE552B137E894540B2506B9A779C3940D9C9E02879894540406F2A52619C3940279B72857789454040DEAB56269C394059BBED4273894540C078060DFD9B3940A78C7F9F7189454087F9F202EC9B3940A78C7F9F71894540A48D23D6E29B39407C91D09673894540B2D7BB3FDE9B3940279B728577894540CF6BEC12D59B3940AECE31207B894540FA49B54FC79B39403C27BD6F7C89454025287E8CB99B39408AF84ECC7A89454017C1FF56B29B3940269B728577894540B3632310AF9B3940110F289B7289454088687407B19B3940432FA3586E894540CFF753E3A59B3940BCFBE3BD6A8945407AAA436E869B39407C74EACA67894540B3B5BE48689B3940CA457C2766894540ECDD1FEF559B394035C8242367894540D00F2384479B3940AE9465886389454034A2B437F89A39402E8672A25D89454098FF907EFB9A3940CA28965B5A8945403585CE6BEC9A39404AFDBCA94889454019B7D100DE9A3940A7FB00A436894540FD05BB61DB9A3940BC6A65C22F894540EFD808C4EB9A3940436458C51B894540A883F57F0E9B3940E0CCAFE6008945404460E5D0229B394099030473F4884540A7DAA7E3319B39400B8E9257E7884540FCD005F52D9B3940843DEDF0D78845406D43C5387F9B3940AF5582C5E18845404265FCFB8C9B39406184F068E3884540B4295778979B3940054CE0D6DD884540987840D9949B3940F0BF95ECD88845408A11C2A38D9B394045B6F3FDD4884540D1A0A17F829B3940E15817B7D1884540DFEA39E97D9B3940A8F6E978CC8845408AD7F50B769B394021A64412BD8845405FDC4603789B39407DC16ED8B68845408AF4DBD7819B3940683524EEB18845405F16139B8F9B39404C840D4FAF884540188733BF9A9B39401322E010AA8845407B01F6D1A99B39407020240B98884540260B98C0AD9B3940858F882991884540347216F6B49B3940FE3EE3C28188454089A2409FC89B39402215C61682884540886D8B321B9C3940543541D47D8845407A7AA52C439C39409BE1067C7E88454041A9F6E9789C3940CD1E6805868845406B183E22A69C394038BEF6CC928845404E840D4FAF9C3940AA656B7D918845404E840D4FAF9C3940AA656B7D918845404E840D4FAF9C3940AA656B7D91884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (147, 0, NULL, '', '0102000020E610000047000000ADC5A700189F3940CA8E8D40BC8A4540E67E87A2409F3940113B53E8BC8A4540CAB08A37329F3940AEC090D5AD8A45402ED49AE61D9F39404321020EA18A4540039F1F46089F394091D5AD9E938A4540026A6AD95A9F3940B5AB90F2938A45403AEE940ED69F3940F5F8BD4D7F8A454048551344DD9F3940B571C45A7C8A45408F3BA583F59F39406EC5FEB27B8A4540C89DD2C1FA9F3940BC96900F7A8A45401DB1169F02A03940EEB60BCD758A4540B97020240BA03940032670EB6E8A4540D52137C30DA03940E774594C6C8A4540800EF3E505A03940E774594C6C8A4540C780ECF5EE9F3940C39E76F86B8A45401D2098A3C79F39400A4B3CA06C8A4540D6C56D34809F3940E674594C6C8A4540ACE28DCC239F39401F9DBAF2598A4540026553AEF09E39401878EE3D5C8A454075B0FECF619E394003098A1F638A4540E8DEC325C79D3940EE9925016A8A4540DA03ADC0909D3940C39E76F86B8A45403E44A33B889D3940E774594C6C8A45405BBBED42739D3940E774594C6C8A4540BF30992A189D3940EE9925016A8A45402337C30DF89C39401995D409688A4540155CACA8C19C39406024B4E55C8A4540153FC6DCB59C3940D2CB28965B8A4540408C101E6D9C3940C481902C608A4540B2169F02609C3940EF7C3F355E8A4540CFAACFD5569C394028C286A7578A45404EA1F31ABB9C394084DDB06D518A45400769C6A2E99C39402080D4264E8A45407815527E529D394059C51B99478A454021D26F5F079E3940EF08A7052F8A454004B2D7BB3F9E3940BDCB457C278A4540A0E57970779E3940619335EA218A454091DAC4C9FD9E3940283108AC1C8A45405782C5E1CC9F3940AF47E17A148A4540E470E65773A03940C4B645990D8A454039A1100187A039400B630B410E8A4540556F0D6C95A03940271422E0108A4540AAD903ADC0A03940A0FD4811198A45400DAB7823F3A03940E0A128D0278A4540D4BCE3141DA139406E179AEB348A45401BC05B2041A13940670FB402438A454053B3075A81A139407CD5CA845F8A4540B6A1629CBFA1394043CA4FAA7D8A4540B58993FB1DA23940983446EBA88A45402619390B7BA239405821E527D58A4540A67EDE54A4A239409FCDAACFD58A4540DF37BEF6CCA2394051FC1873D78A45406D04E275FDA239406DAD2F12DA8A454025E99AC937A33940D82FD80DDB8A4540088F368E58A339400A5053CBD68A4540247A19C572A33940FCE8D495CF8A4540959526A5A0A3394075982F2FC08A45406A0E10CCD1A33940AEC090D5AD8A45403FA4DFBE0EA43940E0C325C79D8A45402284471B47A4394004603C83868A4540B0169F0260A43940F6DBD781738A454013AE47E17AA439401A95D409688A45403EC6DCB584A4394076B0FECF618A45403E00A94D9CA439407DD5CA845F8A454076F35487DCA43940362905DD5E8A4540A07F828B15A53940BD5CC477628A4540590D897B2CA539409261156F648A4540590D897B2CA539409261156F648A4540590D897B2CA539409261156F648A4540590D897B2CA539409261156F648A4540590D897B2CA539409261156F648A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (289, 0, NULL, '', '0102000020E6100000620000004EA1F31ABB9C3940DCA2CC0699884540EBB298D87C9C394039A110018788454016747B49639C39406BC18BBE82884540DDD78173469C3940C0B7E9CF7E88454096D40968229C3940790B24287E884540CFA5B8AAEC9B394072E6577380884540337216F6B49B39402415C616828845406CB75D68AE9B394039BEF6CC92884540D0DA6D179A9B39401522E010AA884540DE240681959B3940797FBC57AD8845406C60AB048B9B39409530D3F6AF88454041481630819B3940B1E1E995B2884540EC34D252799B3940153FC6DCB5884540412B3064759B3940DCF97E6ABC8845402497FF907E9B39405C25581CCE8845405DF92CCF839B39402A05DD5ED28845405D16139B8F9B39408E62B9A5D58845406B7D91D0969B3940F2BF95ECD8884540DD240681959B394096A46B26DF884540CFBD874B8E9B39406484F068E388454008C90226709B3940DD5031CEDF884540417DCB9C2E9B3940CFE9B298D8884540A5DAA7E3319B39407A103B53E88845407AC2120F289B39403AA6272CF18845407A884677109B3940C1F6CC9200894540FA5C6DC5FE9A394008C078060D894540ECD808C4EB9A39406B3A3B191C894540895E46B1DC9A3940EB6514CB2D894540895E46B1DC9A3940D6F6AFAC3489454009A7052FFA9A3940CF28965B5A8945406CEC12D55B9B3940BAB9313D61894540C190D5AD9E9B394016F241CF66894540240B98C0AD9B3940C820B072688945404F232D95B79B394008A8A9656B8945404F401361C39B39407A4F1E166A8945406B0E10CCD19B39407A4F1E166A8945404E7ADFF8DA9B3940960035B56C8945408716D9CEF79B39408FDB68006F894540B1852007259C3940D6872EA86F8945402232ACE28D9C3940E4EEACDD76894540F78DAF3DB39C3940D6872EA86F894540CCAFE600C19C3940B2B14B546F894540686FF085C99C394039E50AEF728945403D74417DCB9C3940C018CA8976894540A1D11DC4CE9C394000A0C37C79894540688CD651D59C3940D5A414747B8945405A5F24B4E59C3940CE7F48BF7D894540130A1170089D39400E0742B280894540A0F831E6AE9D3940EA4D452A8C894540CA897615529E39400D410E4A9889454002486DE2E49E3940F0ACDD76A1894540F3599E07779F3940699604A8A9894540653BDF4F8D9F3940B042CA4FAA894540AC9509BFD49F39408C89CDC7B58945400F2DB29DEF9F39400C98C0ADBB89454048ACC5A700A039408CA6B393C1894540011DE6CB0BA03940C508E1D1C689454048E6913F18A039401A1C25AFCE894540F30C1AFA27A039409A47FE60E0894540BAE4B8533AA0394085F57F0EF389454081F6234564A039400C462575028A45401DF0F96184A03940C5B645990D8A45409D1BD31396A039404CEA0434118A4540D6D4B2B5BEA039405A518369188A454072B1A206D3A03940DA5F764F1E8A4540808CB96B09A13940CC32C4B12E8A4540F28AE07F2BA13940A879C7293A8A4540D5307C444CA139407D9BFEEC478A454046696FF085A1394076B0FECF618A4540B7A1629CBFA1394044CA4FAA7D8A45406FDDCD531DA23940993446EBA88A4540E06C73637AA23940354B02D4D48A454060D218ADA3A23940A0CDAACFD58A4540998BF84ECCA2394075D2FBC6D78A4540B5B0A71DFEA239406EAD2F12DA8A4540189F02603CA33940B559F5B9DA8A4540C2E270E657A339402E26361FD78A4540EC34D25279A3394027E4839ECD8A45407AE40F069EA33940E01AD82AC18A4540CF6BEC12D5A3394020680586AC8A45404FEE77280AA439404B46CEC29E8A454096B7239C16A43940A03C2CD49A8A454087E123624AA439407507B133858A4540406F2A5261A4394067834C32728A45406BA4A5F276A43940EE9925016A8A4540DD68006F81A43940E032A7CB628A45402432ACE28DA43940E7577380608A454087AC6EF59CA43940A0ABADD85F8A45406A8CD651D5A43940352905DD5E8A4540DBE1AFC91AA53940E032A7CB628A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A45405B0D897B2CA539409261156F648A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (407, 0, NULL, '', '0102000020E610000059000000F7CC920035A53940D92AC1E2708A45405BD3BCE314A53940927EFB3A708A45406A6FF085C9A43940F6DBD781738A454031B610E4A0A43940E16C73637A8A454015CB2DAD86A43940B671C45A7C8A454087E123624AA43940BDB376DB858A4540DD63E94317A439405990662C9A8A454041A4DFBE0EA439402770EB6E9E8A45407A758E01D9A33940920F7A36AB8A4540176A4DF38EA33940D2D03FC1C58A4540EDFA05BB61A33940354B02D4D48A45406DB2463D44A3394091831266DA8A45406D787AA52CA33940B559F5B9DA8A4540DFAB5626FCA23940B559F5B9DA8A4540986E1283C0A239402E26361FD78A4540DFC325C79DA239407CF7C77BD58A45402619390B7BA239405821E527D58A4540A7052FFA0AA23940D89E5912A08A4540E1455F419AA13940C39E76F86B8A454037C8242367A139407CB8E4B8538A4540469E245D33A13940C32ADEC83C8A45408DF337A110A13940C30DF8FC308A45402A05DD5ED2A03940D85F764F1E8A45408E28ED0DBEA039407C2766BD188A454063F3716DA8A03940AE47E17A148A4540AA4885B185A039400A630B410E8A454000917EFB3AA03940A7CB6262F3894540D63E1D8F19A03940849ECDAACF89454073A774B0FE9F3940FD4D2844C0894540ACB2EF8AE09F39403DB83B6BB78945401E8F19A88C9F3940AF42CA4FAA89454075D2FBC6D79E3940A80018CFA089454004CFBD874B9E39400C410E4A98894540E8C6F484259E3940E86A2BF697894540771A69A9BC9D39406F8104C58F89454094C6681D559D3940611A868F88894540A3B437F8C29C39403602F1BA7E894540F88DAF3DB39C39407DAEB6627F8945406AFB57569A9C39407689EAAD8189454095D920938C9C39405AD8D30E7F8945400764AF777F9C39408CF84ECC7A8945408738D6C56D9C39407047382D788945404F2844C0219C394037E50AEF728945400808E6E8F19B3940A98C7F9F7189454016359886E19B3940A267B3EA73894540247F30F0DC9B3940941D1B8178894540DDB5847CD09B3940F87AF7C77B894540C1E78711C29B39401C51DA1B7C894540C1CAA145B69B39402376A6D079894540B3632310AF9B394031C03E3A758945406CB75D68AE9B394063E0B9F77089454088687407B19B3940472FA3586E8945405D50DF32A79B3940C0FBE3BD6A894540EB6E9EEA909B3940C720B07268894540A4315A47559B39401C170E8464894540ECF5EE8FF79A3940318672A25D89454008A7052FFA9A3940867CD0B3598945407A14AE47E19A3940312FC03E3A894540B359F5B9DA9A39402AED0DBE30894540C1DD59BBED9A3940715F07CE19894540EB2FBB270F9B3940BFF6CC920089454024CCB4FD2B9B39403FCBF3E0EE884540EB866D8B329B3940EAB7AF03E7884540F9D005F52D9B3940CEE9B298D888454087F4DBD7819B3940D52B6519E2884540CEBD874B8E9B394040AE0D15E38845406A7D91D0969B39409CC937DBDC88454023D1CB28969B3940F1BF95ECD8884540F8B836548C9B394023E010AAD488454086F4DBD7819B3940E35817B7D188454086D7F50B769B3940DCF97E6ABC8845405BDC4603789B39403815A930B688454077AA436E869B3940FFB27BF2B0884540F7D51C20989B39400DFD135CAC8845403E9FC893A49B3940F12E17F19D884540B0632310AF9B3940B18A37328F884540307216F6B49B3940DC68006F81884540BE046EDDCD9B39402315C61682884540057C7E18219C3940553541D47D8845403E355EBA499C3940E38DCC237F884540CC0182397A9C3940F1F44A5986884540E8CF7EA4889C39409CFEEC478A88454084C954C1A89C3940A3409FC8938845409230D3F6AF9C3940AA656B7D918845409230D3F6AF9C3940AA656B7D918845409230D3F6AF9C3940AA656B7D918845409230D3F6AF9C3940AA656B7D918845409230D3F6AF9C3940AA656B7D918845409230D3F6AF9C3940AA656B7D91884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (195, 0, NULL, '', '0102000020E61000006B000000ADC5A700189F3940ED647094BC8A45405726FC523F9F3940ED647094BC8A4540C9B08A37329F3940ADC090D5AD8A4540029F1F46089F394091D5AD9E938A45402DCF83BBB39E3940EDF0D7648D8A454066F7E461A19E3940A64412BD8C8A4540BCB376DB859E39407B4963B48E8A45404AD235936F9E3940F415A4198B8A4540CAA65CE15D9E394042E73576898A4540F645425BCE9D394010AAD4EC818A454005E275FD829D39408251499D808A4540147EA99F379D39405E7B6649808A45407884D382179D3940AC4CF8A57E8A454086B18520079D394065A032FE7D8A4540865AD3BCE39C39402519390B7B8A45404E672783A39C394065834C32728A45405CCEA5B8AA9C3940EC9925016A8A4540EA263108AC9C394001098A1F638A4540B1A71DFE9A9C3940332905DD5E8A4540A3E9EC64709C39409EABADD85F8A45406A6AD95A5F9C3940A5D0798D5D8A4540CEAACFD5569C3940499869FB578A4540A3409FC8939C39409E8EC70C548A454078103B53E89C39404256B77A4E8A454030698CD6519D394057C51B99478A4540A1F831E6AE9D394010FC6F253B8A4540CBDB114E0B9E39408286FE092E8A4540BC0512143F9E3940BBCB457C278A45405839B4C8769E39403BBD5296218A454090DAC4C9FD9E3940263108AC1C8A45402BC1E270E69F394043C5387F138A4540AAD4EC8156A03940510FD1E80E8A454038A1100187A03940C3B645990D8A45400DC347C494A03940033E3F8C108A4540D4D4B2B5BEA0394058518369188A45407EA99F3715A139402D90A0F8318A45409A25016A6AA13940E63A8DB4548A4540B6A1629CBFA139401FF46C567D8A4540A89196CADBA13940F415A4198B8A45400B0C59DDEAA13940F415A4198B8A4540EE77280AF4A139406DE2E47E878A4540EE940ED6FFA13940E6913F18788A4540357BA01518A239409886E123628A45408AC8B08A37A23940757632384A8A45400A11700855A23940605969520A8A4540ED7C3F355EA239403D49BA66F2894540B41A12F758A239407DB3CD8DE98945406D5166834CA239406F4C4F58E28945407B61325530A2394093054CE0D6894540898EE4F21FA239408CC3995FCD894540B46CAD2F12A239403ED52137C38945407B0A80F10CA2394093AE997CB38945406DA301BC05A23940F0ACDD76A18945405F1F9DBAF2A13940708104C58F894540D18C45D3D9A139409B42E735768945406D2F698CD6A139403FEDF0D7648945405FE5D022DBA13940B1777FBC57894540DFF3C308E1A13940638907944D894540340708E6E8A13940A3F31ABB44894540ED77280AF4A13940073411363C894540B46CAD2F12A239405C0D897B2C89454017213CDA38A239405CD3BCE3148945407A9BFEEC47A2394087B1852007894540CFAE42CA4FA23940F2164850FC884540C181902C60A23940B9973446EB884540883C49BA66A2394056008C67D0884540B337F8C264A23940413A75E5B3884540883C49BA66A239404F4A41B797884540082E56D460A239408838D6C56D884540332905DD5EA239404FD6A88768884540972F2FC03EA23940D695CFF23C88454017E76F4221A239403A7F130A11884540B44AB0389CA13940564D10751F88454099030473F4A039408FCC237F308845406F3D0AD7A3A039408FCC237F308845409AC420B072A03940E4C281902C8845407072BF4351A03940888A71FE26884540F00C1AFA27A03940C8F484251E884540E3839ECDAA9F39408816D9CEF78745402AD9B111889F3940EC56CF49EF874540805B77F3549F3940736DA818E787454047BF7D1D389F39400F10CCD1E387454080CAF8F7199F39403A0B7BDAE18745409D02603C839E3940F35EB532E18745403A49BA66F29D3940ACB2EF8AE08745405825581CCE9C39401E5A643BDF8745401F895E46B19C3940ACB2EF8AE0874540689A779CA29B3940BA36548CF3874540CCA0A17F829B394001E31934F4874540CC49EF1B5F9B3940738A8EE4F287454013821C94309B39403A2861A6ED87454085B5F814009B39405EE15D2EE2874540F857569A949A3940348FFCC1C0874540DC6C73637A9A394090AA2688BA8745406BDDCD531D9A3940E5839ECDAA874540DD10AAD4EC993940979526A5A08745404F448655BC9939406C7D91D096874540ECC9C342AD99394073A25D8594874540DEB4E0455F993940CF143AAFB1874540B4EEE6A90E9939409609BFD4CF874540ED5014E8139939406B0E10CCD1874540ED5014E8139939406B0E10CCD1874540ED5014E8139939406B0E10CCD1874540ED5014E8139939406B0E10CCD1874540ED5014E8139939406B0E10CCD1874540ED5014E8139939406B0E10CCD1874540ED5014E8139939406B0E10CCD1874540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1079, 0, NULL, '', '0102000020E6100000BB000000281422E010A23940605969520A8A4540EF77280AF4A13940B54FC763068A4540C42ADEC83CA23940116BF129008A4540193E22A644A23940A6E8482EFF89454027A5A0DB4BA23940CABE2B82FF894540350C1F1153A239407CED9925018A45409969FB5756A239409179E40F068A45400BF4893C49A239408369183E228A45407D7E18213CA23940982F2FC03E8A4540441CEBE236A23940984C158C4A8A45406FDDCD531DA23940ED7C3F355E8A454028F73B1405A2394042AD69DE718A4540A8E8482EFFA139402D3E05C0788A45406F861BF0F9A13940F4F8BD4D7F8A45403624EEB1F4A13940B48EAA26888A45401A56F146E6A1394018EC866D8B8A4540A89196CADBA13940D13FC1C58A8A4540E1455F419AA13940C39E76F86B8A45407E74EACA67A139407CB8E4B8538A454045D8F0F44AA1394035EF3845478A45403737A6272CA13940CA4FAA7D3A8A45400C022B8716A13940753C66A0328A454070B1A206D3A03940FC3559A31E8A45401B81785DBFA039407C2766BD188A4540A99F3715A9A03940AE47E17A148A45409B1BD31396A03940271422E0108A45400DA661F888A039402E39EE940E8A4540627FD93D79A0394019ADA3AA098A45407FD93D7958A039401990BDDEFD894540B8E4B8533AA039403D49BA66F28945407F65A54929A039404B766C04E28945406397A8DE1AA0394012F758FAD089454055302AA913A03940FD6A0E10CC8945402A1895D409A03940A132FE7DC68945401CB1169F02A03940F6285C8FC2894540C79DD2C1FA9F39406FF59CF4BE894540642310AFEB9F39407D3F355EBA8945409D4B7155D99F3940D235936FB6894540E4BD6A65C29F39404B02D4D4B289454073A25D85949F3940607138F3AB894540653BDF4F8D9F3940AE42CA4FAA894540E661A1D6349F3940E062450DA689454075D2FBC6D79E3940A70018CFA0894540E83A8DB4549E394052EDD3F1988945402FCA6C90499E39400B410E4A988945402F73BA2C269E3940E76A2BF6978945404C1FBAA0BE9D39409257E7189089454085F068E3889D3940E74D452A8C89454094C6681D559D3940601A868F88894540310DC347C49C394059D8D30E7F8945404EA1F31ABB9C39403502F1BA7E894540B2E1E995B29C39407CAEB6627F8945405DCEA5B8AA9C3940E7305F5E80894540DDBFB2D2A49C394052B3075A81894540B2A71DFE9A9C394052B3075A8189454016E81379929C39400B0742B28089454096D920938C9C3940EF552B137E89454024F8DF4A769C3940DAC9E028798945408838D6C56D9C3940931D1B8178894540089964E42C9C39407E91D09673894540A51EA2D11D9C394037E50AEF728945408916D9CEF79B3940A98C7F9F7189454089F9F202EC9B3940CD6262F37189454089DC0C37E09B3940C63D963E74894540FB8381E7DE9B3940E2EEACDD76894540507ADFF8DA9B3940B7F3FDD4788945401718B2BAD59B39408CF84ECC7A894540ECFF1CE6CB9B39401A51DA1B7C894540C1E78711C29B3940F67AF7C77B89454096CFF23CB89B3940444C89247A8945405D6DC5FEB29B39406F47382D78894540B2632310AF9B39402FC03E3A75894540B2632310AF9B3940A88C7F9F71894540CE143AAFB19B3940442FA3586E89454095B20C71AC9B39404B546F0D6C894540959526A5A09B394052793BC269894540DCEA39E97D9B394036C8242367894540C0E270E6579B39401A170E846489454032A2B437F89A39402F8672A25D894540DE4F8D976E9A3940E197FA7953894540DFF3C308E19939406FD39FFD48894540B5F3FDD4789939403D963E74418945405222895E46993940B6627FD93D894540A8DE1AD82A993940E15D2EE23B894540FE9AAC510F9939405305A3923A8945408CD651D5049939402F2FC03E3A894540A94D9CDCEF983940043411363C894540293FA9F6E9983940043411363C8945401BD82AC1E298394099B1683A3B89454070CE88D2DE983940A0D634EF388945402922C32ADE9839403C7958A835894540A913D044D89839403537A6272C89454045B6F3FDD49839406E7CED9925894540E23B31EBC5983940E72B483316894540B706B64AB098394084B1852007894540C6DCB5847C98394076103B53E8884540FFAD64C746983940B64082E2C78845407138F3AB399839403D575BB1BF8845407F65A5492998394084E63A8DB4884540B8AAECBB22983940BD2B82FFAD884540544D10751F98394084C954C1A8884540C6F484251E9839406F3D0AD7A38845409BF9D51C20983940A88251499D884540D45B035B25983940049E7B0F97884540F046E6913F983940E8CF7EA488884540F080B229579839405A5A0D897B88454053FB743C66983940A1E9EC6470884540B7585183699839408C5DA27A6B884540FE04172B6A9839404CD6A88768884540B758518369983940C5A2E9EC648845400C4FAF946598394021BE13B35E884540708FA50F5D983940F6A57EDE548845404577103B53983940361092054C8845408C06F0164898394084C43D963E884540C54B378941983940A87D3A1E33884540C54B378941983940CC3637A627884540B7019F1F469839409AF9D51C2088454029C6F99B50983940DA63E94317884540B73B6BB75D983940367F130A11884540452575029A983940A1C7EF6DFA874540E192E34EE9983940682BF697DD874540EFA7C64B379939400CB9196EC08745400B5EF415A4993940D3FF39CC97874540B6679604A899394021D1CB2896874540EFC9C342AD993940937840D994874540A83AE466B8993940FEFAE8D4958745407D96E7C1DD99394077E40F069E874540271422E0109A3940E9A86A82A8874540D1915CFE439A394085687407B1874540B471C45A7C9A3940D356EC2FBB874540C2F5285C8F9A3940C50C54C6BF874540D0967329AE9A394061CC5D4BC88745405036E50AEF9A394044551344DD8745407B6B60AB049B3940E839E97DE387454025CCB4FD2B9B3940A8CFD556EC8745405E4BC8073D9B3940C480ECF5EE874540B398D87C5C9B39404BB4AB90F28745401630815B779B3940D90C37E0F3874540A4C2D842909B3940FDE21934F48745405D50DF32A79B394092607138F3874540079964E42C9C39408B1EBFB7E98745405C3D27BD6F9C3940769274CDE4874540236C787AA59C3940CB88D2DEE08745400612143FC69C39403D30478FDF8745403EEDF0D7649D394061062AE3DF874540CBBE2B82FF9D3940CC88D2DEE08745402D095053CB9E394013359886E1874540F45487DC0C9F394013359886E18745409031772D219F39405AE15D2EE2874540657094BC3A9F39402FE6AE25E4874540C8073D9B559F39406F6DA818E7874540724BAB21719F39401A774A07EB874540B9313D61899F3940E856CF49EF8745401CACFF73989F39406F8A8EE4F287454047C49448A29F39406865C22FF58745402A8716D9CE9F39401AB1169F028845400D84640113A039402110AFEB1788454046205ED72FA03940534D10751F88454029C6F99B50A03940858A71FE26884540FE21FDF675A03940296F47382D8845408C0B0742B2A039408DCC237F308845400C54C6BFCFA03940B1A206D330884540A84D9CDCEFA039408DCC237F308845406E47382D78A13940DB80CF0F238845403502F1BA7EA139400DA14ACD1E8845400A0742B280A139406297A8DE1A884540B510E4A084A139408D9257E718884540EE7211DF89A13940DB63E943178845407CE882FA96A13940E9AD81AD12884540A70018CFA0A13940A92688BA0F88454019C5724BABA13940A92688BA0F884540272CF180B2A139407E2BD9B11188454019E25817B7A139409ADCEF5014884540D235936FB6A1394045E6913F1888454044DD0720B5A139406197A8DE1A884540EFC9C342ADA139405A72DC291D884540D3FBC6D79EA139400CA14ACD1E88454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C02188454061545227A0A139404C2844C021884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1108, 0, NULL, '', '0102000020E6100000C1000000C59448A297A13940EBAD81AD12884540A80018CFA0A13940CFFC6A0E10884540B6679604A8A139408850A5660F884540C4CE143AAFA1394016A930B6108845408B89CDC7B5A139400F8464011388454019E25817B7A13940E488B5F8148845408B89CDC7B5A139402410AFEB17884540D235936FB6A13940F91400E319884540E07F2BD9B1A13940CE1951DA1B884540EEC9C342ADA139408048BF7D1D884540D2FBC6D79EA1394032772D211F884540B69C4B7155A1394064B48EAA26884540450DA661F8A039406BF6402B308845408C7F9F71E1A03940B2A206D3308845401B649291B3A039408ECC237F308845409B38B9DFA1A0394047205ED72F88454054185B0872A03940E3C281902C884540D4CF9B8A54A03940CE3637A627884540711B0DE02DA03940554D10751F884540E3A59BC420A03940CE1951DA1B8845400E84640113A03940003ACC9717884540006F8104C59F3940DD291DACFF874540397AFCDEA69F3940FABD4D7FF687454047A7AE7C969F39402CDEC83CF2874540E40F069E7B9F3940F37B9BFEEC874540C8073D9B559F3940736DA818E78745408F882991449F39409E685721E5874540ACFF73982F9F3940A58D23D6E2874540102384471B9F39405EE15D2EE2874540744694F6069F394017359886E1874540F515A4198B9E3940F35EB532E1874540F5673F52449E3940CF88D2DEE087454059FAD005F59D3940CF88D2DEE08745409487855AD39C39404130478FDF874540EA4317D4B79C394065062AE3DF874540DD63E943179C39401E774A07EB8745405E33F9669B9B3940DE0C37E0F38745400903CFBD879B394002E31934F4874540267A19C5729B3940BB36548CF387454018F6B4C35F9B3940748A8EE4F287454051E449D2359B394082D4264EEE8745406E21C841099B394057BC9179E48745406EE7FBA9F19A39409001D9EBDD874540EE9E3C2CD49A394089BF266BD4874540D2967329AE9A394089A2409FC8874540524EB4AB909A3940EDE2361AC08745408B592F86729A394002529B38B9874540D2915CFE439A394089687407B18745401A90BDDEFD993940429FC893A487454070F59CF4BE993940B429577897874540628E1EBFB799394002FBE8D495874540377689EAAD993940977840D994874540E262450DA69939406C7D91D096874540E20B93A982993940419FC893A4874540545C55F65D993940F3EA1C03B2874540624F3BFC359939405665DF15C1874540FF9AAC510F9939407233DC80CF874540647FD93D79983940C7BAB88D06884540C8A2E9EC64983940F9F719170E88454056DE8E705A983940C7D79E59128845407372BF4351983940DC63E943178845401E5F7B66499839405C72DC291D884540E5FC4D284498394095D4096822884540C94B37894198394015E3FC4D28884540829F71E140983940711B0DE02D884540E6FC4D28449839409C33A2B437884540660B410E4A983940A3755435418845404977103B53983940381092054C884540F49D98F562983940BF60376C5B8845402D00C6336898394014747B4963884540BB5851836998394078D1579066884540BB58518369983940FF04172B6A8845402D00C633689839403F8C101E6D8845409FA73AE4669839407F130A11708845403C2D78D15798394014AE47E17A88454092CC237F3098394062B9A5D5908845403DB9DFA128983940546F0D6C95884540BDAAECBB22983940224F92AE99884540A1F9D51C20983940A98251499D88454013A14ACD1E9839407762D68BA188454013A14ACD1E98394062F3716DA88845404C03780B24983940705AF0A2AF884540E8C281902C9839407EC16ED8B688454068EE5A423E9839407EDE54A4C28845407672BF43519839405A25581CCE88454020F0F9618498394068C6A2E9EC884540755AF0A2AF98394061DBA2CC068945401137E0F3C398394036FDD98F14894540E65817B7D1983940AFE600C11C894540C9C4E6E3DA9839400B1F1153228945400244FAEDEB983940590D897B2C8945400261E0B9F7983940926FB6B931894540826FD39FFD9839408B4AEA0434894540AD87687407993940604F3BFC35894540D89FFD4811993940EEA7C64B37894540020F45813E9939405205A3923A89454090F84ECC7A99394020E527D53E894540C9CE143AAF9939408442041C4289454002A5DAA7E39939402F4CA60A46894540C7FA3F87F99A3940A852B3075A894540553BFC35599B3940B6B9313D618945406333F9669B9B3940EF1B5F7B66894540469FC893A49B394013F241CF66894540E25ED218AD9B3940A14ACD1E68894540E27BB8E4B89B394005A8A9656B894540A9367172BF9B3940774F1E166A894540D44E0647C99B394053793BC269894540FF669B1BD39B39409A25016A6A8945400DCE1951DA9B3940930035B56C8945407048DC63E99B3940FE82DDB06D894540621B2AC6F99B3940690586AC6E894540628FC2F5289C39401B34F44F7089454045E3C281909C3940E2EEACDD76894540D3920035B59C3940B0B14B546F89454045575BB1BF9C3940D4872EA86F89454053BED9E6C69C3940A98C7F9F718945406F6FF085C99C39405BBBED4273894540FDC77BD5CA9C39405496218E75894540996A9F8EC79C3940FF9FC37C7989454052A1F31ABB9C394086D382177D894540EF263108AC9C3940C65A7C0A80894540A806D3307C9C3940695C3810928945406FA4A5F2769C3940850D4FAF94894540448C101E6D9C3940F7D1A92B9F894540C47D1D38679C3940E27F2BD9B18945408BA757CA329C3940E27F2BD9B1894540F0A353573E9B394006560E2DB289454054DF32A7CB9A394006560E2DB28945408E1F63EE5A9A39400DD28C45D3894540573F6F2A529939403EBD5296218A4540101F1153229939405A8B4F01308A454010AB7823F39839400CD7A3703D8A4540C9E1CCAFE6983940930A630B418A45401071AC8BDB98394061EAE74D458A4540AC13D044D8983940E81DA7E8488A45409062B9A5D59839406F5166834C8A4540D70E7F4DD6983940AFD85F764F8A4540AC13D044D8983940360C1F11538A4540E575FD82DD98394052BD35B0558A4540AC30B610E49839406E6E4C4F588A45400144FAEDEB98394043739D465A8A45400161E0B9F7983940AEF545425B8A4540E4067C7E18993940AEF545425B8A4540E45D2EE23B9939408A1F63EE5A8A4540C59E76F86B9A394026C286A7578A4540EF2FBB270F9B394074931804568A45407CAF5A99F09B39409F8EC70C548A45408A8A71FE269C3940340C1F11538A45405FC98E8D409C3940340C1F11538A4540A6923A014D9C39402DE7525C558A4540D1AACFD5569C394026C286A7578A45400A64AF777F9C39402DE7525C558A45407B103B53E89C39401F80D4264E8A4540FA234564589D3940111956F1468A4540B22AFBAE089E3940CA32C4B12E8A454007B2D7BB3F9E394098F56228278A454078EACA67799E39403CBD5296218A4540F7A62215C69E3940200C3CF71E8A4540DA868A71FE9E3940273108AC1C8A45408495438B6C9F394059518369188A45404AACC5A700A03940B56CAD2F128A454082BC57AD4CA0394075E5B33C0F8A45409EC420B072A03940E78C28ED0D8A454010A661F888A039402E39EE940E8A4540576F0D6C95A03940271422E0108A45401E81785DBFA039407C2766BD188A454073B1A206D3A03940FC3559A31E8A45400FE544BB0AA1394011DF89592F8A45401D69A9BC1DA1394091ED7C3F358A45400F59DDEA39A139404A5E9D63408A4540F2FE78AF5AA13940D8D30E7F4D8A4540E4EEACDD76A139406649809A5A8A4540B9A1629CBFA139401FF46C567D8A4540F23D5C72DCA13940F415A4198B8A45408EFD65F7E4A1394018EC866D8B8A45403924EEB1F4A13940B48EAA26888A45402BDA5548F9A139403BA583F57F8A4540ABE8482EFFA139402D3E05C0788A454072A301BC05A2394042AD69DE718A454000533F6F2AA239409F8EC70C548A4540471CEBE236A23940BC22F8DF4A8A4540008D0B0742A239400ABABDA4318A4540E315C1FF56A239409179E40F068A4540E3F8DA334BA239404ACD1E68058A45408EABCABE2BA2394043A852B3078A4540552CB7B41AA23940CADB114E0B8A4540E3675C3810A239405F5969520A8A4540C7B645990DA239407B0A80F10C8A4540C7B645990DA239407B0A80F10C8A4540C7B645990DA239407B0A80F10C8A4540C7B645990DA239407B0A80F10C8A4540C7B645990DA239407B0A80F10C8A4540C7B645990DA239407B0A80F10C8A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (394, 0, NULL, '', '0102000020E61000005B00000086E63A8DB49C39408ED13AAA9A8845404DA1F31ABB9C3940B9CCE9B298884540CD0182397A9C3940F2F44A5986884540EA3E00A94D9C39402B3A92CB7F884540DC9DB5DB2E9C3940790B24287E8845402310AFEB179C39409DE1067C7E8845409526A5A0DB9B3940B9921D1B81884540F949B54FC79B39402415C61682884540327216F6B49B3940003FE3C281884540240B98C0AD9B394039BEF6CC9288454079E40F069E9B3940F970C971A78845404082E2C7989B3940C7504EB4AB8845404ECC7A31949B394007D847A7AE884540CEA0A17F829B39406B3524EEB1884540EB34D252799B39403915A930B6884540402B3064759B3940DDF97E6ABC8845402397FF907E9B3940ABF6E978CC884540A3A5F276849B39402B05DD5ED2884540957840D9949B39401DBB44F5D6884540F9D51C20989B3940E475FD82DD8845408711C2A38D9B39406484F068E3884540798D5DA27A9B39408F7F9F71E188454087BA0F406A9B3940BA7A4E7ADF88454095ADF545429B3940C8C4E6E3DA884540F9D005F52D9B394064670A9DD7884540EB866D8B329B3940563A58FFE788454079C2120F289B39405D7C0A80F1884540A483F57F0E9B394072253B36028945404F36E50AEF9A3940E4067C7E18894540FA05BB61DB9A39403212DA722E8945405E6397A8DE9A3940ABFB00A43689454008A7052FFA9A3940CE28965B5A89454024404D2D5B9B3940B9B9313D618945400703CFBD879B39401D170E8464894540959526A5A09B3940CF457C2766894540077767EDB69B3940E4D1C6116B894540A3367172BF9B394056793BC26989454015FBCBEEC99B394032A3586E69894540B1BAD573D29B39409D25016A6A89454006CE1951DA9B3940960035B56C89454022B9FC87F49B3940482FA3586E894540F731E6AE259C3940FA5D11FC6F8945403DE3C281909C3940E5EEACDD7689454068183E22A69C394089B69C4B71894540934DB9C2BB9C3940B4B14B546F894540936A9F8EC79C3940AD8C7F9F718945403E74417DCB9C3940C218CA8976894540DA334B02D49C394090F84ECC7A894540AF5582C5E19C394089D382177D894540E80E62670A9D3940100742B28089454075FD82DDB09D3940EC4D452A8C89454057E20165539E394057EDD3F19889454001486DE2E49E3940F3ACDD76A1894540640113B8759F394048C02154A9894540F2936A9F8E9F3940D618ADA3AA8945408EE4F21FD29F39406BB3EA73B5894540AACFD556EC9F39405D69520ABA894540B8533A58FF9F394048FAEDEBC08945401BCEFC6A0EA039409D0D32C9C88945401BEBE2361AA0394016F758FAD0894540298C2D0439A039404049BA66F2894540619CBF0985A03940EA8C28ED0D8A4540536F0D6C95A039404EEA0434118A45401A81785DBFA03940397BA015188A4540B65D68AED3A03940B98993FB1D8A454027B3412619A13940E4BE0E9C338A45406EF085C954A13940E4F8DA334B8A454051D0ED258DA1394000E4BD6A658A45406DF59CF4BEA139408E7615527E8A4540C27C7901F6A13940D55CA791968A4540DE6C73637AA23940384B02D4D48A4540A57EDE54A4A23940A3CDAACFD58A4540978BF84ECCA2394055FC1873D78A454025581CCEFCA2394071AD2F12DA8A4540884677103BA33940B859F5B9DA8A45404F3BFC3559A33940EA797077D68A454088D7F50B76A3394095662C9ACE8A4540327216F6B4A339402385EB51B88A454079758E01D9A33940B8E55C8AAB8A45408750A5660FA43940E3C325C79D8A454095B7239C16A43940A33C2CD49A8A4540DCD7817346A4394007603C83868A45406A6AD95A5FA43940F9DBD781738A45405C5A0D897BA43940F9BEF1B5678A45403FC6DCB584A4394079B0FECF618A45403F00A94D9CA4394080D5CA845F8A4540DB334B02D4A43940155322895E8A45401327F73B14A53940C05CC477628A45405A0D897B2CA539409561156F648A45405A0D897B2CA539409561156F648A45405A0D897B2CA539409561156F648A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (179, 0, NULL, '', '0102000020E610000063000000F0A7C64B379939400FB9196EC0874540A81DFE9AAC993940967840D9948745400B98C0ADBB9939406B7D91D096874540E04A766C049A3940F2CD3637A6874540B571C45A7C9A3940B28009DCBA8745408AEAAD81AD9A394040F67AF7C7874540ED12D55B039B3940EA39E97DE38745405E2EE23B319B3940382861A6ED874540ECFA05BB619B3940718A8EE4F287454033FE7DC6859B3940FFE21934F48745406C9A779CA29B3940B836548CF3874540236C787AA59C3940CD88D2DEE0874540CDCCCCCCCC9C39403F30478FDF874540126BF129009E3940AAB2EF8AE0874540E50AEF72119F394015359886E1874540BA66F2CD369F3940C763062AE38745407311DF89599F394095438B6CE78745406458C51B999F39402ADEC83CF2874540AA60545227A03940A31EA2D11D8845408D06F01648A03940D55B035B25884540C6BFCFB870A03940E3C281902C884540548CF337A1A0394047205ED72F8845408D45D3D9C9A039408ECC237F30884540C6FEB27BF2A039408ECC237F30884540A918E76F42A1394039B9DFA12888454028D53E1D8FA13940C0CFB87020884540D23AAA9A20A239405D55F65D11884540EE7C3F355EA23940E453008C6788454052DA1B7C61A239409DC420B072884540D2E80E6267A239400FC347C49488454099A3C7EF6DA23940F2A2AF20CD8845401995D40968A23940F2DC7BB8E488454027C286A757A23940A445B6F3FD8845404439D1AE42A23940CF7A3194138945407D0A80F10CA23940083411363C89454052F2EA1C03A239402B27DA5548894540999EB0C403A23940803A1E3350894540D200DE0209A23940B2777FBC5789454019CA897615A2394095E34EE960894540359886E123A2394031A3586E69894540C30DF8FC30A2394038E50AEF7289454018213CDA38A2394063FD9FC37C8945405FCD018239A239408E15359886894540981249F432A2394023B0726891894540981249F432A23940719EEA909B894540FC523F6F2AA23940AA1DFE9AAC894540B58993FB1DA239407F3F355EBA894540C3F0113125A2394014DA722EC58945405FB01BB62DA23940A974B0FECF894540B4E0455F41A239400CEF7211DF8945409769FB5756A23940D3A92B9FE5894540332905DD5EA239401A73D712F2894540DEF8DA334BA2394093B3B0A71D8A4540FB6F253B36A23940767632384A8A4540A6E8482EFFA139405214E813798A4540ED77280AF4A1394004603C83868A4540340708E6E8A1394019EC866D8B8A454018390B7BDAA13940AE69DE718A8A4540A7C64B3789A1394027DF6C73638A45402744C02154A13940BD22F8DF4A8A4540A7C1340C1FA1394092ED7C3F358A45401981785DBFA039407D2766BD188A4540C416821C94A03940281422E0108A454036A1100187A03940E88C28ED0D8A4540281DACFF73A03940C4B645990D8A45409DCDAACFD59E3940D95F764F1E8A45405739B4C8769E3940609335EA218A45403BF71E2E399E3940E0A128D0278A45409FA696ADF59D3940E7E3DA50318A45407515527E529D394059C51B99478A45402037C30DF89C39402EE7525C558A454067A9BC1DE19C39406E6E4C4F588A454020C32ADEC89C394043739D465A8A4540D9F97E6ABC9C3940A7D0798D5D8A4540D9DC989EB09C3940FCE3BD6A658A45409213ED2AA49C394067834C32728A45403CAE0D15E39C39406EC5FEB27B8A4540911804560E9D39408A7615527E8A4540582A6F47389D39403CA583F57F8A4540D7942BBCCB9D3940EED3F198818A4540D69942E7359E39404A0C022B878A45409DC893A46B9E39408A93FB1D8A8A45402B5BEB8B849E39407C4963B48E8A4540D59E5912A09E3940CA1AF5108D8A45409C93DE37BE9E3940359D9D0C8E8A4540FF9E1F46089F394091D5AD9E938A4540C6B08A37329F3940ADC090D5AD8A45409BD2C1FA3F9F3940103B53E8BC8A4540B8490C022B9F3940B41F2922C38A45401C6D1CB1169F39401FA2D11DC48A454080734694F69E3940914946CEC28A45401C166A4DF39E39405F0CE544BB8A4540381E3350199F3940A6B8AAECBB8A4540F1716DA8189F394051C24CDBBF8A4540F1716DA8189F394051C24CDBBF8A4540F1716DA8189F394051C24CDBBF8A4540F1716DA8189F394051C24CDBBF8A4540F1716DA8189F394051C24CDBBF8A4540F1716DA8189F394051C24CDBBF8A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (425, 0, NULL, '', '0102000020E61000000700000091DAC4C9FD9E39402F56D4601A8A4540472575029AA039400C630B410E8A45402E26361FD79E3940A2DB4B1AA3894540BFC11726539D39407FCB9C2E8B894540348AE596569B394015F241CF66894540420E4A98699B3940F901486DE2884540420E4A98699B3940F901486DE2884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (534, 0, NULL, '', '0102000020E6100000120000006024B4E55C9A39409A2A1895D48945402944C02154993940A83FFB91228A4540D3A414747B993940F62D73BA2C8A4540FC6F253B369A3940D25790662C8A4540ED2AA4FCA49A3940D908C4EBFA894540335019FF3E9B39400B7BDAE1AF8945405CACA8C1349C39400B7BDAE1AF894540E9B7AF03E79C3940DFF8DA334B8A454020D26F5F079E3940AD81AD122C8A454090DAC4C9FD9E39402D56D4601A8A4540462575029AA039400A630B410E8A4540D252793BC2A13940FB1D8A027D8A4540271422E010A239403CD52137C38945404417D4B7CCA1394060A6ED5F59894540085A8121ABA33940E0EEACDD76894540A08EC70C54A63940A6052FFA0A8A4540587380608EA6394035936FB6B9894540587380608EA6394035936FB6B9894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (554, 0, NULL, '', '0102000020E61000001200000083FFAD64C7A639406FF59CF4BE894540AEC090D5ADA6394004780B24288A4540D9648D7A88A639404B9869FB578A454074F4F8BD4DA739405F11FC6F258B454020F46C567DA6394051C763062A8B4540F6A10BEA5BA63940C3FA3F87F98A4540F8CC920035A5394067834C32728A4540FA1400E319A43940A03C2CD49A8A45406E04E275FDA23940FC05BB61DB8A454054B3075A81A13940B637F8C2648A454064B9A5D590A03940B76CAD2F128A4540E7797077D69E3940F7108DEE208A4540A345B6F3FD9C394077931804568A4540EB5BE674599C394023240B98C089454088A757CA329C39406AB3EA73B5894540EDA353573E9B3940DC5A5F24B48945406024B4E55C9A39409C2A1895D48945406024B4E55C9A39409C2A1895D4894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1133, 0, NULL, '', '0102000020E6100000CF0000006FC0E78711A23940605969520A8A4540A8CB6262F3A13940B54FC763068A454036D252793BA23940116BF129008A4540EF42739D46A23940A6E8482EFF894540B6FD2B2B4DA23940ED940ED6FF894540A8B393C151A239405817B7D1008A45400C11700855A2394074C8CD70038A4540E115C1FF56A239409079E40F068A45409A2F2FC03EA2394065F2CD36378A45408CC8B08A37A239402CCA6C90498A4540B78993FB1DA23940C8A65CE15D8A454070A301BC05A2394041AD69DE718A4540A9E8482EFFA139400868226C788A454029DA5548F9A13940F3F8BD4D7F8A45407ED0B359F5A13940B38EAA26888A4540D3A92B9FE5A1394017EC866D8B8A4540F03D5C72DCA13940F315A4198B8A4540D4C1FA3F87A13940DE32A7CB628A45409B25016A6AA13940E53A8DB4548A4540A952B3075AA13940D7D30E7F4D8A4540A9FB00A436A13940972F2FC03E8A45408D101E6D1CA139404941B797348A45400DE544BB0AA13940ED08A7052F8A45400D71AC8BDBA0394018E76F42218A4540D4D4B2B5BEA039407C2766BD188A4540546F0D6C95A03940271422E0108A45400DA661F888A039402E39EE940E8A4540FF21FDF675A03940C3B645990D8A4540D50451F701A03940B56CAD2F128A45408195438B6C9F394059518369188A4540E6797077D69E3940D95F764F1E8A454067BD18CA899E394019E76F42218A454075EACA67799E39403DBD5296218A4540D9F0F44A599E3940A11A2FDD248A454004B2D7BB3F9E39409AF56228278A45404C02D4D4B29D3940CC4FAA7D3A8A454069CBB914579D394037EF3845478A45400669C6A2E99C3940E215C1FF568A4540946A9F8EC79C394046739D465A8A4540BF0E9C33A29C39406224B4E55C8A4540B13385CE6B9C3940C681902C608A4540B1169F02609C3940CDA65CE15D8A45401557957D579C394029C286A7578A454032EBC5504E9C394054BD35B0558A454032CEDF84429C39405BE20165538A45405D72DC291D9C3940370C1F11538A4540330395F1EF9B3940A28EC70C548A4540D0DA6D179A9B3940E93A8DB4548A4540C28BBE82349B394077931804568A45402719390B7B9A394029C286A7578A45401BA37554359939408D1F63EE5A8A454063BEBC00FB983940B1F545425B8A45408052EDD3F19839408D1F63EE5A8A45400E8E9257E7983940DBF0F44A598A45400E71AC8BDB983940E93A8DB4548A45408E62B9A5D59839408D027D224F8A4540D50E7F4DD698394054A04FE4498A4540C7C4E6E3DA983940A996ADF5458A454039894160E5983940DBB628B3418A45400EAB7823F398394030AD86C43D8A45409C779CA2239939405B8B4F01308A4540C620B072689939409BD87C5C1B8A45407DD5CA845F9A39407F7901F6D189454052DF32A7CB9A394006560E2DB2894540355019FF3E9B394006560E2DB2894540D0531D72339C3940E27F2BD9B18945407AD15790669C3940BEA94885B18945408838D6C56D9C3940F7D1A92B9F8945400847C9AB739C3940D4DEE00B9389454041A9F6E9789C394006FF5BC98E8945400864AF777F9C3940C67762D68B89454016CB2DAD869C3940CD9C2E8B898945404F2D5BEB8B9C3940D4C1FA3F87894540FA36FDD98F9C3940943A014D84894540FA36FDD98F9C394054B3075A81894540DE85E63A8D9C3940142C0E677E8945402515C616829C3940F87AF7C77B894540C29A0304739C3940B8F3FDD4788945408A8A71FE269C39405CBBED4273894540E04603780B9C3940CE6262F37189454052B4AB90F29B394087B69C4B718945406F48DC63E99B3940F238454772894540D388D2DEE09B3940A467B3EA73894540B7D7BB3FDE9B39402B9B728577894540D46BEC12D59B39408FF84ECC7A89454062A79196CA9B39401D51DA1B7C894540378FFCC1C09B3940D6A414747B8945400C7767EDB69B3940484C89247A894540D3143AAFB19B3940E4EEACDD768945406FB75D68AE9B39408091D09673894540B6632310AF9B394064E0B9F7708945401AC1FF56B29B3940482FA3586E894540FEF202ECA39B39407A4F1E166A894540E2EA39E97D9B39405E9E077767894540C6E270E6579B39401E170E846489454038A2B437F89A3940338672A25D8945402CA089B0E199394073D39FFD488945409FCE4E0647993940BA627FD93D894540039BAC510F9939405605A3923A894540BCD100DE02993940322FC03E3A89454020F5108DEE9839402B0AF4893C8945406784F068E39839409DB1683A3B894540BC7A4E7ADF983940C8AC1743398945402E22C32ADE983940644F3BFC35894540AE13D044D89839405D0D897B2C89454059008C67D09839405DF0A2AF20894540E73B31EBC5983940A47F828B15894540BC06B64AB098394064DBA2CC06894540753D0AD7A398394056742497FF8845408330F0DC7B983940336475ABE7884540839F71E140983940330DC347C4884540586AF6402B983940173FC6DCB5884540E6A59BC42098394010FD135CAC88454011A14ACD1E983940FB70C971A7884540CAF484251E9839402D91442FA38845409FF9D51C20983940D158349D9D8845404A03780B2498394098F6065F988845403CD6C56D349839406DDE718A8E884540D8B2B5BE48983940B46D516683884540F480B229579839403B842A357B884540104FAF9465983940C9BFCFB87088454074AC8BDB689839401EB62DCA6C8845400205172B6A9839409EA73AE4668845402D00C63368983940D0C7B5A162884540ADF1D24D629839403408AC1C5A8845404A77103B53983940183AAFB14B88454003AE64C7469839401F42959A3D88454058A4C2D842983940ED04341136884540839F71E14098394098F1EF332E88454058A4C2D84298394091AF3DB3248845409106F01648983940CAF484251E884540BC1E85EB51983940DF63E943178845404A94F6065F983940D1FC6A0E10884540ADBC1DE1B49839407CAF5A99F0874540F3A7C64B3799394012B9196EC087454081CB9C2E8B993940E041EC4CA1874540D618ADA3AA993940E024068195874540C8CE143AAF993940997840D994874540BA847CD0B3993940E0240681958745403A936FB6B999394027D1CB28968745400188F4DBD7993940EE8B84B69C874540BA32E197FA993940FCF202ECA38745408FE59656439A39408A687407B187454072C5FEB27B9A3940B58009DCBA874540D55CA791969A3940A011A5BDC1874540473EE8D9AC9A394067CC5D4BC88745401C0E8464019B3940A78D23D6E28745407FDFF8DA339B394060FE43FAED874540FF449E245D9B394052B4AB90F2874540C639234A7B9B3940E00C37E0F3874540FFD51C20989B394004E31934F4874540F0E74D452A9C3940921EBFB7E98745401A22E010AA9C3940AFB2EF8AE087454053BED9E6C69C39404430478FDF8745406F1D554D109D39404430478FDF87454099C6681D559D394068062AE3DF874540186BF129009E3940AFB2EF8AE0874540B38BDB68009F39401A359886E1874540A57B0F971C9F394061E15D2EE2874540976B43C5389F39401310CCD1E387454025FE9AAC519F39402FC1E270E6874540410664AF779F3940AFCFD556EC874540DDFF39CC979F394053B4AB90F2874540328716D9CE9F394021B1169F028845401584640113A039402810AFEB17884540A316BCE82BA039405A4D10751F884540DCEC815660A03940A83B889D29884540311DACFF73A03940E8C281902C88454094B454DE8EA03940E19DB5DB2E8845403EF8C264AAA039406FF6402B30884540CCA70018CFA03940B6A206D3308845408552EDD3F1A0394092CC237F30884540E8EEACDD76A13940E080CF0F2388454084AEB6627FA1394012A14ACD1E884540120742B280A1394020EBE2361A88454084E882FA96A13940EEAD81AD12884540AF0018CFA0A13940D2FC6A0E10884540926CE7FBA9A13940AE2688BA0F884540CBCE143AAFA1394019A930B61088454004314278B4A13940EEAD81AD1288454020E25817B7A13940C3B2D2A414884540D935936FB6A13940919257E718884540BD847CD0B3A13940AD436E861B884540AF1DFE9AACA139408248BF7D1D884540934F01309EA1394010A14ACD1E88454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C02188454068545227A0A13940502844C021884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1193, 0, NULL, '', '0102000020E61000005F000000ADA8C1340CA73940DAACFA5C6D894540F437A11001A739404C7155D9778945401F166A4DF3A6394053B3075A81894540D812F241CFA63940363CBD5296894540CA37DBDC98A639408B89CDC7B589454003603C8386A63940AE7C96E7C1894540032670EB6EA63940CA4A9352D0894540209DBAF259A6394075711B0DE08945402EE7525C55A639408AFD65F7E489454012363CBD52A63940BC3AC780EC894540CB89761552A639403C49BA66F2894540F684251E50A6394075ABE7A4F789454092442FA358A63940832F4CA60A8A4540D99942E735A63940264EEE77288A45404C7155D977A539400A293FA9F689454069C6A2E9ECA4394026DA5548F9894540C0EC9E3C2CA4394018CA8976158A4540CF4E0647C9A33940DFBE0E9C338A454088DC0C37E0A339404A598638D6894540A553573ECBA339404A02D4D4B2894540979526A5A0A339406E47382D78894540174D672783A33940BCFBE3BD6A89454025B4E55C8AA3394099CE4E0647894540D144D8F0F4A23940BD4D7FF623894540C4BB5CC477A239409235EA211A894540C5995FCD01A23940F675E09C1189454045FAEDEBC0A1394061156F641E894540D3A92B9FE5A13940AF20CD5834894540B632E197FAA13940280AF4893C894540EF08A7052FA239408BA19C68578945404439D1AE42A23940120F289B72894540B6C35F9335A2394027F224E99A89454044E21E4B1FA2394067B3EA73B58945408BC8B08A37A23940FC87F4DBD7894540352905DD5EA23940AEF02E17F1894540276BD44334A23940747632384A8A4540601F9DBAF2A1394025361FD7868A4540FD87F4DBD7A13940AC69DE718A8A45406F9EEA909BA139409EC893A46B8A45400C59DDEA39A13940495E9D63408A454037A6272CF1A0394050499D80268A4540A99F3715A9A03940659B1BD3138A4540C6DCB5847CA03940A5052FFA0A8A45402A8C2D0439A03940A5CB6262F389454047E6913F18A0394089C3995FCD894540ABECBB22F89F3940491FBAA0BE8945400F45813E919F3940896CE7FBA9894540E6797077D69E3940EDACDD76A18945403C31EBC5509E3940C29448A2978945408369183E229E39402D17F19D98894540046EDDCD539D39405F1A868F8889454005F52D73BA9C3940112C0E677E894540059E7B0F979C39402DDD240681894540E995B20C719C3940B4F3FDD4788945404DD1915CFE9B3940C96262F3718945406A2BF697DD9B394057BBED42738945406A2BF697DD9B3940F37AF7C77B894540B18009DCBA9B394088F84ECC7A89454095B20C71AC9B3940E41379927489454087687407B19B3940D6ACFA5C6D894540328AE596569B39400FF241CF668945409847FE60E09939401D020EA14A894540B6EEE6A90E993940BA874B8E3B894540FD43FAEDEB983940013411363C8945402805DD5ED29839409EB94E232D8945402952616C21983940FBB27BF2B08845407E48BF7D1D98394066183E22A68845402952616C21983940D17D00529B884540546AF6402B9839409F409FC893884540C64B3789419839405877F354878845407172BF4351983940BCB7E9CF7E884540718FA50F5D9839408A7A884677884540E353008C67983940356744696F884540B8585183699839402E2592E8658845400D4FAF9465983940FCE7305F5E884540E21934F44F983940AEDCD26A4888454029A913D044983940D9BA9BA73A8845407E9F71E140983940FD73982F2F884540E2FC4D2844983940DA80CF0F238845408D06F016489839400CA14ACD1E884540C6681D554D9839401AEBE2361A8845409B8A54185B983940A101BC05128845407E4DD6A8879839408C588B4F0188454061105839B49839409A853DEDF087454035548CF3379939400CB9196EC08745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD8745409994826E2F993940A85B3D27BD874540', NULL, NULL);
INSERT INTO "tripshape" VALUES (642, 0, NULL, '', '0102000020E61000009D0000003BAFB14B549F3940DCDC989EB0884540024D840D4F9F3940BF4868CBB9884540ADE28DCC239F3940944DB9C2BB8845401F5036E50A9F39408D28ED0DBE8845409F077767ED9E3940D4D4B2B5BE884540032B8716D99E3940622D3E05C08845404A809A5AB69E394077B988EFC4884540BCD05CA7919E3940624A24D1CB884540AE2F12DA729E3940F7E461A1D6884540A0ABADD85F9E39401AD82AC1E288454059E20165539E39406FEB6E9EEA8845404B5E9D63409E3940BDD9E6C6F4884540BD57AD4CF89D39403D05C07806894540B0CE31207B9D39409252D0ED258945402259C0046E9D3940F6AFAC3429894540DB8F1491619D3940EF8AE07F2B894540CD0BB08F4E9D39402F12DA722E8945405B475513449D39409A94826E2F894540EA2B4833169D3940459E245D33894540BFF6CC92009D3940614F3BFC35894540DC6D179AEB9C3940A1D634EF3889454040AE0D15E39C3940BD874B8E3B89454095A46B26DF9C3940FD0E45813E894540074CE0D6DD9C394019C05B2041894540C09F1A2FDD9C39404BFDBCA948894540C09F1A2FDD9C3940CB28965B5A8945404EF8A57EDE9C39402F8672A25D8945404EF8A57EDE9C394093E34EE9608945405C423EE8D99C3940F7402B306489454023E010AAD49C39405B9E0777678945405C25581CCE9C394054793BC269894540310DC347C49C394006A8A9656B894540954DB9C2BB9C394006A8A9656B89454007BB61DBA29C394054793BC2698945406BFB57569A9C394030A3586E698945407945F0BF959C39409B25016A6A894540A4409FC8939C3940940035B56C89454032992A18959C39408DDB68006F894540F953E3A59B9C39403F0AD7A370894540C00E9C33A29C3940AA8C7F9F7189454087C954C1A89C394086B69C4B7189454087E63A8DB49C3940B1B14B546F894540DCF97E6ABC9C3940D5872EA86F894540EA60FD9FC39C3940400AD7A37089454023C32ADEC89C3940150F289B7289454087200725CC9C3940796C04E275894540322AA913D09C39402476A6D079894540C09F1A2FDD9C394088D382177D8945404E327216F69C39405DD8D30E7F8945405CB6D617099D3940EB305F5E80894540B025E4839E9D39405DF5B9DA8A8945406844696FF09D3940DD03ADC090894540E8E3DA50319E39401666DAFE958945402FE7525C559E394056EDD3F1988945404AF4328AE59E3940F2ACDD76A18945406653AEF02E9F3940C08C62B9A5894540F4599E07779F394047C02154A9894540F4936A9F8E9F3940D518ADA3AA8945409E4B7155D99F3940D535936FB689454081D4264EEE9F3940C7EBFA05BB8945409DA223B9FC9F3940B9A1629CBF8945402B1895D409A03940A432FE7DC689454047E6913F18A0394040F20703CF894540E3DF675C38A03940B2F02E17F18945408E06F01648A039409D81CAF8F7894540D5264EEE77A03940F9D6C056098A45400EA661F888A039403239EE940E8A4540556F0D6C95A039402B1422E0108A4540632D3E05C0A03940802766BD188A45402A05DD5ED2A03940003659A31E8A454046F0BF95ECA039403273BA2C268A45407FA99F3715A139405566834C328A45400D59DDEA39A139402A88BA0F408A4540C603CAA65CA139406A2C9ACE4E8A45400D0742B280A139407FD5CA845F8A4540FE4D2844C0A1394022F46C567D8A4540A89196CADBA13940D43FC1C58A8A4540E12D90A0F8A139401B096D39978A45406FDDCD531DA239409B3446EBA88A454099C0ADBB79A23940374B02D4D48A454019265305A3A23940A2CDAACFD58A45400B336DFFCAA2394054FC1873D78A45406E04E275FDA2394070AD2F12DA8A45400AFEB7921DA33940B759F5B9DA8A4540189F02603CA33940B759F5B9DA8A454098E7C1DD59A33940E9797077D68A45405FF92CCF83A33940A2B0C403CA8A4540510647C9ABA33940A9B8AAECBB8A4540431361C3D3A33940463EE8D9AC8A454026F3C81F0CA439404D46CEC29E8A4540510B5EF415A439405B90662C9A8A45402684471B47A4394006603C83868A4540B4169F0260A43940F8DBD781738A4540979F54FB74A439403846EBA86A8A4540D00182397AA439403F6BB75D688A4540DE68006F81A439402ADF6C73638A4540ECCF7EA488A4394055DA1B7C618A4540888F882991A43940EA577380608A454088AC6EF59CA43940A3ABADD85F8A4540A4D11DC4CEA43940382905DD5E8A454087CE6BEC12A539409C86E123628A4540CEB4FD2B2BA5394023BAA0BE658A454040963E7441A53940AAED5F59698A45405C47551344A539407FF2B0506B8A4540EA9FE06245A5394054F701486D8A4540BFA4315A47A5394029FC523F6F8A4540CD0BB08F4EA53940B754DE8E708A4540B0B14B546FA53940B02F12DA728A4540693F524486A539403763D174768A4540BE8C62B9A5A539408C7615527E8A454085F57F0EF3A539403EC269C18B8A45403EBD529621A639408CB0E1E9958A4540A171E14048A63940F74F70B1A28A454093442FA358A63940703997E2AA8A4540F6BEF1B567A6394085E2C798BB8A4540F6DBD78173A63940BE61DBA2CC8A4540F6DBD78173A63940B0174339D18A454021D7868A71A639403026361FD78A4540BD79AA436EA639408C5E46B1DC8A4540A1ABADD85FA63940E1718A8EE48A4540E83A8DB454A63940281E5036E58A4540BD22F8DF4AA639404CF4328AE58A45403DA06CCA15A63940F0BB22F8DF8A4540CBDB114E0BA63940CCE53FA4DF8A4540A0C37C7901A639401392054CE08A4540925CFE43FAA539405A3ECBF3E08A454084F57F0EF3A5394076EFE192E38A454084BBB376DBA539403DC780ECF58A4540BD00FBE8D4A539400482397AFC8A4540849ECDAACFA53940A04143FF048B454068EDB60BCDA53940D27EA4880C8B45403DF20703CFA539406E3EAE0D158B4540A14FE449D2A53940122384471B8B4540AFB6627FD9A53940D9DD3CD5218B4540AFB6627FD9A53940D9FA22A12D8B454004ADC090D5A53940B5412619398B454004ADC090D5A53940F502ECA3538B45403D0FEECEDAA53940D149EF1B5F8B454012143FC6DCA53940CA242367618B45402E90A0F831A63940D88BA19C688B454011E4A08499A639403CE97DE36B8B4540666B7D91D0A63940EE17EC866D8B454082734694F6A639408395438B6C8B4540C993A46B26A73940430E4A98698B45402C2B4D4A41A73940BCDA8AFD658B4540BAA0BE654EA73940587DAEB6628B4540481630815BA73940D149EF1B5F8B4540D6A8876874A73940B57BF2B0508B454039234A7B83A73940D20F2384478B4540E449D23593A739408421AB5B3D8B4540F2936A9F8EA739403D75E5B33C8B4540F2936A9F8EA739403D75E5B33C8B4540F2936A9F8EA739403D75E5B33C8B4540F2936A9F8EA739403D75E5B33C8B4540F2936A9F8EA739403D75E5B33C8B4540F2936A9F8EA739403D75E5B33C8B4540F2936A9F8EA739403D75E5B33C8B4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1155, 0, NULL, '', '0102000020E6100000EB000000B8EEE6A90E9939407333DC80CF87454080F623456498394041A4DFBE0E884540ABD4EC8156983940C1B2D2A414884540ABB706B64A983940AC436E861B8845407255D977459839409EF9D51C208845400EF8FC3042983940D75B035B25884540809F71E140983940C2EC9E3C2C884540C74B3789419839403BD6C56D3488454000AE64C746983940FB6BB2463D8845408E23D6E25398394082BC57AD4C88454063450DA661983940C985032159884540E353008C67983940D0C7B5A162884540B85851836998394050D6A88768884540B8585183699839408938D6C56D884540F19D98F562983940C29A030473884540E3361AC05B9839401ED31396788845408EAF3DB3249839402C745E63978845409CF9D51C2098394065D68BA19C884540C7F484251E983940BAE9CF7EA4884540E3A59BC4209839403AF8C264AA8845401C08C9022698394025895E46B18845408ECC237F30983940C14868CBB9884540B806B64AB098394064DBA2CC06894540B84082E2C798394056AEF02E17894540C6C4E6E3DA9839400F1F115322894540B8973446EB9839405D0D897B2C89454038C30DF8FC9839408F4AEA04348945408DF337A110993940F3A7C64B37894540B6F81400E3993940334CA60A46894540E0DBF4673F9A3940FA065F984C89454009A7052FFA9A3940AC52B3075A894540DE9387855A9B3940BAB9313D61894540A5FCA4DAA79B39405E9E077767894540FA0FE9B7AF9B394010CD751A6989454096CFF23CB89B394009A8A9656B894540EBE2361AC09B39407B4F1E166A89454040F67AF7C79B394057793BC26989454007B13385CE9B39407B4F1E166A894540CE6BEC12D59B3940E6D1C6116B89454007CE1951DA9B3940980035B56C89454087F9F202EC9B39402659C0046E894540F831E6AE259C3940FB5D11FC6F894540F736FDD98F9C3940E6EEACDD7689454005BB61DBA29C39403BE50AEF72894540CC920035B59C3940D7872EA86F894540F7AA9509BF9C3940FB5D11FC6F89454077B988EFC49C3940420AD7A370894540696FF085C99C39403BE50AEF7289454085200725CC9C3940E6EEACDD76894540BE823463D19C39404A4C89247A894540E99AC937DB9C394066FD9FC37C894540CC069964E49C3940ADA9656B7D894540A1629CBF099D3940110742B2808945404BAB21718F9D3940F47211DF89894540834C3272169E39401F8BA6B393894540111956F1469E3940ED6A2BF6978945402DE7525C559E39403417F19D988945400FE9B7AF039F3940A6DB4B1AA38945403975E5B33C9F39400A392861A6894540AAADD85F769F39404AC02154A9894540AAE7A4F78D9F3940D818ADA3AA89454071A25D85949F3940667138F3AB894540E2BD6A65C29F39402D2CF180B28945409B4B7155D99F3940B45FB01BB68945401B774A07EB9F3940823F355EBA8945409BA223B9FC9F3940BBA1629CBF894540291895D409A03940825C1B2AC6894540FE39CC9717A039401E1C25AFCE8945407038F3AB39A039404149BA66F28945401AD3139678A039401DADA3AA098A45409AFEEC478AA039403239EE940E8A4540536F0D6C95A039402B1422E0108A4540612D3E05C0A03940802766BD188A4540EF332E1C08A13940AB5CE15D2E8A4540C4724BAB21A139402446088F368A4540EEFE78AF5AA13940DDD30E7F4D8A4540FCD98F1491A13940D6E80E62678A4540FC4D2844C0A139406BA032FE7D8A4540EE3D5C72DCA13940D63FC1C58A8A45408AFD65F7E4A139401DEC866D8B8A45403524EEB1F4A13940B98EAA26888A4540603C8386FEA13940323E05C0788A454027F73B1405A2394047AD69DE718A4540FC6F253B36A23940E4F8DA334B8A45404356B77A4EA239403A7BA015188A45409869FB5756A239409779E40F068A45405F24B4E55CA2394034FF21FDF6894540A6D0798D5DA23940496E861BF08945408A1F63EE5AA239409E64E42CEC89454026C286A757A2394017312592E8894540D1AE42CA4FA23940DECEF753E38945405FEAE74D45A2394010EF7211DF894540ED08A7052FA2394009ADC090D589454051499D8026A239405EA31EA2D189454043E21E4B1FA239406CEDB60BCD894540357BA01518A23940338B89CDC789454043C5387F13A2394041D52137C3894540DF675C3810A23940C1C62E51BD894540510FD1E80EA23940CF10C7BAB8894540EDB1F4A10BA239403A7689EAAD894540B44FC76306A239400F5EF415A4894540428B6CE7FBA13940C89448A297894540DFF3C308E1A13940162C0E677E89454034EA211ADDA13940484C89247A89454018390B7BDAA139405696218E758945406D2F698CD6A139404F546F0D6C894540517E52EDD3A139406CE89FE0628945407C7901F6D1A1394041D00A0C59894540C325C79DD2A139403A8E588B4F8945407C7901F6D1A13940012C2B4D4A8945406E1283C0CAA139401EC05B2041894540A757CA32C4A139409EB1683A3B8945400B98C0ADBBA139401EA37554358945400B410E4A98A13940737CED992589454044696FF085A13940BA0BCD751A894540B6F3FDD478A139405ED3BCE3148945407D74EACA67A13940029BAC510F8945409AEB34D252A13940C9387F130A894540B7627FD93DA13940FB58FAD005894540B745990D32A1394090D651D504894540707CED9925A13940492A8C2D04894540D4BCE3141DA13940492A8C2D04894540F15014E813A139401E2FDD24068945409C3DD00A0CA139403AE0F3C30889454038E0F3C308A139407A67EDB60B89454038E0F3C308A13940FA75E09C118945409C3DD00A0CA139403AFDD98F14894540D59FFD4811A1394033D80DDB16894540B80BCD751AA1394008DD5ED2188945409B779CA223A139409635EA211A89454054E8BCC62EA139409635EA211A894540C6C9FD0E45A13940E4067C7E18894540A952B3075AA139400F022B87168945409A99999999A139408FF337A110894540D335936FB6A13940BAEEE6A90E8945400CD28C45D3A13940961804560E8945403641D47D00A239406B1D554D108945402719390B7BA239409635EA211A89454060EFFE78AFA2394064156F641E894540E037BEF6CCA239405DF0A2AF2089454099E2AAB2EFA2394079A1B94E238945407CAA436E86A33940397172BF43894540351B649291A339402B27DA55488945400A20B58993A339408F84B69C4B894540351B649291A33940813A1E3350894540A7C2D84290A33940338672A25D894540D2BD874B8EA3394056793BC2698945408B11C2A38DA33940160F289B72894540EF6E9EEA90A33940A467B3EA738945406133F9669BA339408091D096738945408C4B8E3BA5A339402B9B728577894540FE0FE9B7AFA339401D51DA1B7C8945408C687407B1A33940C85A7C0A80894540B7463D44A3A339405D12A0A6968945408C4B8E3BA5A339409D99999999894540A8367172BFA3394048C02154A9894540B6BAD573D2A3394001314278B48945407D758E01D9A33940336EA301BC894540FD8381E7DEA3394041D52137C389454019359886E1A339407A374F75C889454019359886E1A339408FC3995FCD894540FD8381E7DEA33940724C4F58E28945400BCE1951DAA339400E293FA9F68945401918B2BAD5A3394071A301BC058A45409909BFD4CFA339406A9B1BD3138A4540368FFCC1C0A339405C8B4F01308A4540C4E78711C2A33940783C66A0328A45406FF12900C6A339400695F1EF338A4540A853573ECBA339402A6BD443348A4540E1B5847CD0A33940783C66A0328A4540360395F1EFA33940A31A2FDD248A4540363D618907A439404E07EBFF1C8A45408B8A71FE26A43940874C3272168A4540A7E9EC6470A43940D500DE02098A4540B5E1E995B2A43940633C8386FE8945406E8CD651D5A4394071861BF0F9894540FC3B1405FAA43940EA525C55F68945409835EA211AA53940CEA145B6F389454026C8410933A53940631F9DBAF2894540A64ACD1E68A53940F177280AF4894540DFC9E02879A539407FD0B359F5894540D19C2E8B89A5394054D50451F7894540C38C62B9A5A53940B00D15E3FC894540A61518B2BAA539400C462575028A4540C200FBE8D4A53940852F4CA60A8A45406C614F3BFCA539405A518369188A45406C9B1BD313A63940F6108DEE208A4540085B25581CA63940369886E1238A4540A41A2FDD24A639400B9DD7D8258A45403290A0F831A6394099F56228278A454007B2D7BB3FA6394099F56228278A4540CE6C904946A639400B9DD7D8258A4540952749D74CA63940369886E1238A45405CE2016553A639401AE76F42218A454095442FA358A63940FE3559A31E8A4540404ED1915CA639400C80F10C1A8A4540F9A10BEA5BA63940FE1873D7128A454095442FA358A639403E8386FE098A454087DDB06D51A63940DB08C4EBFA894540F984251E50A6394030FF21FDF6894540A48EC70C54A639405BDDEA39E98945407993180456A639404651A04FE4894540F9A10BEA5BA63940C642AD69DE8945404ED235936FA63940869ECDAACF894540C0D05CA791A639407F3F355EBA8945406A31B1F9B8A639407F0569C6A2894540DC12F241CFA63940383CBD5296894540780CC85EEFA639402AB858518389454014CCD1E3F7A639403802F1BA7E894540309ACE4E06A739407F91D09673894540F75487DC0CA73940B8D617096D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D8945405BB2632310A73940DCACFA5C6D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (358, 0, NULL, '', '0102000020E6100000BF00000086E63A8DB49C39408ED13AAA9A88454006F52D73BA9C394095F6065F98884540B18A37328F9C394072033E3F8C884540BFB7E9CF7E9C39405D77F354878845404E7FF623459C39409DE1067C7E884540EBCA67791E9C3940563541D47D884540DDEF5014E89B394072E65773808845405DA79196CA9B3940003FE3C281884540327216F6B49B394095BC3AC780884540B2632310AF9B3940878F882991884540168733BF9A9B394039F8C264AA884540EB6E9EEA909B394007D847A7AE88454079AA436E869B394000B37BF2B0884540A4880CAB789B3940F268E388B5884540402B3064759B3940B9239C16BC884540C039234A7B9B394055E3A59BC4884540DCEA39E97D9B394015799274CD88454031FE7DC6859B39404EDBBFB2D288454023D1CB28969B394063670A9DD78845406A7D91D0969B3940551D7233DC8845404ECC7A31949B3940DC5031CEDF884540156A4DF38E9B39406384F068E3884540DCEA39E97D9B39408E7F9F71E1884540CE66D5E76A9B3940B97A4E7ADF884540DC59BBED429B3940C7C4E6E3DA884540B124404D2D9B3940873DEDF0D7884540A3DAA7E3319B3940553A58FFE7884540C06ED8B6289B394015D044D8F0884540162B6A300D9B394095FB1D8A02894540088A1F63EE9A39402AB3412619894540FA05BB61DB9A39403112DA722E894540CF0A0C59DD9A3940D5F6AFAC348945403368E89FE09A3940312FC03E3A89454008A7052FFA9A3940AA52B3075A8945406BEC12D55B9B3940B8B9313D61894540874B8E3BA59B394038C824236789454095CFF23CB89B3940E3D1C6116B89454040F67AF7C79B394055793BC269894540B2BAD573D29B394055793BC26989454007CE1951DA9B3940712A52616C894540799274CDE49B3940DCACFA5C6D894540CEC29E76F89B39406A0586AC6E894540DC80CF0F239C3940F85D11FC6F8945402232ACE28D9C3940E3EEACDD7689454085E63A8DB49C3940D5872EA86F894540CCAFE600C19C3940400AD7A370894540AF1BB62DCA9C39405CBBED4273894540F6C77BD5CA9C3940E3EEACDD76894540D9334B02D49C3940D5A414747B89454067A9BC1DE19C3940CE7F48BF7D894540CA5D4BC8079D3940EA305F5E80894540E58711C2A39D39407FCB9C2E8B89454056E20165539E39403117F19D9889454000486DE2E49E3940F1ACDD76A1894540AAADD85F769F394046C02154A9894540384030478F9F3940F8EE8FF7AA8945407F43A852B39F394078FD82DDB0894540549FABADD89F39408D89CDC7B5894540D4E76A2BF69F39409BF04BFDBC8945409BBF098508A03940F00390DAC4894540D43E1D8F19A03940CC4A9352D08945407038F3AB39A039403E49BA66F2894540C5BFCFB870A03940B74FC763068A454037A1100187A039400C630B410E8A4540536F0D6C95A03940281422E0108A45401A81785DBFA039405A518369188A4540B65D68AED3A03940FE3559A31E8A4540D2BCE3141DA139404C41B797348A45405F1A868F88A13940BD5CC477628A45406D9EEA909BA13940E874594C6C8A4540B4A1629CBFA1394021F46C567D8A45405EE5D022DBA13940AF69DE718A8A4540A5AE7C96E7A139401AEC866D8B8A45403324EEB1F4A1394093B8C7D2878A4540B332E197FAA139408C7615527E8A4540DE4A766C04A2394069834C32728A4540411CEBE236A23940777632384A8A4540DD15C1FF56A239404DCD1E68058A4540881F63EE5AA23940B10D15E3FC894540A4D0798D5DA239403824EEB1F4894540A4D0798D5DA23940943F1878EE894540DD15C1FF56A23940F05A423EE889454088027D224FA23940B7F81400E3894540C12ADEC83CA23940A99196CADB8945407A444C8924A23940F02076A6D089454097D87C5C1BA239404C3CA06CCA894540FB1873D712A239401AFF3EE3C2894540345EBA490CA23940A1F831E6AE89454051F2EA1C03A239403E7E6FD39F894540438B6CE7FBA139407EE882FA968945408A1A4CC3F0A13940E22879758E894540EE3D5C72DCA13940464C89247A8945406E2F698CD6A13940784F1E166A8945407C7901F6D1A1394063A6ED5F598945407C7901F6D1A13940B15A99F04B8945404317D4B7CCA13940159B8F6B4389454060AB048BC3A13940322FC03E3A894540EEE6A90EB9A13940B220CD5834894540A7E3310395A13940C04D7FF62389454052D0ED258DA1394087EB51B81E894540995FCD0182A1394007DD5ED218894540FD82DDB06DA13940D59FFD48118945402844C02154A13940EA0E62670A894540FD0E45813EA139401C2FDD240689454028ED0DBE30A139408ED651D50489454053CBD6FA22A139402354A9D903894540705F07CE19A139408ED651D50489454062F8889812A139404005C07806894540E2E995B20CA1394039E0F3C30889454037E0F3C308A139409D3DD00A0C89454037E0F3C308A13940B9EEE6A90E89454037E0F3C308A139401D4CC3F011894540454772F90FA139400F022B871689454028B3412619A1394008DD5ED2188945400B1F115322A139409635EA211A894540EEA7C64B37A139404F89247A198945406D9EEA909BA139408FF337A1108945406DD8B628B3A13940DDC4C9FD0E8945402666BD18CAA13940B9EEE6A90E89454089FD65F7E4A13940DDC4C9FD0E89454050F2EA1C03A239408FF337A11089454095E2AAB2EFA239407AA1B94E2389454078AA436E86A339403A7172BF43894540BF73EFE192A339402C27DA55488945403F65FCFB8CA339405DBBED4273894540862EA86F99A339408191D0967389454014A4198BA6A339407347382D788945403FBCAE5FB0A33940ACA9656B7D894540F80FE9B7AFA33940508E3BA583894540B1463D44A3A33940EC6A2BF6978945404D5DF92CCFA339402C2CF180B28945404D7ADFF8DAA339400873F4F8BD8945405BE15D2EE2A3394096E86514CB8945404D7ADFF8DAA33940E410AAD4EC894540CD6BEC12D5A33940B22AFBAE088A4540EAE2361AC0A3394080613255308A4540783BC269C1A33940793C66A0328A454023456458C5A339400795F1EF338A4540A353573ECBA339400795F1EF338A454023624A24D1A33940793C66A0328A4540CDA5B8AAECA3394056499D80268A4540B01188D7F5A33940F2EBC039238A4540CCFC6A0E10A4394079029A081B8A45404B10751F80A43940B94FC763068A4540CBAFE600C1A439406B614F3BFC894540120A117008A539405DFAD005F58945404BC3F01131A53940641F9DBAF289454059643BDF4FA53940CFA145B6F38945402EC03E3A75A539403A24EEB1F4894540BC35B05582A5394033FF21FDF68945402E34D769A4A539408F37328FFC8945408381E7DEC3A539402BF73B14058A4540BBAE5FB01BA6394015C2A38D238A454010DF89592FA639409CF56228278A4540650FB40243A63940781F80D4268A454081DDB06D51A63940639335EA218A4540489869FB57A6394047E21E4B1F8A4540ACF545425BA63940075B25581C8A45403A4ED1915CA63940CEF8F719178A4540D6F0F44A59A63940AB052FFA0A8A4540BA3FDEAB56A63940B94FC763068A454081DDB06D51A63940E42D90A0F88945409D8EC70C54A6394016312592E8894540489869FB57A639404F766C04E289454064834C3272A63940B3997CB3CD89454000603C8386A63940B37C96E7C1894540722497FF90A63940A51518B2BA89454047BA66F2CDA639403B3CBD5296894540D569A4A5F2A639409F5FCD018289454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D89454055B2632310A73940DFACFA5C6D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (375, 0, NULL, '', '0102000020E6100000B8000000F45487DC0CA73940B7D617096D894540F437A11001A739407047382D78894540D869A4A5F2A639407789EAAD818945404ABA66F2CDA639405A12A0A696894540F54F70B1A2A63940E8A4F78DAF8945402E5BEB8B84A639403DD52137C3894540E774594C6CA63940A04FE449D28945407593180456A63940207BBDFBE38945403C31EBC550A63940E02D90A0F889454091442FA358A63940605969520A8A45403C4ED1915CA63940EECEDA6D178A4540209DBAF259A63940B58993FB1D8A454012363CBD52A639403CBD5296218A4540767632384AA63940A01A2FDD248A4540F6673F5244A6394052499D80268A4540E800C11C3DA6394099F56228278A45405A8B4F0130A6394099F56228278A454093B3B0A71DA63940596E6935248A4540DA42908312A63940D23AAA9A208A45405AA31EA2D1A5394019ADA3AA098A4540CC2DAD86C4A539406EA301BC058A4540699604A8A9A539401990BDDEFD89454022CD58349DA53940FDDEA63FFB8945409457E71890A5394028DA5548F989454031C03E3A75A539405AFAD005F589454023E527D53EA53940611F9DBAF28945403112DA722EA53940611F9DBAF28945407867EDB60BA539405AFAD005F58945405C5F24B4E5A43940E12D90A0F8894540954DB9C2BBA43940AF0D15E3FC894540234F92AE99A439402F1C08C9028A45403208AC1C5AA43940A1E062450D8A45408850A5660FA439409AD87C5C1B8A4540330395F1EFA33940C5F01131258A45409709BFD4CFA33940773C66A0328A4540A553573ECBA339400595F1EF338A4540DE989EB0C4A339400595F1EF338A4540C2E78711C2A339403090A0F8318A4540348FFCC1C0A339405B8B4F01308A454009B13385CEA339408D71FE26148A4540D06BEC12D5A3394046A852B3078A45404230478FDFA339406A0A9DD7D88945405EE15D2EE2A33940D56F5F07CE894540B3D7BB3FDEA3394040D52137C3894540DED26A48DCA33940B9A1629CBF8945407A758E01D9A3394055448655BC89454025624A24D1A3394000314278B4894540429FC893A4A3394056EDD3F198894540FBF202ECA3A33940A4BE654E97894540D0143AAFB1A33940C85A7C0A80894540FB0FE9B7AFA3394088D382177D894540500647C9ABA339406C226C787A894540D0F753E3A5A33940507155D977894540ED8B84B69CA33940C93D963E748945404265FCFB8CA339405EBBED4273894540C273EFE192A3394049D8F0F44A894540341B649291A339400951F701488945400903CFBD87A339405E475513448945400A8A1F63EEA239407BA1B94E23894540EF940ED6FFA1394090F337A1108945407D96E7C1DDA13940FB75E09C11894540E1D6DD3CD5A13940F45014E813894540D36F5F07CEA1394010022B87168945400CB5A679C7A13940745F07CE1989454061AB048BC3A139401F69A9BC1D89454061AB048BC3A13940ED482EFF21894540EF0390DAC4A139409852D0ED258945408BC3995FCDA139401861C3D32B8945404451A04FE4A13940D8F6AFAC34894540C4995FCD01A23940FBE978CC40894540273108AC1CA2394042B324404D894540E0BE0E9C33A239403BAB3E575B89454035D252793BA239406DE89FE062894540FC8C0B0742A239409F25016A6A8945408AE5965643A23940E6EEACDD7689454018213CDA38A23940D8C1FA3F87894540981249F432A23940DF03ADC090894540981249F432A239402DF224E99A8945401804560E2DA2394009392861A68945408A8EE4F21FA2394097AE997CB3894540D13AAA9A20A23940E59C11A5BD8945400A9DD7D825A23940338B89CDC78945400ABABDA431A23940ECFBA9F1D2894540183E22A644A23940EC1890BDDE894540340C1F1153A23940B3D3484BE5894540B41A12F758A23940C85F9335EA894540A6D0798D5DA23940DDEBDD1FEF8945405F24B4E55CA23940ABCB6262F38945405F24B4E55CA2394079ABE7A4F7894540431CEBE236A239409C4C158C4A8A4540357BA01518A239409C86E123628A4540B54FC76306A23940FF00A436718A4540603C8386FEA13940313E05C0788A45403524EEB1F4A13940B88EAA26888A45406002B7EEE6A13940F815A4198B8A4540EE3D5C72DCA13940D43FC1C58A8A45409999999999A13940A2C893A46B8A4540A78C7F9F71A1394094442FA3588A45402744C02154A13940BF22F8DF4A8A454099779CA223A139408DC8B08A378A4540B6EEE6A90EA139407F613255308A45401A12F758FAA03940DB7C5C1B2A8A45400C54C6BFCFA03940B88993FB1D8A45401A81785DBFA039407F2766BD188A4540D39AE61DA7A03940B147E17A148A45400CA661F888A039403139EE940E8A4540D3264EEE77A03940F8D6C056098A45407038F3AB39A039403F49BA66F2894540544D10751FA039404D598638D6894540FF39CC9717A039408DC3995FCD894540E34EE960FD9F3940FF4D2844C0894540D5CA845FEA9F394014BD8C62B98945400EB9196EC09F394006560E2DB2894540F2936A9F8E9F3940D418ADA3AA8945402C26361FD79E3940A90018CFA08945401F80D4264E9E39400D410E4A988945409F1A2FDD249E3940E96A2BF697894540BDC11726539D3940621A868F888945405A25581CCE9C3940C65A7C0A80894540E84317D4B79C3940142C0E677E89454085C954C1A89C394030DD240681894540BEF1B567969C394054B3075A8189454093D920938C9C3940142C0E677E894540A106D3307C9C3940464C89247A8945404CD6A887689C39404D7155D977894540B0683A3B199C3940140F289B72894540F7BD4D7FF69B394086B69C4B718945404C97C5C4E69B3940140F289B728945403E30478FDF9B39405496218E7589454005CE1951DA9B3940DBC9E0287989454022624A24D19B3940D4A414747B894540773BC269C19B3940F87AF7C77B894540771EDC9DB59B3940DCC9E02879894540220B98C0AD9B39405CBBED427389454014C1FF56B29B39400083DDB06D8945405B33F9669B9B39400ECD751A6989454014D9CEF7539B394040EDF0D764894540947329AE2A9B3940B9B9313D6189454031A2B437F89A3940555C55F65D89454006A7052FFA9A3940877CD0B359894540EABB22F8DF9A3940A4D634EF38894540F805BB61DB9A394008172B6A30894540068A1F63EE9A394008DD5ED218894540142B6A300D9B394073253B360289454069787AA52C9B3940FA1E2E39EE884540A2DAA7E3319B3940336475ABE7884540B024404D2D9B3940883DEDF0D7884540AFEF8AE07F9B3940B35582C5E1884540CBBD874B8E9B39406584F068E3884540677D91D0969B3940C19F1A2FDD884540D9240681959B3940883DEDF0D7884540BD560916879B3940BA5D68AED3884540DAEA39E97D9B39403A4F75C8CD88454085D7F50B769B3940DEF97E6ABC884540BE39234A7B9B394065105839B4884540687D91D0969B394057A9D903AD884540DA41EC4CA19B39402C91442FA3884540AF632310AF9B39401E0DE02D908845402F7216F6B49B3940DE68006F8188454068F12900C69B39402515C616828845405972DC291D9C39407A0B24287E8845404B7FF623459C39409EE1067C7E88454020F8DF4A769C3940AC4885B185884540CA751A69A99C3940816ABC74938845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D918845409130D3F6AF9C3940AC656B7D91884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (660, 0, NULL, '', '0102000020E6100000A5000000E549D23593A73940A5F78DAF3D8B4540BA1457957DA739407A19C5724B8B4540481630815BA73940CF49EF1B5F8B45402C4833164DA73940567DAEB6628B4540E57E87A240A73940DDB06D51668B4540E544BB0A29A739401D386744698B454082734694F6A639408195438B6C8B45401FBFB7E9CFA63940C84109336D8B4540BDE82B4833A63940D68BA19C688B454013143FC6DCA53940C8242367618B4540680A9DD7D8A539408FC2F5285C8B45404C598638D6A539403AAFB14B548B454005ADC090D5A53940FAEDEBC0398B4540B0B6627FD9A539401EA7E8482E8B4540F7622827DAA53940890CAB78238B454014F758FAD0A53940F4716DA8188B4540F845425BCEA5394009E1D1C6118B4540B1997CB3CDA53940D7A3703D0A8B4540CD4A9352D0A5394033BF9A03048B454006ADC090D5A5394097FF907EFB8A4540B0F02E17F1A53940251E5036E58A4540144E0B5EF4A539402C431CEBE28A45404DB0389CF9A539407A14AE47E18A4540CDBE2B82FFA539400F92054CE08A45404DCD1E6805A63940EBBB22F8DF8A4540E98C28ED0DA63940C7E53FA4DF8A454014A5BDC117A63940EBBB22F8DF8A454005CFBD874BA6394047F4328AE58A4540A1ABADD85FA63940B99BA73AE48A45402F211FF46CA63940F2E0EEACDD8A4540F6DBD78173A639405D46B1DCD28A45403D889D2974A639408F662C9ACE8A454021D7868A71A639407ADAE1AFC98A45402F211FF46CA63940489D8026C28A4540E857738060A63940C14CDBBFB28A454093442FA358A639406C3997E2AA8A4540E81DA7E848A639403AFC3559A38A45408569183E22A6394088B0E1E9958A4540050473F4F8A53940C81AF5108D8A4540B0997CB3CDA539407307B133858A45404DE5ED08A7A53940AC4CF8A57E8A4540B1EB17EC86A539405739B4C8768A45406A0586AC6EA53940D005F52D738A45405C643BDF4FA53940B454DE8E708A4540F9CC920035A53940D82AC1E2708A45405DD3BCE314A53940B454DE8E708A45404FDBBFB2D2A43940D005F52D738A4540330DC347C4A439405E5E807D748A45406C3524EEB1A43940C2BB5CC4778A4540A55D85949FA43940024356B77A8A4540D01E680586A43940B471C45A7C8A45402684471B47A43940DF89592F868A454098B7239C16A439407B6649809A8A45406D9F8EC70CA43940029A081B9E8A45405FC47762D6A339401E680586AC8A454043F67AF7C7A33940101E6D1CB18A454027287E8CB9A339406C567DAEB68A4540EE8B84B69CA3394001F1BA7EC18A45402797FF907EA339404FDF32A7CB8A4540D249EF1B5FA33940324B02D4D48A45400B8F368E58A33940075053CBD68A4540EFA353573EA33940B259F5B9DA8A45400CFEB7921DA33940B259F5B9DA8A45407004E275FDA239408E831266DA8A45401B265305A3A239409CCDAACFD58A4540E26C73637AA23940314B02D4D48A4540F1B1F4A10BA23940F8743C66A08A4540C725C79DD2A13940DC89592F868A4540E4455F419AA13940C09E76F86B8A45401D34F44F70A1394024C286A7578A4540646C21C841A1394088E59656438A454001B8921D1BA13940256BD443348A45402C05DD5ED2A03940D75F764F1E8A45401E81785DBFA039407B2766BD188A4540AC9F3715A9A03940AD47E17A148A4540575227A089A039402D39EE940E8A4540BB75374F75A039408954185B088A454003917EFB3AA039405E1F9DBAF289454075FE261422A03940F4622827DA8945406797A8DE1AA0394034CD3B4ED189454075E1404816A0394089C3995FCD894540BC7020240BA03940C208E1D1C689454075A774B0FE9F394042FAEDEBC0894540923BA583F59F3940BBC62E51BD894540AFCFD556EC9F39409F1518B2BA894540BDFC87F4DB9F3940F40B76C3B6894540F6936A9F8E9F3940F4EE8FF7AA894540BE7EC16ED89E3940A60018CFA0894540B1D85F764F9E39400A410E4A98894540BFCB457C279E3940E66A2BF6978945404E1FBAA0BE9D39406D8104C58F8945404F1AA375549D39405F1A868F888945407BD66EBBD09C39409F8499B67F89454042575BB1BF9C3940112C0E677E894540173FC6DCB59C394058D8D30E7F89454034D3F6AFAC9C3940C35A7C0A8089454051672783A39C394051B3075A81894540FC53E3A59B9C394051B3075A81894540EEEC6470949C39402DDD240681894540B58A37328F9C39409F8499B67F8945400A8195438B9C3940CA7F48BF7D8945400A8195438B9C3940D1A414747B894540DF85E63A8D9C3940D8C9E0287989454043E3C281909C3940DFEEACDD76894540FC36FDD98F9C394083B69C4B71894540E085E63A8D9C394003A8A9656B8945408B8F8829919C39400ACD751A69894540C4F1B567969C39407C74EACA678945404400A94D9C9C3940589E077767894540FDAA9509BF9C394051793BC2698945400B12143FC69C39400ACD751A6989454019799274CD9C39409F4ACD1E688945409987855AD39C39408399B67F658945408B3DEDF0D79C39401F3CDA3862894540C49F1A2FDD9C3940CA28965B5A894540C49F1A2FDD9C39405122895E468945400B4CE0D6DD9C394018C05B2041894540E05031CEDF9C3940B4627FD93D894540D2069964E49C394098B1683A3B8945400B69C6A2E99C3940E682FA9639894540C4D9E6C6F49C3940EDA7C64B378945406F006F81049D394018A37554358945407DA1B94E239D3940B445990D328945408B5FEAE74D9D39402D12DA722E894540273CDA38629D3940C9B4FD2B2B894540A767B3EA739D3940655721E5278945400ACAA65CE19D3940BB13B35E0C8945403473BA2C269E394082949F54FB884540970A630B419E394097030473F4884540C222F8DF4A9E394017F5108DEE88454034E7525C559E39400269C6A2E9884540A6ABADD85F9E3940825AD3BCE3884540B42F12DA729E3940F4E461A1D68845403478D157909E3940A6F6E978CC884540DF9E5912A09E39401FC32ADEC8884540C2270F0BB59E3940988F6B43C5884540C261DBA2CC9E3940115CACA8C1884540B4342905DD9E39403C575BB1BF884540EDB33C0FEE9E3940D1D4B2B5BE884540346002B7EE9E3940759CA223B9884540A6077767ED9E3940E0016553AE8845405F5BB1BFEC9E394084C954C1A888454043AA9A20EA9E3940B6E9CF7EA4884540C39BA73AE49E39407662D68BA18845405F5BB1BFEC9E3940A15D85949F884540514BE5ED089F39403D00A94D9C8845408AE7DEC3259F3940FD78AF5A99884540ED61A1D6349F3940214F92AE99884540A6D2C1FA3F9F39408CD13AAA9A88454018971C774A9F394061D68BA19C88454026FE9AAC519F3940E8094B3CA08845408A5B77F3549F3940BD0E9C33A288454018B40243569F3940B6E9CF7EA48845405F60C8EA569F3940A17A6B60AB88454043AFB14B549F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540EE9B6D6E4C9F3940DADC989EB0884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (609, 0, NULL, '', '0102000020E6100000E30000006A6FF085C99C3940713D0AD7A38845406A6FF085C99C394031B610E4A088454086200725CC9C3940A35D85949F88454078D66EBBD09C394038DBDC989E8845406A8CD651D59C39401405FA449E884540A3EE0390DA9C39407F87A2409F8845404EF8A57EDE9C394031B610E4A08845404EF8A57EDE9C394006BB61DBA2884540DC6D179AEB9C39401422E010AA884540319E4143FF9C3940C66D3480B788454006A3923A019D394022A64412BD884540319E4143FF9C3940145CACA8C1884540B18F4E5DF99C394078B988EFC48845405CCEA5B8AA9C3940543A58FFE7884540CE751A69A99C39404D158C4AEA884540EA263108AC9C394046F0BF95EC88454086E63A8DB49C394014D044D8F088454069520ABABD9C394030815B77F3884540BE654E97C59C39407008556AF6884540BE823463D19C3940CC4065FCFB884540853DEDF0D79C3940C51B9947FE88454030478FDFDB9C39400CC85EEFFE88454069A9BC1DE19C3940309E4143FF884540306475ABE79C3940A245B6F3FD88454069C6A2E9EC9C3940A96A82A8FB884540E9F17B9BFE9C3940F0F96184F088454069006F81049D394069C6A2E9EC88454030BB270F0B9D394094C151F2EA88454085CE6BEC129D3940E292E34EE9884540687407B1339D3940543A58FFE78845405A2A6F47389D3940306475ABE7884540F6065F984C9D394045D3D9C9E0884540598121AB5B9D3940C5C4E6E3DA88454012F241CF669D39401ABB44F5D68845402059C0046E9D394045B6F3FDD488454003560E2DB29D3940FEEC478AC888454075543541D49D39405A087250C288454003CAA65CE19D3940A8D903ADC0884540915CFE43FA9D3940A8D903ADC0884540F4D6C056099E39405A087250C2884540741F80D4269E39404CBED9E6C6884540900A630B419E3940F0A2AF20CD88454002ECA353579E3940DB334B02D4884540AC2F12DA729E3940D40E7F4DD68845402C043928619E3940F701486DE2884540D7B628B3419E3940772D211FF4884540C94FAA7D3A9E39404C327216F68845401183C0CAA19D3940683A3B191C8945402EC03E3A759D394021AB5B3D27894540AE946588639D3940CCB4FD2B2B894540CB0BB08F4E9D39403012DA722E8945401244DD07209D3940DB1B7C613289454068006F81049D39401BA3755435894540762D211FF49C3940147EA99F3789454093C151F2EA9C3940A2D634EF388945405A5F24B4E59C394077DB85E63A89454068A9BC1DE19C39404CE0D6DD3C8945404CF8A57EDE9C39408C67D0D03F894540BE9F1A2FDD9C3940CCEEC9C342894540BE9F1A2FDD9C39402844C02154894540BE9F1A2FDD9C3940EFFE78AF5A894540054CE0D6DD9C3940B6B9313D61894540F7E461A1D69C394012F241CF66894540A2D11DC4CE9C394052793BC269894540BF654E97C59C3940E0D1C6116B89454023A64412BD9C394004A8A9656B8945401505FA449E9C39400BCD751A69894540234F92AE999C39402FA3586E69894540EAEC6470949C39409A25016A6A8945405C94D920939C3940DAACFA5C6D89454095F6065F989C3940F65D11FC6F894540EA094B3CA09C394084B69C4B718945403F1D8F19A89C394084B69C4B71894540143FC6DCB59C3940AFB14B546F8945403F575BB1BF9C3940F65D11FC6F8945404DBED9E6C69C394084B69C4B71894540F8C77BD5CA9C3940C43D963E74894540EA7DE36BCF9C3940D9C9E02879894540B1389CF9D59C3940D2A414747B894540064CE0D6DD9C394084D382177D8945400669C6A2E99C3940EF552B137E8945405BB6D617099D3940E8305F5E80894540132C0E677E9D3940611A868F8889454092D09673299E3940CCB9145795894540E71DA7E8489E3940E86A2BF697894540E73A8DB4549E39402F17F19D98894540D82FD80DDB9E3940A80018CFA0894540E644BB0A299F39409AB67F65A5894540ADADD85F769F394045C02154A9894540663BDF4F8D9F3940D318ADA3AA894540579FABADD89F3940AF5FB01BB6894540C980ECF5EE9F3940E8C1DD59BB894540BB533A58FF9F394044FAEDEBC0894540E66BCF2C09A03940598638D6C589454074E1404816A03940AE997CB3CD8945406697A8DE1AA0394059A31EA2D1894540C9116BF129A039404B766C04E28945402C8C2D0439A039401973D712F28945408F7A884677A03940D200DE02098A45400FA661F888A039402E39EE940E8A45402B745E6397A03940271422E0108A4540642D3E05C0A039407C2766BD188A45402B05DD5ED2A03940FC3559A31E8A454055AEF02E17A13940981249F4328A45409C081B9E5EA13940ADD85F764F8A4540B8A1629CBFA1394042CA4FAA7D8A4540F13D5C72DCA13940D03FC1C58A8A4540D4A92B9FE5A13940F415A4198B8A45407FD0B359F5A1394090B8C7D2878A45402ADA5548F9A1394017CFA0A17F8A4540B84FC76306A23940B454DE8E708A4540461CEBE236A23940747632384A8A4540713480B740A239404941B797348A4540E315C1FF56A239406DA301BC058A4540AAD0798D5DA2394058FAD005F5894540AAD0798D5DA23940FCC1C073EF8945402AC286A757A23940EE5A423EE8894540D5AE42CA4FA23940FCA4DAA7E3894540D5915CFE43A23940E71890BDDE89454063B01BB62DA23940E0D6DD3CD5894540D53AAA9A20A23940AE997CB3CD894540397BA01518A2394052616C21C8894540001973D712A239403DD52137C38945400E630B410EA23940F60B76C3B68945401CADA3AA09A23940AF42CA4FAA894540E34A766C04A23940CCD6FA22A189454000DFA63FFBA139407EE882FA9689454055B81E85EBA13940A9C64B3789894540AA9196CADBA139407047382D78894540E3D6DD3CD5A13940E9F692C668894540C725C79DD2A13940867CD0B359894540F22076A6D0A139404DFDBCA948894540C708E1D1C6A13940B8627FD93D894540D552793BC2A13940C6AC174339894540F2E6A90EB9A13940B120CD58348945400F410E4A98A13940717CED992589454056B3075A81A13940E3067C7E188945409D25016A6AA139406A1D554D10894540C8E6E3DA50A139407F8CB96B09894540BA627FD93DA13940F858FAD005894540737CED9925A139402354A9D9038945401E69A9BC1DA139406A006F810489454057AEF02E17A13940D582177D05894540E5E995B20CA13940150A117008894540818CB96B09A1394055910A630B894540F3332E1C08A13940009BAC510F894540C8387F130AA13940ABA44E40138945401D4CC3F011A1394056AEF02E17894540ABC1340C1FA139404F89247A198945409D94826E2FA139409635EA211A894540565C55F65DA139400F022B871689454047A33B889DA139406B1D554D1089454055448655BCA13940B9EEE6A90E89454063E5D022DBA13940B9EEE6A90E89454055F2EA1C03A239408EF337A1108945405336E50AEFA2394079A1B94E238945407DAA436E86A33940397172BF438945404465FCFB8CA339405522895E46894540361B649291A3394071D39FFD488945400B20B58993A339408D84B69C4B894540361B649291A339409BEB34D252894540A8C2D84290A33940BEDEFDF15E8945408C11C2A38DA339403E0AD7A3708945401A6A4DF38EA339407E91D096738945401A8733BF9AA339407E91D096738945406150DF32A7A339407047382D78894540FD0FE9B7AFA3394085D382177D8945408B687407B1A339400C0742B280894540FDF202ECA3A33940C59448A2978945403655302AA9A33940B74AB0389C89454044D9942BBCA3394070BBD05CA78945407D58A835CDA33940E27F2BD9B1894540527ADFF8DAA339400573F4F8BD8945408BDC0C37E0A33940C508E1D1C689454060E15D2EE2A3394061C8EA56CF89454035C9C859D8A339409A81CAF8F78945401918B2BAD5A3394028F73B14058A454044F67AF7C7A33940619335EA218A4540EFE2361AC0A33940C40DF8FC308A4540C4E78711C2A33940763C66A0328A454099ECD808C4A33940E1BE0E9C338A45408BA2409FC8A33940286BD443348A45407D58A835CDA339400495F1EF338A4540EF56CF49EFA33940E8C6F484258A4540EFAD81AD12A439402F56D4601A8A454052F38E5374A43940AF2AFBAE088A4540E0F97E6ABCA43940AF0D15E3FC8945400AC078060DA539405AFAD005F58945400A172B6A30A53940611F9DBAF289454034C03E3A75A539405AFAD005F5894540A5DB4B1AA3A5394068614F3BFC89454041D52137C3A5394028F73B14058A4540240C3CF71EA639407D444C89248A4540EBE3DA5031A6394099F56228278A4540A454FB743CA6394099F56228278A4540B2BB79AA43A6394052499D80268A4540797632384AA63940A01A2FDD248A454007ECA35357A6394067B8019F1F8A4540B2F545425BA63940035B25581C8A4540404ED1915CA639407C2766BD188A454095442FA358A63940A7052FFA0A8A45404031EBC550A6394027DA5548F9894540A48EC70C54A6394084D89942E78945404F9869FB57A639404B766C04E289454088FA96395DA6394059C0046EDD894540168DEE2076A63940D9942BBCCB894540C0D05CA791A639407D3F355EBA894540F8C308E1D1A6394061376C5B9489454022166A4DF3A6394053B3075A818945407729AE2AFBA639401A51DA1B7C894540E9ED08A705A739407E91D09673894540A24143FF04A73940BEFBE3BD6A8945403EE466B801A73940FE65F7E461894540B0A8C1340CA73940A96F99D36589454085AD122C0EA73940BEFBE3BD6A894540B0A8C1340CA73940930035B56C8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D8945405BB2632310A73940DAACFA5C6D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (625, 0, NULL, '', '0102000020E6100000DC000000F45487DC0CA73940B7D617096D894540E6ED08A705A73940C53D963E7489454011CCD1E3F7A63940132C0E677E894540D812F241CFA639401366DAFE958945404A63B48EAAA639403E9B559FAB894540BCB376DB85A63940B07C96E7C1894540E774594C6CA63940A24FE449D28945404B9869FB57A639404D766C04E289454059E2016553A639405BDDEA39E989454084DDB06D51A63940E22D90A0F8894540D9F0F44A59A63940852F4CA60A8A45403D4ED1915CA639405A518369188A45406849809A5AA6394093B3B0A71D8A4540F684251E50A63940CC15DEE5228A45404B5E9D6340A639409AF56228278A4540E8E3DA5031A639409AF56228278A4540210C3CF71EA639407E444C89248A4540DA942BBCCBA53940697E3507088A45409391B3B0A7A53940F7B9DA8AFD89454030C03E3A75A539403724EEB1F4894540DB1B7C6132A53940621F9DBAF28945405BD3BCE314A53940144E0B5EF48945405BB6D61709A539405BFAD005F58945403F575BB1BFA439408D37328FFC89454079B471C45AA439407F0A80F10C8A4540325A475513A439403156D4601A8A454024B9FC87F4A33940F1EBC039238A454008B13385CEA33940E3BE0E9C338A4540A453573ECBA339400795F1EF338A454024456458C5A339400795F1EF338A4540C0E78711C2A339409C1249F4328A4540793BC269C1A33940A33715A9308A45401518B2BAD5A339402AF73B14058A45409526A5A0DBA33940F15A423EE889454015359886E1A339403FF20703CF89454015359886E1A339402A66BD18CA894540DCD26A48DCA3394095CB7F48BF89454087BF266BD4A33940638E1EBFB78945409509BFD4CFA339404E02D4D4B2894540EBA86A82A8A339409574CDE49B894540B2463D44A3A33940C79448A297894540F90FE9B7AFA33940E40B93A98289454087687407B1A33940A48499B67F89454040BCAE5FB0A3394088D382177D894540874B8E3BA5A339402C9B728577894540CEDA6D179AA339408191D0967389454079C7293A92A33940A567B3EA73894540156A4DF38EA339408191D096738945408711C2A38DA33940F338454772894540A3C2D84290A339409E081B9E5E894540311B649291A3394073F085C9548945400620B58993A339409084B69C4B894540BF73EFE192A3394097A98251498945404DAF946588A33940821D386744894540868043A852A339408200529B38894540C0DD59BBEDA2394057CBD6FA2289454079BDFBE3BDA23940D09717601F894540A4272CF180A23940DEE1AFC91A8945407AED992501A2394090F337A110894540330708E6E8A13940B4C91AF510894540A59196CADBA139404222A6441289454033CD3B4ED1A1394082A99F3715894540970D32C9C8A1394009DD5ED2188945405EAB048BC3A13940FB92C6681D89454017FF3EE3C2A13940C24D7FF623894540B3BE4868CBA13940890838842A8945404F7E52EDD3A1394057E8BCC62E894540B2F81400E3A13940B320CD583489454007630B410EA23940334CA60A46894540F93559A31EA23940AC35CD3B4E894540A45CE15D2EA239408FA19C685789454032D252793BA239400166F7E461894540B2E0455F41A2394008A8A9656B89454087E5965643A23940C118CA897689454007D7A3703DA2394056B3075A81894540951249F432A23940728104C58F894540951249F432A239402BF224E99A89454087ABCABE2BA239409691B3B0A7894540878EE4F21FA23940B9847CD0B389454015E76F4221A23940004E2844C0894540234EEE7728A2394095E86514CB89454006BABDA431A23940A34FE449D289454031D252793BA239408EE07F2BD9894540F88C0B0742A239408096E7C1DD89454023A5A0DB4BA239404E766C04E28945400611700855A23940402CD49AE68945403F739D465AA2394055B81E85EB894540A3D0798D5DA239408E1A4CC3F08945405C24B4E55CA2394032FF21FDF689454040739D465AA23940F9B9DA8AFD894540C064AA6054A23940AB052FFA0A8A4540401CEBE236A2394055A04FE4498A45404E2CB7B41AA2394031043928618A45405C5969520AA2394054F701486D8A4540A3E8482EFFA139400D68226C788A45406A861BF0F9A139401BCFA0A17F8A45403124EEB1F4A1394094B8C7D2878A45405C02B7EEE6A13940F815A4198B8A454031EA211ADDA13940F815A4198B8A4540F84D2844C0A1394046CA4FAA7D8A45409599999999A13940C69E76F86B8A45405CC3D32B65A13940CD897615528A45404EE8BCC62EA139405BA835CD3B8A454007022B8716A13940783C66A0328A45402405DD5ED2A03940DC5F764F1E8A45401681785DBFA03940802766BD188A4540A49F3715A9A03940B247E17A148A45404F5227A089A039403239EE940E8A4540FA21FDF675A03940B22AFBAE088A4540B3E4B8533AA03940641F9DBAF289454017EBE2361AA039405DA31EA2D189454025357BA015A039404817D4B7CC8945408975711B0DA0394056616C21C889454097A223B9FC9F3940BAA1629CBF894540EC7B9BFEEC9F3940A51518B2BA894540FAA84D9CDC9F39401EE25817B7894540254D4A41B79F39407AFD82DDB0894540334030478F9F3940FAEE8FF7AA894540C2B08A37329F3940E562450DA68945406DD2FBC6D79E3940892A357BA08945401980D4264E9E39403417F19D988945402773BA2C269E3940ED6A2BF6978945407D640113B89D3940748104C58F8945403644A33B889D3940C97762D68B894540451AA375549D3940651A868F8889454054B6D617099D3940508E3BA58389454071B988EFC49C39405ED8D30E7F894540D5F97E6ABC9C39403A02F1BA7E89454047840D4FAF9C3940A58499B67F8945408E13ED2AA49C394057B3075A818945401C4F92AE999C394057B3075A81894540C73B4ED1919C3940EC305F5E80894540472D5BEB8B9C3940F3552B137E894540472D5BEB8B9C39406C226C787A89454039E3C281909C3940E5EEACDD7689454039E3C281909C394089B69C4B718945401D32ACE28D9C3940BBD617096D894540AB8A37328F9C39409F25016A6A8945400FE81379929C3940CA20B07268894540D6A2CC06999C39405F9E0777678945409D5D85949F9C39405F9E077767894540F2AA9509BF9C394058793BC26989454047BED9E6C69C394011CD751A69894540E37DE36BCF9C39403CC8242367894540D5334B02D49C394043EDF0D764894540C7E9B298D89C3940BCB9313D6189454072F35487DC9C3940D128965B5A894540B99F1A2FDD9C394018B875374F894540B99F1A2FDD9C39403C7172BF4389454047F8A57EDE9C3940B53DB3244089454063A9BC1DE19C39402E0AF4893C894540E3B7AF03E79C3940352FC03E3A894540F11E2E39EE9C3940602A6F473889454063006F81049D394020A3755435894540FF162B6A309D394052C3F0113189454062AED3484B9D394059E8BCC62E8945400DD55B035B9D3940600D897B2C8945400D0F289B729D3940922D043928894540F045425BCE9D3940B6C91AF5108945408C0A630B419E3940A1030473F4884540FEEBA353579E39407E103B53E8884540F0DBD781739E3940FEE461A1D688454070931804569E3940BE5D68AED38845409B71E140489E39403005DD5ED2884540D45F764F1E9E3940E95817B7D18845403866A032FE9D3940372AA913D0884540718E01D9EB9D3940372AA913D0884540E31890BDDE9D39407ED66EBBD088454047E5ED08A79D39401371AC8BDB884540477155D9779D3940F6DC7BB8E48845409C4ACD1E689D3940A80BEA5BE6884540C7D1E3F7369D39405A3A58FFE788454080EB51B81E9D3940A1E61DA7E8884540C77A3194139D3940E892E34EE988454055B6D617099D3940BD973446EB88454000A3923A019D394021F5108DEE884540F21E2E39EE9C394044E8D9ACFA88454072103B53E89C3940846FD39FFD88454064A9BC1DE19C3940369E4143FF88454056423EE8D99C394012C85EEFFE88454048DBBFB2D29C39403DC30DF8FC884540AC1BB62DCA9C39406FE388B5F8884540F3AA9509BF9C39407D2D211FF4884540D7DC989EB09C394068A1D634EF884540C9751A69A99C394076EB6E9EEA884540C9751A69A99C3940C4BC00FBE88845402DD3F6AFAC9C3940EFB7AF03E788454082949F54FB9C39401337E0F3C3884540744A07EBFF9C3940F785C954C188454002A3923A019D394005D061BEBC884540BBF6CC92009D3940C54868CBB9884540E6F17B9BFE9C394085C16ED8B68845400386AC6EF59C3940E1DC989EB0884540D86D179AEB9C39403DF8C264AA884540F501486DE29C3940D99AE61DA7884540BC9F1A2FDD9C39406E183E22A6884540D9334B02D49C39406E183E22A68845402E2AA913D09C39406E183E22A6884540CACCCCCCCC9C3940276C787AA5884540666FF085C99C394052672783A3884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540914DB9C2BB9C39404B425BCEA5884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1061, 0, NULL, '', '0102000020E6100000B6000000C59448A297A13940C7D79E59128845401AA88C7F9FA13940CEFC6A0E108845406FBBD05CA7A139408750A5660F884540EFC9C342ADA13940F2D24D6210884540B6847CD0B3A13940802BD9B111884540D235936FB6A1394079060DFD13884540D235936FB6A13940DD63E943178845408B89CDC7B5A13940F91400E319884540B6847CD0B3A13940AB436E861B8845400B7BDAE1AFA139405D72DC291D884540E062450DA6A13940C8F484251E8845407DCB9C2E8BA13940087C7E18218845407D3A1E3350A13940AC6054522788454053742497FFA03940254A7B832F88454037A6272CF1A0394090CC237F30884540E275FD82DDA03940B4A206D33088454046990D32C9A03940B4A206D330884540D49AE61DA7A039406DF6402B30884540FF21FDF675A03940099964E42C8845400D4FAF9465A0394010BE30992A8845401B7C613255A03940D03637A6278845407F65A54929A03940EDCA67791E884540006F8104C59F3940DF291DACFF874540649291B3B09F39403B454772F98745408F537424979F394050B4AB90F28745403A234A7B839F394082D4264EEE8745408195438B6C9F3940D7CA845FEA8745401EFE9AAC519F39402CC1E270E68745408221AB5B3D9F394033E6AE25E48745402DF180B2299F3940A58D23D6E2874540F4716DA8189F39405EE15D2EE287454091DAC4C9FD9E394017359886E187454075EACA67799E3940F35EB532E1874540596E6935249E3940CF88D2DEE087454059FAD005F59D3940ABB2EF8AE0874540F7234564589D394064062AE3DF87454094A46B26DF9C39401D5A643BDF874540F8AA9509BF9C394064062AE3DF87454031D3F6AFAC9C3940ABB2EF8AE0874540CE1951DA1B9C3940F9A067B3EA874540A4DFBE0E9C9B3940DC0C37E0F387454079AA436E869B394000E31934F4874540B2D2A414749B3940B936548CF3874540F9449E245D9B39404EB4AB90F28745400738842A359B39405CFE43FAED8745402475029A089B394055BC9179E4874540FA912232AC9A394040F67AF7C7874540DEA63FFB919A39400EB9196EC08745406CC5FEB27B9A3940B28009DCBA8745401704560E2D9A3940DD5ED218AD8745403441D47D009A3940884B8E3BA5874540A63AE466B899394001FBE8D4958745406DD8B628B3993940DD24068195874540A61DFE9AAC993940967840D99487454098B67F65A59939408F5374249787454098081B9E5E993940F2EA1C03B287454035548CF3379939400EB9196EC0874540FC9AAC510F9939404E5DF92CCF874540364A5E9D63983940F8F719170E8845407DD93D7958983940315A475513884540610B410E4A983940F1EF332E1C884540E1FC4D2844983940232D95B723884540C54B3789419839409C16BCE82B884540C54B378941983940F12900C6338845408C06F01648983940CD70033E3F8845400C32C9C85998394022A12DE752884540C5A2E9EC64983940B73B6BB75D88454070AC8BDB6898394013747B4963884540B7585183699839404CD6A88768884540B758518369983940B03385CE6B88454053FB743C669839405B3D27BD6F8845400C32C9C8599839408655BC9179884540B7019F1F46983940629CBF09858845407E65A54929983940E9EC6470948845404503780B2498394094F6065F988845402952616C21983940D47D00529B8845400DA14ACD1E9839400DE02D90A0884540C6F484251E983940FF959526A5884540544D10751F983940CD751A69A988454070FE261422983940BF2B82FFAD884540C5116BF129983940CD920035B5884540B7019F1F46983940946A9F8EC788454037842A357B983940306475ABE78845408C0B0742B2983940130A117008894540B74082E2C79839407684D382178945407E18213CDA983940E8482EFF218945407E350708E6983940F6AFAC3429894540D3484BE5ED983940C48F31772D894540FE60E0B9F7983940926FB6B93189454037C30DF8FC9839408B4AEA043489454062DBA2CC06993940604F3BFC35894540D49FFD4811993940EEA7C64B378945408CF84ECC7A99394020E527D53E894540C5CE143AAF9939408442041C428945404551A04FE49939402F4CA60A468945402770EB6E9E9A3940E197FA7953894540C3FA3F87F99A3940A852B3075A894540513BFC35599B3940B6B9313D61894540ED8B84B69C9B3940EF1B5F7B66894540A6FCA4DAA79B394036C824236789454042BCAE5FB09B39400BCD751A6989454097CFF23CB89B394004A8A9656B894540ECE2361AC09B3940764F1E166A89454041F67AF7C79B394052793BC269894540FA669B1BD39B39409925016A6A89454008CE1951DA9B3940920035B56C8945406B65C22FF59B3940442FA3586E894540242D95B7239C3940F65D11FC6F894540EB3E00A94D9C3940120F289B72894540F936FDD98F9C3940E0EEACDD768945404E672783A39C394035E50AEF728945405CEB8B84B69C3940AEB14B546F89454087032159C09C3940F55D11FC6F8945404EBED9E6C69C3940A78C7F9F718945406A6FF085C99C394059BBED4273894540A3D11DC4CE9C3940921D1B81788945409587855AD39C39408BF84ECC7A894540074CE0D6DD9C394084D382177D894540A3629CBF099D3940E8305F5E8089454023AB5B3D279D3940E10B93A98289454095A98251499D3940DAE6C6F48489454078A6D0798D9D3940EF7211DF89894540A2F831E6AE9D3940E84D452A8C8945404C07EBFF1C9E394061376C5B94894540E83A8DB4549E394053EDD3F198894540E7965643E29E3940CCD6FA22A1894540BC490C022B9F3940BE8C62B9A5894540F4599E07779F394045C02154A9894540ADE7A4F78D9F3940D318ADA3AA89454074A25D85949F3940617138F3AB894540E5BD6A65C29F39404C02D4D4B2894540E5F736FDD99F3940D335936FB6894540901EBFB7E99F39405A69520ABA89454082F10C1AFA9F39404C1FBAA0BE89454010677E3507A03940F00390DAC4894540822BD9B111A03940701283C0CA8945401EEBE2361AA03940CC4A9352D08945402C8C2D0439A039401A73D712F289454081D93D7958A039401A90BDDEFD8945401DD3139678A03940F6D6C056098A45409DFEEC478AA039402F39EE940E8A4540566F0D6C95A03940043E3F8C108A4540F24BFDBCA9A03940AF47E17A148A4540642D3E05C0A039407D2766BD188A454047B6F3FDD4A0394044E21E4B1F8A454063F8889812A13940E7E3DA50318A4540D5D9C9E028A1394060CD0182398A4540636C21C841A13940670FB402438A4540F1FE78AF5AA13940FCA9F1D24D8A4540719EEA909BA13940E674594C6C8A4540B8A1629CBFA1394042CA4FAA7D8A4540AA9196CADBA13940D03FC1C58A8A4540B8F81400E3A1394017EC866D8B8A454054B81E85EBA139408993FB1D8A8A45403724EEB1F4A13940B48EAA26888A454029DA5548F9A1394018CFA0A17F8A45400C46257502A23940833463D1748A45409ABB96900FA23940A7ED5F59698A4540FD6F253B36A23940BD22F8DF4A8A45406F5166834CA239409AD87C5C1B8A4540EF5F596952A23940530FD1E80E8A4540E115C1FF56A239409379E40F068A45409A4C158C4AA239404CCD1E68058A454037B56CAD2FA2394021D26F5F078A4540C5F0113125A23940D300DE02098A4540532CB7B41AA23940EFB1F4A10B8A4540281422E010A23940615969520A8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540C4B645990DA239407D0A80F10C8A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1156, 0, NULL, '', '0102000020E610000034010000FF9AAC510F9939407333DC80CF874540E3E47E87A2983940416A1327F7874540394A5E9D639839401DCEFC6A0E884540ABD4EC81569839409DDCEF5014884540F263CC5D4B983940886D8B321B884540E4FC4D284498394096D4096822884540C84B378941983940A43B889D29884540C84B378941983940D678E92631884540E4FC4D2844983940C1098508388845408F06F01648983940AC9A20EA3E8845404877103B53983940173AAFB14B884540D6EC81566098394082D93D79588845409DA73AE466983940B4169F0260884540B958518369983940342592E865884540B95851836998394049B1DCD26A88454055FB743C66983940A5E9EC6470884540D5EC81566098394073C971A7748845401C7C613255983940C8DCB5847C884540C7116BF129983940EBEC6470948845408EAF3DB3249839407220240B98884540E3A59BC4209839401D2AC6F99B8845400EA14ACD1E98394032B610E4A08845400EA14ACD1E98394087C954C1A888454063B48EAA26983940B2E1E995B28845407F828B1535983940DDF97E6ABC8845407FD93D79589839402B05DD5ED28845408DD13AAA9A983940D56531B1F988454029CB10C7BA983940714221020E894540B74082E2C798394054AEF02E178945400C71AC8BDB9839400D1F1153228945406FEB6E9EEA9839403837A6272C89454036C30DF8FC9839406A7407B13389454061DBA2CC06993940634F3BFC35894540EF5014E813993940157EA99F378945408BF84ECC7A993940000F45813E894540272CF180B2993940AB18E76F42894540B5F81400E3993940324CA60A46894540C1FA3F87F99A3940AB52B3075A89454096E7C1DD599B3940B9B9313D61894540EBA86A82A89B39405D9E07776789454040BCAE5FB09B39400FCD751A6989454095CFF23CB89B394008A8A9656B894540A3367172BF9B39407A4F1E166A894540CE4E0647C99B394056793BC269894540401361C3D39B3940C1FBE3BD6A89454007CE1951DA9B3940732A52616C894540A3AA09A2EE9B3940482FA3586E894540232D95B7239C3940D6872EA86F89454078EE3D5C729C39400FEA5BE674894540F836FDD98F9C3940E4EEACDD76894540BF0E9C33A29C394039E50AEF7289454086E63A8DB49C3940D5872EA86F8945403F575BB1BF9C3940D5872EA86F894540946A9F8EC79C3940CE6262F3718945403F74417DCB9C39405596218E75894540EA7DE36BCF9C394000A0C37C79894540F8E461A1D69C3940D5A414747B8945404DF8A57EDE9C394087D382177D8945405BB6D617099D39400E0742B2808945402F51BD35B09D3940EA4D452A8C894540BCE82B48339E39401566DAFE95894540BC22F8DF4A9E3940EA6A2BF6978945402EE7525C559E39403117F19D9889454091A0F831E69E3940F1ACDD76A18945402DF180B2299F39409CB67F65A5894540653BDF4F8D9F3940D518ADA3AA8945402C6A300DC39F39404E02D4D4B2894540ACB2EF8AE09F3940638E1EBFB7894540ACCFD556EC9F3940C7EBFA05BB894540ACECBB22F89F39400773F4F8BD8945402C1895D409A03940805C1B2AC6894540D73E1D8F19A03940AB74B0FECF8945407338F3AB39A039404049BA66F289454065450DA661A0394080ED9925018A454073C971A774A039406B7E3507088A45400FA661F888A039403239EE940E8A45409D1BD31396A039402B1422E0108A45401D81785DBFA03940802766BD188A4540C7387F130AA13940F208A7052F8A45408E101E6D1CA139404E41B797348A45405505A3923AA139404E5E9D63408A4540AA52B3075AA13940DCD30E7F4D8A45408D15359886A13940BF5CC477628A4540FE4D2844C0A1394046CA4FAA7D8A4540F03D5C72DCA13940F815A4198B8A4540FEA4DAA7E3A139401CEC866D8B8A454053B81E85EBA139408E93FB1D8A8A45403624EEB1F4A13940B98EAA26888A45406F861BF0F9A13940F9F8BD4D7F8A45406FA301BC05A2394047AD69DE718A4540FD523F6F2AA23940A48EC70C548A4540441CEBE236A2394056A04FE4498A4540B6E0455F41A239400FBABDA4318A45409969FB5756A23940BA4FC763068A4540A7D0798D5DA23940C87C7901F6894540A7D0798D5DA23940963F1878EE894540B51A12F758A23940C85F9335EA89454051BD35B055A2394088D89942E7894540FCA9F1D24DA23940962232ACE2894540D1915CFE43A23940EB1890BDDE894540EE08A7052FA2394008ADC090D589454052499D8026A23940817901F6D18945408B8EE4F21FA23940B3997CB3CD89454044C5387F13A239408881E7DEC389454099BB96900FA23940ECC1DD59BB894540EEB1F4A10BA239405E4C6C3EAE8945408A54185B08A2394073BBD05CA789454051F2EA1C03A2394065545227A089454026DA5548F9A13940ACE33103958945409864E42CECA139401749F4328A8945406D4C4F58E2A13940A58499B67F894540A69196CADBA13940971D1B8178894540B4DB2E34D7A13940742A52616C89454009D28C45D3A13940740D6C95608945407B7901F6D1A13940668907944D8945405FC8EA56CFA139409FCE4E06478945402666BD18CAA139401FC05B2041894540A657CA32C4A139407BDB85E63A894540EDE6A90EB9A13940B420CD58348945400A410E4A98A13940747CED99258945405F1A868F88A139406D3A3B191C8945403402F1BA7EA1394058AEF02E17894540D1872EA86FA139401F4CC3F0118945408ABE823463A13940981804560E8945402744C02154A13940CA387F130A894540606C21C841A139404305C07806894540C4AC174339A13940D882177D05894540E140481630A139406D006F810489454053CBD6FA22A13940492A8C2D04894540456458C51BA1394090D651D504894540C55565DF15A13940FB58FAD005894540704221020EA13940F4332E1C0889454054910A630BA13940A6629CBF098945407F8CB96B09A139407B67EDB60B894540F1332E1C08A13940D79FFD4811894540E3E995B20CA139403BFDD98F148945401C4CC3F011A1394057AEF02E17894540FFB7921D1BA139402CB341261989454054CBD6FA22A139409735EA211A8945400D3CF71E2EA139409735EA211A8945409BB1683A3BA139402CB3412619894540FE65F7E461A13940C85565DF1589454045A33B889DA139406C1D554D10894540618E1EBFB7A13940BAEEE6A90E89454061C8EA56CFA13940BAEEE6A90E894540D3A92B9FE5A13940019BAC510F894540D3E3F736FDA13940484772F90F8945408B7615527EA23940BA0BCD751A8945405136E50AEFA239407AA1B94E23894540DECD531D72A339406C91ED7C3F8945407AAA436E86A339403A7172BF43894540CFBD874B8EA339407AF86BB246894540C173EFE192A33940BA7F65A549894540EC6E9EEA90A33940DD722EC555894540A5C2D84290A339404F37894160894540D0BD874B8EA33940C1FBE3BD6A8945408911C2A38DA339408FDB68006F894540176A4DF38EA339408191D096738945405E33F9669BA33940A567B3EA73894540D0F753E3A5A339402C9B728577894540B3632310AFA339401E51DA1B7C89454088687407B1A339405ED8D30E7F894540ECA86A82A8A3394009FF5BC98E894540B3463D44A3A3394010410E4A98894540DD989EB0C4A3394089471B47AC894540B2BAD573D2A3394049DD0720B589454007CE1951DAA339407B1A69A9BC89454015359886E1A33940348B89CDC789454015359886E1A339406DEDB60BCD89454015359886E1A33940A64FE449D2894540B1D7BB3FDEA3394091FD65F7E4894540BF2154A9D9A339407CABE7A4F7894540CD6BEC12D5A339404AA852B3078A454006B13385CEA33940FCF3A622158A4540783BC269C1A3394018DF89592F8A4540318FFCC1C0A339403490A0F8318A454095ECD808C4A33940E6BE0E9C338A4540A353573ECBA339402D6BD443348A45406A0E10CCD1A339403490A0F8318A4540DC0C37E0F3A339403B9886E1238A4540A3E4D53906A4394097B3B0A71D8A4540BFB2D2A414A439401080F10C1A8A4540E904341136A4394049C5387F138A4540E95BE67459A43940A5E062450D8A4540DAA2CC0699A4394010462575028A45402FF0DC7BB8A43940FBB9DA8AFD894540A1EE0390DAA439402DDA5548F9894540BD30992A18A53940F477280AF489454020C8410933A53940661F9DBAF2894540BCFBE3BD6AA53940F477280AF4894540911D1B8178A539405FFAD005F5894540E64D452A8CA539409F81CAF8F7894540AD25E4839EA5394026B58993FB894540584C6C3EAEA53940ADE8482EFF894540E6DEC325C7A53940BB4FC763068A45402DE23B31EBA53940BB6CAD2F128A454074E5B33C0FA639406DB8019F1F8A454090B3B0A71DA6394082444C89248A4540BBCB457C27A639403473BA2C268A45404941B79734A639409FF56228278A454002B2D7BB3FA639409FF56228278A4540101956F146A63940119DD7D8258A4540652C9ACE4EA63940D115DEE5228A45402CE7525C55A63940918EE4F21F8A4540ACF545425BA639405107EBFF1C8A45403A4ED1915CA63940582CB7B41A8A454081FA96395DA63940F4CEDA6D178A45408F442FA358A63940892F4CA60A8A4540F384251E50A63940C257AD4CF88945400F363CBD52A6394074693524EE894540BA3FDEAB56A6394002A5DAA7E3894540AC122C0E67A6394009ADC090D5894540017D224F92A639405F69520ABA8945406431B1F9B8A63940830569C6A2894540563ECBF3E0A63940CA7762D68B8945400FCCD1E3F7A639405FD8D30E7F8945402B9ACE4E06A739408391D09673894540F25487DC0CA73940BCD617096D89454080AD122C0EA7394058793BC269894540ABA8C1340CA73940D1457C276689454039E466B801A73940DF8F1491618945407229AE2AFBA63940833A1E33508945408EDAC4C9FDA639402E27DA5548894540714694F606A739408300529B3889454038014D840DA73940674F3BFC35894540AAC5A70018A739404B9E245D3389454055EC2FBB27A7394052C3F011318945408021AB5B3DA739407DBE9F1A2F894540559A94826EA73940610D897B2C894540718A8EE4F2A73940E1FE959526894540D42137C30DA839400CFA449E24894540B87020240BA839407EA1B94E238945402A1895D409A83940F0482EFF218945409CBF098508A83940BE0BCD751A8945409CBF098508A83940E9067C7E18894540001DE6CB0BA839403EFDD98F14894540F2D24D6210A8394069F88898128945400EA14ACD1EA83940701D554D10894540E275FD82DDA83940224CC3F011894540A9DE1AD82AA939408DCE6BEC12894540A8E3310395A9394014022B8716894540A779C7293AAA39402269A9BC1D89454098512CB7B4AA394037F5F3A622894540C2DD59BBEDAA39407EA1B94E238945405036E50AEFAA3940FE92C6681D8945405E9D6340F6AA3940E9067C7E188945402575029A08AB3940D47A319413894540DD0720B589AB3940A2030473F48845404E97C5C4E6AB394029FDF675E0884540B1683A3B19AC39408D3DEDF0D788454094D4096822AC39409462B9A5D58845407740D9942BAC39403005DD5ED28845404C452A8C2DAC39406225581CCE8845407740D9942BAC39405BE3A59BC4884540E9E74D452AAC39407F9CA223B98845407740D9942BAC3940D4920035B5884540DB9DB5DB2EAC394029895E46B18845401400E31934AC3940A2559FABAD8845402267614F3BAC3940F74BFDBCA9884540F7DF4A766CAC3940C5F1B56796884540CC0182397AAC3940FE36FDD98F884540DA68006F81AC3940377C444C898845408572A25D85AC3940B76D516683884540CC1E680586AC39407E0B24287E884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540F736FDD98FAC39404CCEC29E76884540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1690, 0, NULL, '', '0102000020E6100000E2000000F3936A9F8EA739403B75E5B33C8B4540C898BB9690A739405726FC523F8B454056D4601A86A73940FB0AD28C458B4540736891ED7CA73940C2C58A1A4C8B45401E38674469A73940C2E270E6578B454065C746205EA739401E1B81785D8B45403AAFB14B54A73940C9242367618B45408F88299144A73940742EC555658B4540BA66F2CD36A739406D09F9A0678B454057EC2FBB27A73940420E4A98698B454090DAC4C9FDA639408295438B6C8B454010751F80D4A63940ED17EC866D8B45404963B48EAAA639408295438B6C8B454010AAD4EC81A63940D066D5E76A8B4540588B4F0130A63940D78BA19C688B4540A06CCA15DEA53940C9242367618B4540AEB6627FD9A539406DEC12D55B8B45404A598638D6A53940A6315A47558B454003ADC090D5A53940C3A8A44E408B45404A598638D6A53940B5412619398B4540AEB6627FD9A539406753AEF02E8B4540F5622827DAA539406011FC6F258B4540D9B11188D7A5394027AFCE31208B45402EA86F99D3A5394059CF49EF1B8B4540839ECDAACFA53940206D1CB1168B4540AE997CB3CDA539403D014D840D8B45403CF20703CFA539400BC4EBFA058B4540BC00FBE8D4A539400482397AFC8A454058C0046EDDA53940AF6EF59CF48A454083D89942E7A539407D319413ED8A45403C49BA66F2A5394076EFE192E38A4540915CFE43FAA539405A3ECBF3E08A4540032159C004A63940EFBB22F8DF8A45409FE062450DA63940CBE53FA4DF8A45405851836918A63940EFBB22F8DF8A4540E6E3DA5031A639402F431CEBE28A4540902749D74CA639404BF4328AE58A45409EABADD85FA63940E0718A8EE48A454073CDE49B6DA63940F5E0EEACDD8A4540F3DBD78173A63940A7F27684D38A4540F3DBD78173A63940030EA14ACD8A45408F7EFB3A70A639403C53E8BCC68A4540561CCEFC6AA63940C369C18BBE8A45400F5322895EA63940A79BC420B08A45408F442FA358A639406E3997E2AA8A4540F384251E50A639407C832F4CA68A4540900A630B41A63940D89E5912A08A45404924D1CB28A639403CDF4F8D978A454010A5BDC117A639404A29E8F6928A454074C8CD7003A639409F1F46088F8A45402DC55565DFA53940D8648D7A888A454011BD8C62B9A5394011AAD4EC818A45401183C0CAA1A5394043CA4FAA7D8A45401166DAFE95A53940DF6C73637A8A4540F597DD9387A539405839B4C8768A45403C0AD7A370A53940D105F52D738A4540835FEAE74DA53940B554DE8E708A45403C963E7441A53940B554DE8E708A4540F5CC920035A53940D92AC1E2708A4540E7482EFF21A53940927EFB3A708A454084CE6BEC12A53940927EFB3A708A4540762D211FF4A4394044AD69DE718A4540843DEDF0D7A43940AF2F12DA728A454076B988EFC4A439403D889D29748A4540F68DAF3DB3A43940C4BB5CC4778A4540A15D85949FA43940044356B77A8A45405A77F35487A43940B671C45A7C8A4540B0DCD26A48A43940E189592F868A454094B7239C16A439407D6649809A8A454022F3C81F0CA439404B46CEC29E8A4540A2703D0AD7A33940D9BB3FDEAB8A454031384A5E9DA3394004F1BA7EC18A4540237A19C572A33940FDE8D495CF8A4540F86184F068A339403D70CE88D28A4540EADD1FEF55A339402F26361FD78A4540CEF23CB83BA33940B659F5B9DA8A4540B2B0A71DFEA2394092831266DA8A4540C186A757CAA2394052FC1873D78A454017265305A3A23940A0CDAACFD58A4540DE6C73637AA239405921E527D58A4540A62215C616A2394059AD4CF8A58A454051D50451F7A13940D25CA791968A45407C96E7C1DDA139403DC269C18B8A4540B5847CD0B3A13940C4BB5CC4778A45409999999999A139407DF2B0506B8A45408B15359886A13940BD5CC477628A45407D5704FF5BA139402180D4264E8A4540E123624A24A139408CC8B08A378A4540C5387F130AA13940F008A7052F8A4540FE092E56D4A03940220C3CF71E8A45401B81785DBFA039407E2766BD188A4540546F0D6C95A03940291422E0108A4540545227A089A039403039EE940E8A45407F30F0DC7BA03940C5B645990D8A4540AA0EB9196EA03940E98C28ED0D8A4540AAB706B64AA0394077E5B33C0F8A45408195438B6C9F3940377BA015188A4540E6797077D69E3940DB5F764F1E8A4540833463D1749E39408669183E228A454003B2D7BB3F9E39409BF56228278A4540AE2AFBAE089E3940CD32C4B12E8A45401266DAFE959D394078594C6C3E8A4540AF777FBC579D394038EF3845478A454085949F54FB9C3940EA3A8DB4548A45400569C6A2E99C3940E315C1FF568A4540B01BB62DCA9C3940239DBAF2598A4540693524EEB19C3940F8A10BEA5B8A45408638D6C56D9C3940A3ABADD85F8A454095B7239C169C3940EA577380608A4540969526A5A09B394078B0FECF618A4540895E46B1DC9A39402ADF6C73638A4540276BD443349A3940FFE3BD6A658A4540E1EEACDD76993940B1122C0E678A45405322895E46993940F8BEF1B5678A45406284F068E39839406A666666668A4540622D3E05C09839406A666666668A4540D49AE61DA798394023BAA0BE658A45401B0DE02D909839409561156F648A45400D897B2C7D98394079B0FECF618A4540B875374F75983940C781902C608A4540AAF1D24D62983940239DBAF2598A4540E31934F44F983940380C1F11538A4540809F71E140983940B1D85F764F8A4540E4DF675C38983940FFA9F1D24D8A454048205ED72F983940DBD30E7F4D8A4540AC60545227983940DBD30E7F4D8A45408148BF7D1D9839408D027D224F8A45402C357BA015983940F15F5969528A4540812BD9B11198394078931804568A454056302AA913983940D4CB28965B8A454048E6913F18983940382905DD5E8A45409DF9D51C2098394031043928618A45400FBE30992A983940BF5CC477628A454081828B1535983940BF5CC477628A4540819F71E14098394054DA1B7C618A45400F15E3FC4D983940A2ABADD85F8A454081D93D7958983940CDA65CE15D8A45409DE1067C7E98394031E7525C558A45409D38B9DFA19839402AA5A0DB4B8A45409DC937DBDC9839401C213CDA388A45401D2FDD2406993940B181AD122C8A454047BB0A293F9939409CD87C5C1B8A454055D0ED258D993940072159C0048A454038936FB6B99939409C81CAF8F7894540F13D5C72DC993940B915FBCBEE894540F042739D469A3940C725C79DD2894540FE1D8A027D9A3940F9285C8FC28945405336E50AEF9A39401683C0CAA1894540D3D556EC2F9B39404FAB21718F894540E176A1B94E9B39401D6EC0E787894540EFFA05BB619B3940E40B93A982894540EF34D252799B3940ABA9656B7D894540449FC893A49B39400FEA5BE6748945406FB75D68AE9B39405DBBED4273894540B6632310AF9B394064E0B9F7708945401AC1FF56B29B39402459C0046E8945403755302AA99B394008A8A9656B894540E241EC4CA19B394056793BC269894540E2EA39E97D9B39403AC82423678945400D8F368E589B39401E170E846489454038A2B437F89A3940338672A25D8945402B88BA0F409A3940813A1E3350894540E5F3C308E199394073D39FFD488945409089CDC7B59939400F76C3B645894540BB7F65A549993940DD38622D3E894540039BAC510F9939405605A3923A894540F5332E1C08993940322FC03E3A89454059742497FF9839405605A3923A894540F6F96184F0983940083411363C894540A1E61DA7E8983940083411363C8945406884F068E39839409DB1683A3B894540BD7A4E7ADF983940C8AC1743398945402F22C32ADE983940CFD1E3F7368945405A1D7233DC983940DD1B7C6132894540F6BF95ECD89839405D0D897B2C894540E85817B7D1983940C8724BAB218945405AE3A59BC49839405DD3BCE314894540F768E388B5983940EB0E62670A894540BEE9CF7EA4983940794A07EBFF884540DB0968226C9839402B22C32ADE884540869F71E1409839400F37E0F3C38845405B6AF6402B983940163FC6DCB5884540BFAAECBB2298394008D847A7AE884540CDF484251E983940D69AE61DA788454014A14ACD1E983940C83368E89F88454078FE261422983940244F92AE99884540B17D3A1E33983940B28A37328F8845407872BF4351983940C0B7E9CF7E884540A38A54185B9839401CD313967888454086F6234564983940314278B4718845403100C633689839406362F3716D8845400605172B6A983940B858518369884540EA53008C67983940CDC7B5A1628845405CFB743C669839404694F6065F88454087D93D79589839402AC6F99B5088454087BC57AD4C98394007D3307C4488454007AE64C746983940D595CFF23C884540A3508880439839400EDB166536884540879F71E14098394095F1EF332E88454015F8FC3042983940F10C1AFA2788454031A913D0449839404D2844C021884540B1B706B64A983940A9436E861B88454086D93D79589839400D846401138845403F4A5E9D639839401BCEFC6A0E88454030745E63979839400D4A9869FB87454085FB3A70CE98394094438B6CE7874540059BAC510F9939407133DC80CF8745403E548CF3379939400EB9196EC0874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540A294826E2F993940AA5B3D27BD874540', NULL, NULL);
INSERT INTO "tripshape" VALUES (590, 0, NULL, '', '0102000020E6100000350100008CF84ECC7A9939408486FE092E8A4540D2AE42CA4F9A3940A85CE15D2E8A4540D2AE42CA4F9A39404C07EBFF1C8A45409969FB57569A3940A82215C6168A4540EE2AA4FCA49A3940AF0D15E3FC89454099512CB7B49A39409A81CAF8F7894540A7D590B8C79A3940EF77280AF4894540E0718A8EE49A39406844696FF0894540A72C431CEB9A3940B615FBCBEE8945400B8A1F63EE9A39409A64E42CEC8945403685CE6BEC9A394005560E2DB28945407DFCDEA63F9B394005560E2DB28945405FACA8C1349C3940E17F2BD9B18945407BD15790669C394005560E2DB289454034EBC5504E9C3940B632E197FA894540FB889812499C39403DBD5296218A454042355EBA499C3940CB32C4B12E8A454034EBC5504E9C3940276BD443348A45401757957D579C39403CF71E2E398A454008BB61DBA29C3940AED85F764F8A4540DDF97E6ABC9C39406007CE19518A4540A40BEA5BE69C39404456B77A4E8A4540B23DB324409D3940C447C494488A4540241FF46C569D394059C51B99478A4540F8D6C056099E3940CB32C4B12E8A454031AD86C43D9E3940BDCB457C278A4540E9913F18789E39403DBD5296218A4540B0DD76A1B99E394044E21E4B1F8A4540DA868A71FE9E3940045B25581C8A45400222FDF675A03940C4B645990D8A4540575227A089A039400B630B410E8A4540E5C798BB96A03940043E3F8C108A454001D061BEBCA03940367BA015188A4540E45817B7D1A03940B68993FB1D8A45400E022B8716A139405266834C328A4540AA35CD3B4EA13940A071E140488A45408D15359886A13940E032A7CB628A4540E29C11A5BDA1394020F46C567D8A4540F03D5C72DCA13940D23FC1C58A8A45406202B7EEE6A13940F615A4198B8A45403724EEB1F4A1394092B8C7D2878A45407EED992501A239403663D174768A4540C5D32B6519A239402F043928618A4540FE6F253B36A239409A4C158C4A8A45400C11700855A23940625969520A8A4540A8D0798D5DA23940A2A696ADF5894540A8D0798D5DA23940FEC1C073EF894540A8B393C151A239408CFD65F7E48945402888BA0F40A2394013143FC6DC894540E1A128D027A23940A14FE449D2894540E18442041CA2394093E86514CB89454045C5387F13A239408581E7DEC3894540375EBA490CA239403051BD35B0894540625969520AA23940699604A8A989454070A301BC05A239407E0569C6A2894540458B6CE7FBA13940E96A2BF69789454037EA211ADDA139408DF84ECC7A894540702F698CD6A13940BFFBE3BD6A8945407E7901F6D1A13940AA52B3075A894540C525C79DD2A13940875FEAE74D89454053616C21C8A13940DC38622D3E8945407E3F355EBAA13940D5F6AFAC34894540C59448A297A139404EA60A4625894540B710E4A084A139409535EA211A89454037C8242367A13940DCC4C9FD0E89454070F085C954A13940C7387F130A894540FE0E45813EA13940F958FAD005894540F08AE07F2BA139406B006F8104894540E2067C7E18A13940B2AC342905894540E2E995B20CA13940160A117008894540A987687407A13940BAEEE6A90E894540E2E995B20CA1394081A99F37158945400D022B8716A13940C130992A18894540C6724BAB21A139409635EA211A894540469E245D33A139409635EA211A894540C5B12E6EA3A13940484772F90F89454037936FB6B9A13940BAEEE6A90E8945404517D4B7CCA13940BAEEE6A90E894540B7F81400E3A13940019BAC510F8945408C37328FFCA13940484772F90F89454099E2AAB2EFA239407AA1B94E238945400A03CFBD87A339405D47551344894540A6C2D84290A33940E47A14AE478945400A20B58993A3394024020EA14A894540351B649291A33940F2E192E34E894540A7C2D84290A339407932384A5E894540D2BD874B8EA339402B7E8CB96B894540D2BD874B8EA339408091D09673894540198733BF9AA33940A467B3EA738945408B4B8E3BA5A339402B9B72857789454044BCAE5FB0A33940ABA9656B7D8945408B687407B1A3394056B3075A81894540B6463D44A3A33940A4BE654E97894540A8FCA4DAA7A339404FC8073D9B894540C4E78711C2A33940FAEE8FF7AA89454027624A24D1A33940250725CCB48945409926A5A0DBA33940501FBAA0BE8945404430478FDFA339405E8638D6C589454060E15D2EE2A3394090C3995FCD894540B5D7BB3FDEA33940D067791EDC89454035C9C859D8A339402CDA5548F9894540D16BEC12D5A339406C7E3507088A4540B59DEFA7C6A33940C8F01131258A4540358FFCC1C0A339405D8B4F01308A45407C3BC269C1A339405666834C328A4540E0989EB0C4A33940E4BE0E9C338A454019FBCBEEC9A339400895F1EF338A4540C4046EDDCDA33940E4BE0E9C338A45400B08E6E8F1A339405D6E6935248A4540A701BC0512A439403256D4601A8A454026BE13B35EA43940395EBA490C8A4540DEF97E6ABCA43940D6E3F736FD894540C113B35E0CA539403A24EEB1F48945404FC3F01131A53940651F9DBAF289454032C03E3A75A539405EFAD005F58945409557E71890A539402CDA5548F989454078E09C11A5A53940B30D15E3FC894540CD2DAD86C4A5394073A301BC058A4540B0F02E17F1A53940B347E17A148A4540DA5F764F1EA6394081444C89248A4540E8E3DA5031A639409DF56228278A4540930A630B41A639409DF56228278A4540BE22F8DF4AA6394081444C89248A4540CC89761552A6394041BD5296218A4540219DBAF259A63940BA8993FB1D8A45403D4ED1915CA63940A5FD4811198A454092442FA358A63940892F4CA60A8A454084DDB06D51A63940E62D90A0F889454059E2016553A63940A689B0E1E9894540BD3FDEAB56A6394002A5DAA7E38945404BB54FC763A639404934BA83D8894540F6DBD78173A63940B4997CB3CD894540BDD05CA791A63940823F355EBA894540676B7D91D0A63940F48FF7AA9589454084FFAD64C7A63940A61518B2BA894540AFFA5C6DC5A6394098CB7F48BF8945404B9D8026C2A6394043D52137C3894540123B53E8BCA63940A732FE7DC689454084C5E1CCAFA63940B5997CB3CD8945405990662C9AA6394018143FC6DC89454059569A9482A63940D1845FEAE78945402E3E05C078A6394003C2C073EF8945402E3E05C078A63940985CFE43FA894540D947A7AE7CA63940B42AFBAE088A4540202E39EE94A6394042A06CCA158A454003B7EEE6A9A63940F4EBC039238A4540910F7A36ABA63940109DD7D8258A4540910F7A36ABA6394009780B24288A454066F7E461A1A63940D04FAA7D3A8A4540F4328AE596A6394090027D224F8A4540027D224F92A63940F45F5969528A454002603C8386A63940E615C1FF568A4540024356B77AA639404A739D465A8A454066834C3272A639406E49809A5A8A4540117008556AA639402078EE3D5C8A45404A7B832F4CA63940CB9E76F86B8A45402ECA6C9049A6394052D235936F8A45402ECA6C9049A639408B3463D1748A454066DAFE9595A63940675E807D748A45409F5912A0A6A6394043889D29748A4540BB270F0BB5A63940B52F12DA728A4540BB61DBA2CCA63940E74F8D976E8A4540573ECBF3E0A63940FCBEF1B5678A4540D7A3703D0AA73940C33FDEAB568A454073BA2C2636A7394067EAE74D458A454073D712F241A73940038D0B07428A4540E59B6D6E4CA73940E7DBF4673F8A4540E5B8533A58A7394035AD86C43D8A45402C82FFAD64A7394035AD86C43D8A4540E5F21FD26FA73940A02F2FC03E8A4540C85EEFFE78A73940990A630B418A45408F19A88C7FA73940B5BB79AA438A454056D4601A86A73940191956F1468A4540728577B988A73940C422F8DF4A8A454000DE02098AA73940205B0872508A45400E0BB5A679A739404B908312668A4540390664AF77A7394076A818E76F8A454055B77A4E7AA73940CBBB5CC4778A4540E32CEC6987A739407D2497FF908A45409C9D0C8E92A7394019018750A58A4540E349D23593A739402E8DD13AAA8A45400E45813E91A739402EAAB706B68A4540478AC8B08AA739406E4E97C5C48A4540726891ED7CA739404370CE88D28A454000A4367172A73940666397A8DE8A45401D38674469A739403B85CE6BEC8A45404833164D67A73940C2B88D06F08A4540E4D5390664A73940A54143FF048B45400FD1E80E62A73940F32FBB270F8B45401D1B81785DA739408FEFC4AC178B4540F202ECA353A7394008D9EBDD1F8B454072F4F8BD4DA739406411FC6F258B4540F2716DA818A73940D6F23CB83B8B454072637AC212A739408821AB5B3D8B4540ABA8C1340CA73940F3A353573E8B45409D4143FF04A739403A5019FF3E8B4540D6868A71FEA639405E26FC523F8B4540C81F0C3CF7A63940F3A353573E8B45401E4B1FBAA0A63940652EE23B318B454090B8C7D287A6394073787AA52C8B45408251499D80A639400F1B9E5E298B4540C9C342AD69A63940C12C26361F8B4540BB5CC47762A63940DEC05609168B4540105322895EA63940D77EA4880C8B4540E557738060A639404909336DFF8A45409EABADD85FA63940EDD022DBF98A45409EABADD85FA6394098BDDEFDF18A45402C04392861A63940A6077767ED8A454073B0FECF61A63940D827F224E98A454057FFE7305FA639400A486DE2E48A4540E574594C6CA639401FB7D100DE8A454065834C3272A63940A6CDAACFD58A4540F3DBD78173A639400A0EA14ACD8A4540C8C342AD69A63940D18E8D40BC8A454001ECA35357A63940753997E2AA8A4540F3673F5244A639404A21020EA18A454001780B2428A6394043DF4F8D978A4540738E01D9EBA53940B569DE718A8A4540BB8C62B9A5A53940927615527E8A4540ADEB17EC86A539406039B4C8768A4540660586AC6EA53940D905F52D738A4540CA0BB08F4EA53940BD54DE8E708A4540F5CC920035A53940BD54DE8E708A45401227F73B14A53940BD54DE8E708A454012799274CDA43940FDDBD781738A4540CBAFE600C1A439408B3463D1748A4540BD2B82FFADA439401268226C788A45401205FA449EA439400B4356B77A8A454012CB2DAD86A43940BD71C45A7C8A4540AFDCD26A48A43940C4B376DB858A454093B7239C16A43940846649809A8A4540689F8EC70CA439402F70EB6E9E8A454005CE1951DAA339409A0F7A36AB8A454085A2409FC8A339401A1E6D1CB18A4540CDBD874B8EA339404553E8BCC68A4540BFE270E657A339403726361FD78A454023E99AC937A33940BE59F5B9DA8A45406B04E275FDA239409A831266DA8A4540EB9E3C2CD4A23940C57EC16ED88A4540C12FF5F3A6A23940A9CDAACFD58A454097C0ADBB79A239406221E527D58A4540DF675C3810A23940DB798D5DA28A45404317D4B7CCA13940862C7DE8828A4540A7C64B3789A1394031DF6C73638A4540A735CD3B4EA13940879BFEEC478A4540C45565DF15A139405C66834C328A4540E15817B7D1A03940C08993FB1D8A45408C28ED0DBEA03940407BA015188A4540536F0D6C95A0394055EA0434118A4540535227A089A039403939EE940E8A4540B775374F75A03940F28C28ED0D8A4540E5797077D69E3940E45F764F1E8A45402D3E05C0789E394048BD5296218A4540E600C11C3D9E3940C8CB457C278A45403C8386FE099E3940FA08A7052F8A4540211FF46C569D394064C51B99478A4540F792C6681D9D3940B9D85F764F8A45403EE8D9ACFA9C3940F23A8DB4548A45400569C6A2E99C3940EB15C1FF568A4540777FBC57AD9C39402478EE3D5C8A45403F8C101E6D9C3940F2577380608A45406A6AD95A5F9C3940D6A65CE15D8A4540CEAACFD5569C39400FECA353578A4540317C444C899C394016117008558A45405C94D920939C3940FA5F5969528A454015E81379929C3940732C9ACE4E8A45403208AC1C5A9C394090A3E4D5398A4540EB3E00A94D9C39405741B797348A454040355EBA499C3940D732C4B12E8A4540F9889812499C394049BD5296218A454032EBC5504E9C39409F5CFE43FA894540F9C264AA609C394075D0D03FC189454079D15790669C394012560E2DB28945401600E319349C3940EE7F2BD9B1894540B38009DCBA9B394012560E2DB28945407BFCDEA63F9B394012560E2DB28945407C319413ED9A394012560E2DB2894540998BF84ECC9A394012560E2DB28945406124B4E55C9A3940F5FBA9F1D289454046C02154A9993940757E3507088A4540C703CAA65C993940E75F764F1E8A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A45402B44C02154993940B53FFB91228A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (104, 0, NULL, '', '0102000020E6100000E60000003B1E3350199F3940CA8E8D40BC8A45405726FC523F9F3940113B53E8BC8A45403B58FFE7309F39408AEAAD81AD8A4540494BE5ED089F394091D5AD9E938A454082E2C798BB9E394011C7BAB88D8A4540ADA3AA09A29E3940CA1AF5108D8A4540BBB376DB859E39407C4963B48E8A4540907EFB3A709E3940D13FC1C58A8A45403B4ED1915C9E394066BD18CA898A454011F758FAD09D394011AAD4EC818A454075FD82DDB09D3940CAFD0E45818A454076DB85E63A9D39405F7B6649808A45405AB6D617099D39408A7615527E8A4540855AD3BCE39C39404AEF1B5F7B8A45409413ED2AA49C394067834C32728A454030D3F6AFAC9C3940F5BEF1B5678A4540E9263108AC9C3940E032A7CB628A4540226C787AA59C3940E7577380608A4540A25D85949F9C394059FFE7305F8A4540F736FDD98F9C39407DD5CA845F8A4540CDE49B6D6E9C3940C481902C608A4540062AE3DF679C39407DD5CA845F8A4540F8C264AA609C3940CBA65CE15D8A4540CDAACFD5569C394027C286A7578A45405B77F354879C39400B117008558A454069520ABABD9C39406007CE19518A4540306475ABE79C39402080D4264E8A4540F6234564589D3940121956F1468A4540AE2AFBAE089E3940CB32C4B12E8A4540910A630B419E394099F56228278A4540CAE02879759E3940609335EA218A4540D7868A71FE9E3940273108AC1C8A4540E370E65773A03940C4B645990D8A45407F4DD6A887A039400B630B410E8A45402A745E6397A039404BEA0434118A45408D28ED0DBEA0394059518369188A45409B5AB6D617A13940991249F4328A45407EE36BCF2CA13940EE258DD13A8A454037AB3E575BA13940FCA9F1D24D8A454037E50AEF72A1394091442FA3588A4540FE4D2844C0A1394043CA4FAA7D8A4540F03D5C72DCA13940F515A4198B8A45408CFD65F7E4A13940F515A4198B8A45407ED0B359F5A13940B58EAA26888A454053D50451F7A13940C3D84290838A4540D3E3F736FDA139402719390B7B8A45408C54185B08A23940042670EB6E8A4540EFCEDA6D17A23940E132A7CB628A4540441CEBE236A239409A4C158C4A8A45406007CE1951A239404CEA0434118A4540D2CB28965BA23940DA08C4EBFA894540EE7C3F355EA239401A73D712F2894540D2CB28965BA23940768E01D9EB8945400B11700855A239401A56F146E689454052A04FE449A23940E1F3C308E189454019213CDA38A23940D38C45D3D989454052499D8026A239407E7901F6D1894540E08442041CA23940701283C0CA89454044C5387F13A2394062AB048BC389454099BB96900FA23940E9C1DD59BB894540EEB1F4A10BA23940CDF3E0EEAC894540E04A766C04A239403859A31EA2894540B532E197FAA139405C12A0A69689454027BD6F7CEDA139405CF5B9DA8A8945400BEF7211DFA1394063FD9FC37C89454060E5D022DBA1394007C58F31778945402783A3E4D5A13940794F1E166A8945407C7901F6D1A1394040D00A0C59894540C325C79DD2A13940553F6F2A5289454035CD3B4ED1A1394047D8F0F44A8945404317D4B7CCA13940801D38674489454035B05582C5A139409DB1683A3B894540E09C11A5BDA13940ABFB00A436894540FD304278B4A13940B945990D32894540C4B12E6EA3A13940870838842A89454052EDD3F198A13940727CED9925894540EF7211DF89A13940B2E600C11C8945409A5FCD0182A13940E4067C7E18894540D3872EA86FA13940F975E09C11894540FE48111956A139400EE544BB0A8945405322895E46A13940AA876874078945408C67D0D03FA139401C2FDD2406894540A9FB00A436A13940B1AC342905894540623255302AA13940462A8C2D04894540C6724BAB21A13940462A8C2D04894540715F07CE19A139408DD651D504894540714221020EA13940F1332E1C088945400DE544BB0AA13940C6387F130A8945407F8CB96B09A13940E2E995B20C89454038E0F3C308A13940D49FFD481189454054910A630BA13940F05014E813894540FF9AAC510FA13940C55565DF158945409B5AB6D617A13940E1067C7E18894540F06DFAB31FA139406F5F07CE198945408C2D043928A139409335EA211A894540B745990D32A139406F5F07CE19894540FE2B2B4D4AA139409A5AB6D6178945407E74EACA67A139407EA99F371589454028D53E1D8FA13940F775E09C118945403659A31EA2A13940454772F90F8945408B89CDC7B5A13940B7EEE6A90E8945400BB5A679C7A13940B7EEE6A90E8945404434BA83D8A13940B7EEE6A90E89454027BD6F7CEDA13940FE9AAC510F894540C3995FCD01A239408CF337A11089454098C0ADBB79A239409335EA211A89454098512CB7B4A2394085EB51B81E894540C2DD59BBEDA2394053CBD6FA228945400803CFBD87A339405A475513448945405D16139B8FA33940BEA4315A47894540C173EFE192A3394093A98251498945407AC7293A92A339401ADD41EC4C894540A5C2D84290A339400CB08F4E5D894540D0BD874B8EA339404C546F0D6C8945408911C2A38DA33940130F289B72894540341B649291A339407E91D096738945405F33F9669BA339407E91D09673894540D1F753E3A5A339404C7155D977894540B4632310AFA33940F77AF7C77B89454089687407B1A33940132C0E677E89454089687407B1A33940E8305F5E808945406D9A779CA2A33940E86A2BF6978945407B58A835CDA339409AD36531B1894540C22154A9D9A339400C98C0ADBB89454017359886E1A339409A0D32C9C889454017359886E1A33940A874B0FECF894540DED26A48DCA33940E110AAD4EC89454089BF266BD4A33940D300DE02098A4540348FFCC1C0A339405A8B4F01308A4540348FFCC1C0A339402F90A0F8318A4540DF989EB0C4A33940E1BE0E9C338A454034ACE28DCCA339400595F1EF338A454089F9F202ECA33940771F80D4268A454050D1915CFEA33940B064C746208A4540335A475513A439403056D4601A8A4540960ED6FF39A43940FE1873D7128A4540406F2A5261A439401388D7F50B8A45405C77F35487A4394028F73B14058A45404E840D4FAFA43940841266DAFE894540C0823463D1A43940925CFE43FA89454040CBF3E0EEA4394052D50451F78945404E6C3EAE0DA539403624EEB1F48945406A7407B133A53940611F9DBAF2894540BFA4315A47A53940A8CB6262F389454014D55B035BA53940A8CB6262F38945403F0AD7A370A539403624EEB1F4894540EA305F5E80A53940C47C7901F6894540CDD6FA22A1A53940448B6CE7FB89454069B3EA73B5A539405917B7D1008A4540E9DEC325C7A53940B54FC763068A4540134E0B5EF4A5394018CA8976158A4540210C3CF71EA639409F1A2FDD248A4540AF81AD122CA63940741F80D4268A4540E8E3DA5031A6394098F56228278A4540E800C11C3DA6394098F56228278A4540AFBB79AA43A639402D73BA2C268A454004CFBD874BA639407B444C89248A454012363CBD52A639403BBD5296218A454092442FA358A63940FB3559A31E8A454084FA96395DA639402D56D4601A8A454084FA96395DA639403BA06CCA158A454092442FA358A639405F5969520A8A454084DDB06D51A63940915CFE43FA8945403D31EBC550A6394051D50451F7894540A18EC70C54A63940A6AE7C96E78945407693180456A639401F7BBDFBE3894540219DBAF259A639409847FE60E08945404CD235936FA63940839ECDAACF894540BEB376DB85A63940AE7C96E7C1894540772497FF90A63940A01518B2BA894540DA12F241CFA63940EE8FF7AA9589454093BDDEFDF1A63940995FCD01828945407629AE2AFBA6394060FD9FC37C89454059B2632310A73940D9ACFA5C6D89454059B2632310A73940D9ACFA5C6D89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739404B546F0D6C89454012069E7B0FA73940277E8CB96B89454012069E7B0FA73940277E8CB96B89454012069E7B0FA73940277E8CB96B89454012069E7B0FA73940277E8CB96B89454012069E7B0FA73940277E8CB96B89454012069E7B0FA73940277E8CB96B89454012069E7B0FA73940277E8CB96B89454012069E7B0FA739404B546F0D6C89454012069E7B0FA739406F2A52616C89454012069E7B0FA73940930035B56C89454012069E7B0FA73940930035B56C89454012069E7B0FA73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D89454059B2632310A73940DAACFA5C6D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1637, 0, NULL, '', '0102000020E610000097000000D3A414747B99394094A9825149894540D36A48DC63993940BFA4315A478945401AFA27B858993940314CA60A46894540618907944D993940387172BF43894540E17A14AE47993940B8627FD93D894540FE9AAC510F993940312FC03E3A8945401B2FDD2406993940312FC03E3A8945409B20EA3E009939405505A3923A8945407F52EDD3F1983940E35D2EE23B894540FF43FAEDEB9839402A0AF4893C8945406384F068E39839409CB1683A3B894540FF261422E0983940EA82FA96398945402A22C32ADE9839403F7958A83589454046D3D9C9E0983940469E245D3389454038894160E59839407199D3653189454046F0BF95EC9839402AED0DBE308945407F52EDD3F198394006172B6A30894540FF60E0B9F7983940946FB6B93189454038C30DF8FC983940697407B133894540462A8C2D049939401BA375543589454062F8889812993940147EA99F3789454070D39FFD489939409BB1683A3B894540B72DCA6C90993940B03DB324408945409AF04BFDBC993940F0C4AC1743894540B6F81400E3993940304CA60A46894540E0DBF4673F9A3940F7065F984C894540C2FA3F87F99A3940A952B3075A894540DE9387855A9B3940B7B9313D61894540083D9B559F9B394013F241CF66894540DD5ED218AD9B3940A14ACD1E68894540DD7BB8E4B89B394005A8A9656B8945405D8AABCABE9B3940774F1E166A894540B29DEFA7C69B394053793BC269894540C0046EDDCD9B3940774F1E166A89454087BF266BD49B3940E2D1C6116B89454007CE1951DA9B3940702A52616C894540CEA5B8AAEC9B39402259C0046E894540868A71FE269C3940F75D11FC6F894540F736FDD98F9C3940E2EEACDD76894540F78DAF3DB39C3940D4872EA86F894540DAF97E6ABC9C3940D4872EA86F8945405A087250C29C39401B34F44F708945404CBED9E6C69C3940CD6262F371894540B01BB62DCA9C3940C63D963E74894540A2D11DC4CE9C3940B8F3FDD478894540DB334B02D49C3940B1CE31207B89454077F35487DC9C394063FD9FC37C8945405AB6D617099D3940EA305F5E808945404BAB21718F9D3940F17211DF89894540753C66A0329E39401466DAFE95894540E73A8DB4549E394054EDD3F19889454002486DE2E49E3940F0ACDD76A1894540E544BB0A299F39409BB67F65A5894540F3599E07779F394046C02154A9894540ACE7A4F78D9F3940D418ADA3AA89454073A25D85949F3940627138F3AB8945402C6A300DC39F39404D02D4D4B2894540579FABADD89F3940B15FB01BB6894540D7CA845FEA9F39405C69520ABA894540104A9869FB9F394095CB7F48BF89454073C45A7C0AA03940A332FE7DC689454048E6913F18A039403FF20703CF8945402B8C2D0439A039401B73D712F289454080D93D7958A039403E66A032FE894540D5264EEE77A03940F7D6C056098A4540555227A089A039403039EE940E8A4540553541D47DA03940E98C28ED0D8A45402A1DACFF73A03940E98C28ED0D8A4540C7681D554DA0394077E5B33C0F8A45408F588B4F01A03940DB429083128A4540579A94826E9F3940377BA015188A454066DF15C1FF9E3940055B25581C8A4540E6797077D69E3940DA5F764F1E8A45403CA583F57F9E39403EBD5296218A454075EACA67799E39403EBD5296218A4540BD0512143F9E3940BECB457C278A454077711B0DE09D3940296BD443348A4540CDB91457959D394077594C6C3E8A454095C6681D559D394037EF3845478A454087949F54FB9C3940E93A8DB4548A4540C0BC00FBE89C3940E215C1FF568A4540DD166536C89C39406949809A5A8A4540CFAFE600C19C39401B78EE3D5C8A45407A9CA223B99C39407FD5CA845F8A45405ECEA5B8AA9C3940147008556A8A45409713ED2AA49C394069834C32728A4540502D5BEB8B9C394094B8C7D2878A45405E77F354879C39405B7380608E8A4540DE4B1AA3759C3940F0478AC8B08A4540891BF0F9619C3940DA2FD80DDB8A454025BE13B35E9C3940D327F224E98A4540D0C7B5A1629C39408CD2DEE00B8B45405E2041F1639C3940E80AEF72118B4540C260376C5B9C3940FD96395D168B454089E123624A9C39407DA52C431C8B454050452A8C2D9C3940D9DD3CD5218B4540188733BF9A9B3940439AB1683A8B45405201309E419B3940833E9127498B45401AD4B7CCE99A39409F0C8E92578B4540E154A4C2D89A3940DF9387855A8B45406F73637AC29A3940F41FD26F5F8B45408CEAAD81AD9A3940265D33F9668B454029FC523F6F9A3940D0A0A17F828B45408DE59656439A39406C7D91D0968B4540C6995FCD019A3940A5198BA6B38B454055448655BC993940D790B8C7D28B454063376C5B94993940E5141DC9E58B45408091D096739939408816D9CEF78B45408E84B69C4B993940EBAD81AD128C45401CA37554359939408EAF3DB3248C45401C868F88299939400074982F2F8C4540F16DFAB31F99394039F3AB39408C454055AEF02E17993940391092054C8C4540009BAC510F993940B91E85EB518C4540D582177D05993940392D78D1578C45400061E0B9F798394024BE13B35E8C45400E8E9257E798394056FB743C668C45400E71AC8BDB9839401DB62DCA6C8C45402BE8F692C6983940A406D3307C8C4540B906B64AB09839404F2D5BEB8B8C4540005CC98E8D9839409613ED2AA48C45401DF0F96184983940C8504EB4AB8C45403A842A357B983940F368E388B58C4540E570E65773983940DEF97E6ABC8C4540BA58518369983940A5B437F8C28C4540AC9A20EA3E983940DE334B02D48C4540104A9869FB973940909C853DED8C454057BC9179E4973940DE8AFD65F78C45405748F949B597394081A99F37158D454057D4601A86973940F38AE07F2B8D45409F98F56228973940E597FA79538D45407480608E1E973940DE722EC5558D45403B1E335019973940251FF46C568D4540C93CF2070397394065A6ED5F598D4540833463D1749639402C7E8CB96B8D4540925CFE43FA95394065FD9FC37C8D45402098A3C7EF953940D07F48BF7D8D4540D9CEF753E3953940F4552B137E8D4540BD1DE1B4E0953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540217BBDFBE3953940E60B93A9828D4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (105, 0, NULL, '', '0102000020E6100000C00000003B014D840DA73940B7D617096D894540F437A11001A739407047382D788945402D7DE882FAA6394085D382177D894540D869A4A5F2A639409A5FCD01828945401192054CE0A63940E84D452A8C8945404ABA66F2CDA639405A12A0A69689454011E4A08499A6394044DD0720B5894540BCD05CA791A63940A01518B2BA894540BCB376DB85A639408BA6B393C1894540127008556AA639400BD28C45D38945404B9869FB57A6394027A089B0E189454012363CBD52A639409964E42CEC894540F684251E50A6394075ABE7A4F78945402FE7525C55A6394075C8CD70038A454093442FA358A63940A7052FFA0A8A45403E4ED1915CA63940CAF8F719178A4540B0F545425BA6394091B3B0A71D8A4540B0D85F764FA63940CA15DEE5228A45403E1405FA44A639402E73BA2C268A454077594C6C3EA6394099F56228278A4540B09E93DE37A6394099F56228278A45405B8B4F0130A6394099F56228278A4540781F80D426A639400B9DD7D8258A4540230C3CF71EA639407D444C89248A45405C51836918A63940A83FFB91228A454023D26F5F07A63940045B25581C8A454087D89942E7A53940281422E0108A454015DA722EC5A539406FA301BC058A4540C08C62B9A5A53940AF0D15E3FC8945404044A33B88A5394076ABE7A4F78945406B226C787AA539405AFAD005F5894540B2B14B546FA53940134E0B5EF489454040EDF0D764A53940EF77280AF4894540407958A835A53940611F9DBAF2894540870838842AA53940611F9DBAF289454087EB51B81EA53940CCA145B6F3894540CE5D4BC807A539405AFAD005F58945405D087250C2A43940458B6CE7FB894540B3A71DFE9AA43940E96F4221028A4540DEF4673F52A439403039EE940E8A4540099964E42CA43940F7F3A622158A4540B4683A3B19A43940A2FD4811198A4540DF4603780BA43940065B25581C8A4540D1C29E76F8A33940629335EA218A45400AEBFF1CE6A3394094D09673298A454035ACE28DCCA339400695F1EF338A4540FC49B54FC7A339400695F1EF338A4540C3E78711C2A339409B1249F4328A4540358FFCC1C0A339407F613255308A4540C3E78711C2A339408686FE092E8A45400AB13385CEA33940F8F3A622158A45408ABF266BD4A33940B12AFBAE088A45409826A5A0DBA33940DCEBDD1FEF8945404330478FDFA3394063E5D022DB8945405FE15D2EE2A339408EC3995FCD89454018359886E1A33940E3B9F770C9894540B4D7BB3FDEA33940F8285C8FC28945407B758E01D9A339400D98C0ADBB894540B4BAD573D2A3394046DD0720B589454009944DB9C2A33940F8EE8FF7AA894540FB0FE9B7AFA339401CA88C7F9F894540B4463D44A3A3394055EDD3F1988945407B01F6D1A9A339400E24287E8C89454042BCAE5FB0A3394007E275FD82894540D0143AAFB1A33940A38499B67F894540FB0FE9B7AFA3394063FD9FC37C89454018A4198BA6A339404E7155D9778945405F33F9669BA33940A367B3EA73894540A6C2D84290A33940A367B3EA738945408A11C2A38DA33940150F289B72894540D1BD874B8EA339402A7E8CB96B894540A6C2D84290A3394038AB3E575B894540C273EFE192A3394023020EA14A8945405E16139B8FA33940BFA4315A478945407BAA436E86A33940387172BF438945405136E50AEFA2394078A1B94E23894540DF37BEF6CCA239405CF0A2AF20894540B5AB90F293A239406A3A3B191C894540441CEBE236A2394038FDD98F14894540D3E3F736FDA139406A1D554D1089454070693524EEA139408EF337A1108945407E96E7C1DDA139401C4CC3F011894540F02076A6D0A1394080A99F371589454037B05582C5A1394000B8921D1B89454062AB048BC3A1394087EB51B81E8945401BFF3EE3C2A1394032F5F3A6228945407F5C1B2AC6A13940DDFE959526894540B8BE4868CBA13940880838842A894540712F698CD6A13940C16A65C22F894540B8F81400E3A13940B320CD5834894540623C8386FEA1394048BB0A293F894540A92215C616A23940012C2B4D4A894540A93FFB9122A23940A510018750894540D45790662CA2394049F5D6C056894540B7C35F9335A23940C903CAA65C8945407E7E18213CA239406DE89FE062894540FE8C0B0742A23940980035B56C8945408CE5965643A23940C318CA8976894540D374763238A23940AEC64B3789894540E1BE0E9C33A239409957E718908945409A1249F432A23940759EEA909B894540A85CE15D2EA23940EE8711C2A3894540E1A128D027A23940677138F3AB8945408C8EE4F21FA23940E05A5F24B4894540D33AAA9A20A2394075F59CF4BE8945409AF5622827A23940E7B9F770C98945409A1249F432A2394035A86F99D38945408CC8B08A37A2394099054CE0D68945404539D1AE42A239408496E7C1DD894540C547C49448A23940A047FE60E08945407EB8E4B853A23940D9A92B9FE5894540706E4C4F58A2394019312592E88945406224B4E55CA23940993F1878EE894540A9D0798D5DA23940D9C6116BF189454045739D465AA23940D9E3F736FD894540D374763238A2394060C51B99478A4540B7C35F9335A23940E7F8DA334B8A4540C5D32B6519A239407CB0FECF618A4540F0B1F4A10BA23940EE74594C6C8A4540A9E8482EFFA13940353E05C0788A454029DA5548F9A139408A51499D808A4540F077280AF4A13940BC8EAA26888A4540370708E6E8A13940D83FC1C58A8A4540F03D5C72DCA13940D83FC1C58A8A45408D15359886A13940C35CC477628A4540D44D621058A13940755166834C8A4540717CED9925A13940D9747632388A454055910A630BA1394019DF89592F8A45401CD82AC1E2A03940F6EBC039238A4540632D3E05C0A03940842766BD188A45400EC347C494A039400B3E3F8C108A454039A1100187A0394012630B410E8A45400022FDF675A03940CBB645990D8A45402C306475AB9F394044A06CCA158A454074D712F2419F3940EFA90EB9198A45402E26361FD79E3940E15F764F1E8A45405939B4C8769E3940689335EA218A454076594C6C3E9E3940C4CB457C278A4540A14FE449D29D39400470253B368A4540A2100187509D3940A771E140488A4540B18F4E5DF99C3940EE3A8DB4548A45400669C6A2E99C3940E715C1FF568A45400612143FC69C39406E49809A5A8A454006F52D73BA9C3940195322895E8A4540DBDC989EB09C3940E00DDB16658A45409413ED2AA49C39406E834C32728A4540CC069964E49C394051EF1B5F7B8A4540DAC4C9FD0E9D3940B54CF8A57E8A45405A2A6F47389D394043A583F57F8A4540849ECDAACF9D3940F5D3F198818A4540917EFB3A709E3940D83FC1C58A8A45402D5BEB8B849E3940834963B48E8A45403BFC3559A39E3940D11AF5108D8A45403B3602F1BA9E394018C7BAB88D8A4540BAF2599E079F394074FFCA4A938A4540D6FA22A12D9F3940743997E2AA8A454072BA2C26369F39405FCA32C4B18A45409DD2C1FA3F9F39403B11363CBD8A45409D98F562289F3940BB1F2922C38A45402BD49AE61D9F394026A2D11DC48A4540C859D8D30E9F394002CCEEC9C38A45403AC780ECF59E3940974946CEC28A45401E166A4DF39E3940650CE544BB8A4540F3716DA8189F3940ACB8AAECBB8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540F3716DA8189F394057C24CDBBF8A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1916, 0, NULL, '', '0102000020E610000056010000A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A47894540A9A9656B7D993940BEA4315A478945401B51DA1B7C99394093A9825149894540FF65F7E461993940BEA4315A47894540D44D6210589939400C76C3B645894540A935CD3B4E993940377172BF43894540B77F65A5499939401BC05B20418945402927DA5548993940B7627FD93D894540B8EEE6A90E9939405305A3923A894540AA876874079939402F2FC03E3A8945409C20EA3E009939405305A3923A894540B9B41A12F7983940BE874B8E3B8945408E9C853DED983940053411363C894540AB30B610E4983940BE874B8E3B89454000271422E0983940E982FA963989454072CE88D2DE983940147EA99F378945402B22C32ADE983940D4F6AFAC348945406484F068E3983940B845990D328945402B3FA9F6E99839402AED0DBE30894540F2F96184F09839402AED0DBE30894540B9B41A12F79839407199D36531894540F2164850FC9839406A7407B1338945408ED651D5049939403F7958A835894540474772F90F993940F1A7C64B37894540F26DFAB31F9939407F00529B38894540646C21C84199394078DB85E63A894540C7CE143AAF9939408642041C42894540714C4F58E2993940314CA60A468945402988BA0F409A3940F8065F984C894540D33FC1C58A9A3940543F6F2A52894540C4FA3F87F99A3940A952B3075A89454099E7C1DD599B3940B7B9313D6189454051CC7A31949B3940A96F99D36589454026EEB1F4A19B394014F241CF668945407B01F6D1A99B39407F74EACA6789454089687407B19B394031A3586E69894540DE7BB8E4B89B39402A7E8CB96B894540A5367172BF9B3940784F1E166A8945406CF12900C69B394054793BC26989454008B13385CE9B3940784F1E166A8945401618B2BAD59B3940E3D1C6116B8945404F7ADFF8DA9B3940950035B56C894540249C16BCE89B39400083DDB06D89454024B9FC87F49B3940472FA3586E89454024F3C81F0C9C39408EDB68006F894540B2852007259C3940F95D11FC6F8945403FE3C281909C3940E4EEACDD76894540CD751A69A99C394088B69C4B71894540143FC6DCB59C3940B3B14B546F89454069520ABABD9C3940D7872EA86F894540E960FD9FC39C3940420AD7A37089454022C32ADEC89C3940F4384547728945403E74417DCB9C39405896218E75894540E97DE36BCF9C394003A0C37C79894540F7E461A1D69C3940D8A414747B89454030478FDFDB9C394066FD9FC37C8945405B5F24B4E59C3940D17F48BF7D894540E90E62670A9D3940110742B2808945405A643BDF4F9D394026938C9C85894540DAE6C6F4849D3940ADC64B3789894540F67F0EF3E59D39409857E71890894540BDE82B48339E39401866DAFE958945403D31EBC5509E39403417F19D98894540BD3FDEAB569E394058EDD3F198894540202E39EE949E3940DF20938C9C894540032B8716D99E3940AD0018CFA0894540749D465A2A9F39409FB67F65A5894540D76EBBD05C9F3940BB679604A8894540ACADD85F769F394049C02154A98945403A4030478F9F3940D718ADA3AA89454073A25D85949F3940657138F3AB8945402C6A300DC39F39405002D4D4B28945407350C24CDB9F3940FB0B76C3B689454001C63368E89F39403B936FB6B989454081F10C1AFA9F3940501FBAA0BE8945402C1895D409A03940825C1B2AC6894540D73E1D8F19A03940899ECDAACF89454090CC237F30A0394082B3CD8DE9894540BBE4B8533AA03940651F9DBAF28945401032C9C859A039404166A032FE89454049CEC29E76A03940B32AFBAE088A4540575227A089A039403339EE940E8A45407320240B98A039404FEA0434118A45401D81785DBFA03940812766BD188A454048990D32C9A03940DD429083128A45409DAC510FD1A03940395EBA490C8A4540D60E7F4DD6A0394032C55565DF894540BA5D68AED3A039406BEDB60BCD8945403A4F75C8CDA039408881E7DEC389454081DE54A4C2A03940C8EBFA05BB894540738FA50F5DA039403A1FD7868A89454001CB4A9352A03940FA5D11FC6F8945400F15E3FC4DA03940D76A48DC63894540D6B2B5BE48A03940BB9C4B71558945407338F3AB39A039402DED0DBE30894540B87F65A549A139409835EA211A8945405427A089B0A13940D89FFD48118945408DE07F2BD9A13940039BAC510F894540D4E3F736FDA139406E1D554D108945407E0F971C77A23940755F07CE198945400C168733BFA23940F56DFAB31F8945400C8A1F63EEA2394059CBD6FA22894540FDEDEBC039A33940D9D9C9E02889454044B7973446A3394020868F8829894540D283BBB376A33940AEDE1AD82A894540D2F753E3A5A33940AEDE1AD82A894540C4E78711C2A33940435C72DC29894540EEE74D452AA43940BC28B34126894540C3D4CF9B8AA439407CA1B94E238945406D520ABABDA439408AEB51B81E894540A59C685721A539401827F73B1489454033DD240681A5394011E544BB0A8945404049BA66F2A53940838CB96B09894540A371E14048A6394035BB270F0B894540CC24236761A73940E0C4C9FD0E8945402E52616C21A8394092F337A110894540BBEEE6A90EA9394067F888981289454074B6B9313DA93940AEA44E401389454002F775E09CA9394035D80DDB1689454056499D8026AA3940B5E600C11C8945402AAAB706B6AA394035F5F3A622894540FF3F87F9F2AA39407CA1B94E238945401B2B6A300DAB3940E723624A24894540C5A8A44E40AB394003D578E926894540B6463D44A3AB3940113CF71E2E8945402537C30DF8AC394051FDBCA948894540C14D7FF623AD39408A5FEAE74D894540243CDA3862AD394091A19C6857894540F9D1A92B9FAD39408A99B67F658945406AEDB60BCDAD3940D8872EA86F894540CD67791EDCAD39405FBBED427389454030E7525C55AE394051AB21718F89454068F7E461A1AE3940F4ACDD76A18945403D8DB454DEAE3940EDA4F78DAF894540F58E537424AF3940E69C11A5BD89454083785DBF60AF39403BB05582C5894540CA98BB9690AF3940E6B9F770C98945403AA1100187B03940C925C79DD289454081DE54A4C2B0394009ADC090D589454064670A9DD7B0394097054CE0D6894540F2DC7BB8E4B039404934BA83D8894540C7FEB27BF2B039401E390B7BDA894540C75565DF15B1394050766C04E28945408000529B38B13940E510AAD4EC89454047F5D6C056B13940D7E3F736FD894540718104C58FB13940C1AE5FB01B8A454070A301BC05B23940F9A10BEA5B8A4540379886E123B239401C95D409688A45409A4C158C4AB23940F8DBD781738A45403663D17476B23940B871C45A7C8A4540E0A63FFB91B239408651499D808A454060EFFE78AFB239400D850838848A454043EC4CA1F3B2394094B8C7D2878A4540189F02603CB339404D0C022B878A4540FB7E6ABC74B339409BDD9387858A454050E960FD9FB339407707B133858A4540B3BAD573D2B339407707B133858A4540CFDF844204B4394093B8C7D2878A4540EB3E00A94DB439409AFA7953918A4540234F92AE99B439409A17601F9D8A4540A2F31ABB44B53940B6024356B78A4540933F1878EEB5394044959A3DD08A4540202E39EE94B63940D227F224E98A454091DAC4C9FDB6394035A2B437F88A454066E42CEC69B739400AC4EBFA058B454065062AE3DFB73940518D976E128B454056A4C2D842B83940ED4CA1F31A8B45400D1F115322B939406D787AA52C8B45407F00529B38B9394002F6D1A92B8B45409BCE4E0647B93940E644BB0A298B4540A935CD3B4EB93940F48E5374248B454070F085C954B939402DD49AE61D8B45409B081B9E5EB93940ADC5A700188B454054793BC269B93940B4EA73B5158B4540D4A414747BB939404968CBB9148B4540628E1EBFB7B939404968CBB9148B4540D46F5F07CEB93940FB96395D168B4540B732E197FAB93940975643E21E8B4540E2F3C308E1B939406CCF2C09508B45409BF04BFDBCB93940F37684D3828B4540A93AE466B8B9394025D1CB28968B4540292CF180B2B939400FD6FF39CC8B4540627138F3ABB93940C89DD2C1FA8B4540B7679604A8B9394048E6913F188C45400C5EF415A4B939401D42959A3D8C4540D3FBC6D79EB93940F29D98F5628C454045A33B889DB93940324278B4718C4540E1455F419AB93940F2D7648D7A8C4540B62DCA6C90B939402B5778978B8C45408BF84ECC7AB93940CE751A69A98C4540FD82DDB06DB939404EA1F31ABB8C4540A835CD3B4EB9394040912749D78C45406F99D36531B93940C7FEB27BF28C4540FD9AAC510FB939401C4CC3F0118D45402879758E01B93940381AC05B208D45401A9E5E29CBB839407F74EACA678D454053A9D903ADB839409B7CB3CD8D8D45402891442FA3B839409B999999998D454061B9A5D590B83940D418ADA3AA8D45401A5F7B6649B83940E9FBA9F1D28D4540625DDC4603B83940E22D90A0F88D4540E2141DC9E5B73940D400DE02098E4540549FABADD8B739400D630B410E8E45409B11A5BDC1B73940E28442041C8E4540F00703CFBDB73940DB5F764F1E8E45405448F949B5B73940F7108DEE208E4540F13CB83B6BB739405AE20165538E4540557DAEB662B7394028C286A7578E4540E39B6D6E4CB73940E8577380608E45405509168733B7394084177D05698E45409C5E29CB10B73940B654DE8E708E4540C84FAA7D3AB6394004603C83868E45401E7BBDFBE3B53940E7CB0BB08F8E4540E5C1DD59BBB53940BCD05CA7918E4540820D4FAF94B53940037D224F928E4540ADB14B546FB53940514EB4AB908E4540CA0BB08F4EB53940836E2F698C8E454083B1852007B53940F5F8BD4D7F8E4540F5E461A1D6B43940128DEE20768E45402E0DC347C4B43940AE2F12DA728E454003F52D73BAB4394067834C32728E45401122E010AAB4394043AD69DE718E4540E6094B3CA0B4394067834C32728E4540039E7B0F97B43940D205F52D738E454067A4A5F276B4394099C0ADBB798E4540926588635DB43940CBFD0E45818E454004D3307C44B43940FD3A70CE888E4540DA63E94317B43940A03C2CD49A8E454094B20C71ACB3394020A2D11DC48E4540868043A852B33940B576DB85E68E4540F87953910AB33940A7660FB4028F4540875E46B1DCB23940C3340C1F118F454079832F4CA6B23940B5075A81218F4540C164AA6054B239404ABF7D1D388F454088E5965643B23940AE1C5A643B8F4540DE2D90A0F8B1394043B79734468F45407B3F355EBAB1394011B40243568F45408A101E6D1CB139401F386744698F454051910A630BB139403BE97DE36B8F454043990D32C9B039408295438B6C8F4540525227A089B03940C21C3D7E6F8F454036A1100187B039407BAA436E868F4540D24334BA83B03940A6C2D842908F4540C4DCB5847CB039403455302AA98F4540523541D47DB03940E6A08499B68F454044EBA86A82B03940A653573ECB8F45408B976E1283B039407433DC80CF8F4540A74885B185B039401818B2BAD58F45408B976E1283B03940CA46205ED78F454019F0F96184B03940B5D7BB3FDE8F4540525227A089B0394011677E35079045400BC347C494B0394058302AA913904540192AC6F99BB0394034772D211F90454060F3716DA8B0394049205ED72F9045403515A930B6B03940171DC9E53F9045406E77D66EBBB03940D7B2B5BE48904540A7BC1DE1B4B039407B978BF84E9045408B0B0742B2B039409023D6E2539045406F5AF0A2AFB039409E8A54185B9045400BFD135CACB0394025BE13B35E90454044425BCEA5B03940D7EC8156609045405387DC0C37B0394082130A11709045407033DC80CFAF39409EE1067C7E9045401B03B2D7BBAF39402515C616829045407111DF8959AF3940A506D3307C90454080CAF8F719AF3940FAFC3042789045400ECCD1E3F7AE394048CEC29E7690454072982F2FC0AE39409DC420B072904540ACBB79AA43AE39401DB62DCA6C90454090ED7C3F35AE39401D0DE02D90904540741F80D426AE394000B37BF2B0904540D85F764F1EAE3940320DC347C4904540ACC090D5ADAE39409CC937DBDC9045402CEC6987BFAE394047D3D9C9E090454056B2632310AF394055573ECBF3904540AB1C5A643BAF3940806FD39FFD9045408E88299144AF3940794A07EBFF904540008750A566AF3940CE5D4BC8079145405548F949B5AF3940715F07CE1991454071C45A7C0AB039401461C3D32B914540D43E1D8F19B0394078BE9F1A2F914540546AF6402BB03940DC1B7C613291454062EE5A423EB039408E4AEA0434914540C53368E89FB03940EA82FA9639914540A8BC1DE1B4B039409CB1683A3B91454028E8F692C6B03940DC38622D3E9145409AC937DBDCB039408742041C4291454061A1D634EFB039409CCE4E06479145400B022B8716B13940DC722EC555914540D213967840B139402A61A6ED5F914540E07A14AE47B13940DC8F149161914540C303CAA65CB13940CE457C27669145407C5704FF5BB139404E546F0D6C91454098081B9E5EB139405596218E7591454018170E8464B1394071641EF983914540C303CAA65CB13940F897DD93879145407C3A1E3350B139405CF5B9DA8A914540B606B64AB0B03940A3DB4B1AA3914540285778978BB0394047C02154A99145401BEBE2361AB03940326EA301BC91454055D4601A86AF394032A86F99D3914540D58BA19C68AF3940B9DB2E34D79145408EA50F5D50AF3940245ED72FD8914540C776BE9F1AAF39406B0A9DD7D8914540D62FD80DDBAE3940F9622827DA91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB91454065DAFE9595AE3940AB9196CADB914540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1915, 0, NULL, '', '0102000020E61000002E01000067DAFE9595AE3940A89196CADB914540D82FD80DDBAE3940F6622827DA914540C976BE9F1AAF3940680A9DD7D891454090A50F5D50AF3940215ED72FD8914540D78BA19C68AF3940B6DB2E34D791454057D4601A86AF39402FA86F99D39145401DEBE2361AB039402F6EA301BC9145402A5778978BB0394044C02154A9914540B806B64AB0B03940A0DB4B1AA39145407E3A1E3350B1394059F5B9DA8A914540C503CAA65CB13940F597DD93879145401A170E8464B139406E641EF9839145409A081B9E5EB139405296218E759145407E5704FF5BB139404B546F0D6C914540C503CAA65CB13940CB457C2766914540D313967840B139402761A6ED5F9145400C022B8716B13940D9722EC55591454062A1D634EFB0394099CE4E06479145409BC937DBDCB039408442041C4291454029E8F692C6B03940D938622D3E914540A9BC1DE1B4B0394099B1683A3B914540C63368E89FB03940E782FA963991454063EE5A423EB039408B4AEA0434914540556AF6402BB03940D91B7C6132914540D53E1D8F19B0394075BE9F1A2F91454072C45A7C0AB039401161C3D32B9145405648F949B5AF39406E5F07CE19914540018750A566AF3940CB5D4BC80791454057B2632310AF394052573ECBF39045402DEC6987BFAE394044D3D9C9E0904540ADC090D5ADAE394099C937DBDC904540D95F764F1EAE39402F0DC347C4904540751F80D426AE3940FDB27BF2B090454091ED7C3F35AE39401A0DE02D90904540ADBB79AA43AE39401AB62DCA6C90454073982F2FC0AE39409AC420B0729045400FCCD1E3F7AE394045CEC29E76904540D556EC2FBBAF39402115C6168290454045425BCEA5B03940D3EC8156609045400CFD135CACB0394021BE13B35E904540705AF0A2AFB039409A8A54185B904540A9BC1DE1B4B0394077978BF84E9045407077D66EBBB03940D3B2B5BE489045403715A930B6B03940131DC9E53F90454062F3716DA8B0394045205ED72F9045401B2AC6F99BB0394030772D211F9045400DC347C494B0394054302AA913904540545227A089B039400D677E35079045401BF0F96184B03940B1D7BB3FDE8F45408D976E1283B03940C646205ED78F4540A94885B185B039401418B2BAD58F45408D976E1283B039407033DC80CF8F45400D897B2C7DB03940BECAA145B68F4540C6DCB5847CB039403055302AA98F4540D44334BA83B03940A2C2D842908F454038A1100187B0394077AA436E868F4540545227A089B03940BE1C3D7E6F8F454045990D32C9B039407E95438B6C8F454053910A630BB1394037E97DE36B8F45408C101E6D1CB139401B386744698F45407D3F355EBAB139400DB40243568F4540E02D90A0F8B139403FB79734468F45408AE5965643B23940AA1C5A643B8F4540C364AA6054B2394046BF7D1D388F45407B832F4CA6B23940B1075A81218F4540895E46B1DCB23940BF340C1F118F4540D09B8A5418B33940B1B0A71DFE8E4540888043A852B33940B176DB85E68E4540DC63E94317B439409C3C2CD49A8E454006D3307C44B43940F93A70CE888E454069A4A5F276B4394072EACA67798E45403E00A94D9CB4394087592F86728E45405ACEA5B8AAB4394040AD69DE718E454005F52D73BAB4394064834C32728E4540E860FD9FC3B43940CF05F52D738E45405A25581CCEB439405D5E807D748E4540CC237F30F0B439402419390B7B8E4540A1F31ABB44B53940CF3FC1C58A8E4540AF777FBC57B539400FC7BAB88D8E45404B546F0D6CB5394008A2EE03908E4540D9E6C6F484B53940BAD05CA7918E4540AE25E4839EB53940017D224F928E4540D87745F0BFB5394096FA7953918E4540E61890BDDEB5394008A2EE03908E4540578B4F0130B639408FB8C7D2878E4540F315A4198BB63940AC4CF8A57E8E4540F25487DC0CB73940FA00A436718E454080E7DEC325B73940C19E76F86B8E4540637094BC3AB7394065666666668E4540E3B8533A58B739401778EE3D5C8E4540712EC55565B73940BB3FDEAB568E45400DEECEDA6DB73940A6B393C1518E4540F07684D382B739408AE59656438E45409AF4BEF1B5B73940D13AAA9A208E4540E1DA5031CEB739406EC0E787118E4540E1F736FDD9B73940EEB1F4A10B8E4540C463062AE3B7394020D26F5F078E4540E0310395F1B73940CBBE2B82FF8D45406E38F3AB39B83940215ED72FD88D4540EDF44A5986B83940617138F3AB8D4540B4E9CF7EA4B83940B72DCA6C908D45402522C32ADEB839405422895E468D4540A56A82A8FBB83940F16DFAB31F8D4540416458C51BB939400EC85EEFFE8C4540CF13967840B93940E475FD82DD8C4540C120B07268B93940163FC6DCB58C4540C13D963E74B9394088C954C1A88C45405D1A868F88B93940E5AAB2EF8A8C4540A4E3310395B93940AC0EB9196E8C4540EB8FF7AA95B93940EC78CC40658C454024F224E99AB939407338F3AB398C45405D545227A0B939406C9F8EC70C8C45404F0ABABDA4B9394033C9C859D88B4540C1CE143AAFB9394049C49448A28B454096F04BFDBCB93940F47684D3828B4540DDF3C308E1B939406DCF2C09508B4540A552B3075AB9394091882991448B45406CD39FFD48B93940DF59BBED428B454017C05B2041B939408321AB5B3D8B45405E6C21C841B939400313B875378B454097B1683A3BB93940CAB08A37328B4540DE40481630B93940FCD005F52D8B454051A4C2D842B83940EE4CA1F31A8B454060062AE3DFB73940528D976E128B454061E42CEC69B739400BC4EBFA058B45408CDAC4C9FDB6394036A2B437F88A45401B2E39EE94B63940D327F224E98A45408E3F1878EEB5394045959A3DD08A45409DF31ABB44B53940B7024356B78A45401E4F92AE99B439409B17601F9D8A4540E63E00A94DB439409BFA7953918A4540CADF844204B4394094B8C7D2878A4540AEBAD573D2B339407807B133858A45404BE960FD9FB339407807B133858A4540139F02603CB339404D0C022B878A45403EEC4CA1F3B2394094B8C7D2878A45405BEFFE78AFB239400D850838848A4540DBA63FFB91B239408651499D808A45403163D17476B23940B871C45A7C8A4540954C158C4AB23940F8DBD781738A4540329886E123B239401C95D409688A45406BA301BC05B23940F9A10BEA5B8A45406C8104C58FB13940C1AE5FB01B8A454042F5D6C056B13940D7E3F736FD8945407B00529B38B13940E510AAD4EC894540C25565DF15B1394050766C04E2894540C2FEB27BF2B039401E390B7BDA8945405F670A9DD7B0394097054CE0D68945407CDE54A4C2B0394009ADC090D589454035A1100187B03940C925C79DD2894540C598BB9690AF3940E6B9F770C98945407E785DBF60AF39403BB05582C5894540F08E537424AF3940E69C11A5BD894540388DB454DEAE3940EDA4F78DAF89454063F7E461A1AE3940F4ACDD76A18945402BE7525C55AE394051AB21718F894540F3EE8FF7AAAD3940A74ACD1E688945401E3CDA3862AD394092A19C6857894540BB4D7FF623AD39408B5FEAE74D8945401F37C30DF8AC394052FDBCA948894540B0463D44A3AB3940123CF71E2E894540BFA8A44E40AB394004D578E926894540F83F87F9F2AA39407DA1B94E2389454023AAB706B6AA394036F5F3A6228945404F499D8026AA3940B6E600C11C894540FBF675E09CA9394036D80DDB168945406DB6B9313DA93940AFA44E4013894540B4EEE6A90EA9394068F88898128945402752616C21A8394093F337A110894540C524236761A73940E1C4C9FD0E894540D5B628B341A6394036BB270F0B8945403949BA66F2A53940848CB96B098945402CDD240681A5394012E544BB0A8945409E9C685721A539401927F73B1489454066520ABABDA439408BEB51B81E894540BCD4CF9B8AA439407DA1B94E23894540E7E74D452AA43940BD28B34126894540BDE78711C2A33940445C72DC29894540CBF753E3A5A33940AFDE1AD82A894540CB83BBB376A33940AFDE1AD82A8945403DB7973446A3394021868F8829894540F6EDEBC039A33940DAD9C9E028894540058A1F63EEA239405ACBD6FA2289454005168733BFA23940F66DFAB31F894540770F971C77A23940765F07CE19894540CDE3F736FDA139406F1D554D1089454086FD65F7E4A13940DA9FFD48118945403F34BA83D8A139408CCE6BEC1289454086C3995FCDA1394013022B8716894540940D32C9C8A139402FB3412619894540E90390DAC4A13940288E75711B89454014FF3EE3C2A139403D1AC05B20894540A257CA32C4A13940767CED9925894540A274B0FECFA13940A8B94E232D89454085FD65F7E4A1394021A37554358945404C0FD1E80EA239405A22895E46894540858EE4F21FA23940D30BB08F4E894540CC5790662CA239404CF5D6C056894540F76F253B36A23940378672A25D894540BE2ADEC83CA23940DB6A48DC63894540F78C0B0742A23940BED617096D89454085E5965643A23940C518CA89768945402188BA0F40A23940D37F48BF7D894540DABE0E9C33A2394053AB21718F894540DABE0E9C33A239400C1C42959A8945401304560E2DA23940E862450DA68945403EE21E4B1FA2394004314278B489454013E76F4221A2394092A6B393C18945404C499D8026A23940A00D32C9C88945404C66834C32A2394012D28C45D389454085E5965643A23940CB42AD69DE894540135B087250A239404B51A04FE48945409369FB5756A23940D2845FEAE78945405A24B4E55CA23940BD15FBCBEE894540A1D0798D5DA23940F677280AF4894540AF1A12F758A23940CB995FCD018A4540F68C0B0742A2394012BABDA4318A45403D1CEBE236A2394059A04FE4498A454004BABDA431A239402780D4264E8A4540F6523F6F2AA23940A78EC70C548A454068A301BC05A2394027D7868A718A454068861BF0F9A1394020CFA0A17F8A45402F24EEB1F4A13940BC8EAA26888A454084FD65F7E4A1394020EC866D8B8A4540A19196CADBA13940B569DE718A8A454021F224E99AA13940CB9E76F86B8A4540E9FE78AF5AA1394004AAF1D24D8A4540220AF4893CA13940990A630B418A4540945AB6D617A13940A01249F4328A45402305DD5ED2A03940E05F764F1E8A45401581785DBFA03940842766BD188A45405CF3716DA8A03940B647E17A148A45404E5227A089A039403639EE940E8A454015D3139678A03940FDD6C056098A45400732C9C859A039404466A032FE894540B2E4B8533AA039404449BA66F289454087CC237F30A0394084B3CD8DE9894540CE3E1D8F19A039408B9ECDAACF894540231895D409A03940845C1B2AC689454078F10C1AFA9F3940521FBAA0BE894540F8C53368E89F39403D936FB6B98945406A50C24CDB9F3940FD0B76C3B6894540236A300DC39F39405202D4D4B28945406AA25D85949F3940677138F3AB894540314030478F9F3940D918ADA3AA8945406B9D465A2A9F3940A0B67F65A5894540FA2A8716D99E3940AE0018CFA08945403431EBC5509E39403517F19D98894540DFC6F484259E3940EE6A2BF697894540EEB4C35F939D394035FA0AD28C894540D2722EC5559D3940671A868F88894540E160FD9FC39C39403C02F1BA7E89454045A1F31ABB9C39403C02F1BA7E894540A9E1E995B29C394083AEB6627F894540E2263108AC9C3940EE305F5E808945407062D68BA19C394059B3075A81894540D4A2CC06999C394059B3075A818945407F8F8829919C3940EE305F5E808945408DD920938C9C3940F5552B137E89454046F38E53749C3940E0C9E02879894540F131E6AE259C394060BBED4273894540551B2AC6F99B3940AE8C7F9F7189454080F9F202EC9B3940D26262F37189454080DC0C37E09B3940A767B3EA73894540ABD7BB3FDE9B39402E9B72857789454072758E01D99B39402776A6D079894540640E10CCD19B3940D9A414747B89454056A79196CA9B39402051DA1B7C894540E4E2361AC09B3940D9A414747B894540B9CAA145B69B39402776A6D07989454080687407B19B3940E7EEACDD768945401C0B98C0AD9B39408391D09673894540F10FE9B7AF9B3940430AD7A370894540C6143AAFB19B39402759C0046E8945409BFCA4DAA79B39400BA8A9656B894540D441EC4CA19B394059793BC2698945407136AB3E579B3940FD402B3064894540E3F5EE8FF79A3940368672A25D89454064A818E76F9A3940E897FA7953894540ACF81400E399394076D39FFD48894540C935936FB6993940364CA60A46894540E6ACDD76A19939409284B69C4B894540CAA414747B99394099A98251498945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A478945409FA9656B7D993940C4A4315A47894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1636, 0, NULL, '', '0102000020E61000008E000000BD1DE1B4E0953940E10B93A9828D4540D9CEF753E3953940EF552B137E8D454084F57F0EF3953940A8A9656B7D8D454020D7868A719639404C546F0D6C8D45403B1E335019973940211FF46C568D454010406A13279739402844C021548D4540658D7A88469739405322895E468D4540ACCABE2B82973940C58F31772D8D45400F9C33A2B4973940A27F828B158D454080B74082E29739408DB96B09F98C4540F27B9BFEEC97394031815B77F38C45400E4A9869FB973940B1726891ED8C45409C6D6E4C4F98394015799274CD8C4540FF04172B6A983940A3B437F8C28C4540FF21FDF6759839402ACB10C7BA8C45408D976E1283983940787FBC57AD8C45409BFEEC478A9839406A183E22A68C4540D47D00529B9839406AFB57569A8C45400DFD135CAC9839408EB454DE8E8C454054008C67D0983940959F54FB748C4540FF261422E0983940DC2E34D7698C4540F1332E1C0899394087FE092E568C45407FA99F37159939400E15E3FC4D8C45401B69A9BC1D9939409C508880438C4540FED478E92699394039D6C56D348C4540E14048163099394039B9DFA1288C45409AEB34D252993940B24B546F0D8C454053793BC2699939404FD1915CFE8B4540E10B93A982993940EC56CF49EF8B4540D318ADA3AA993940507ADFF8DA8B4540446E861BF0993940D756EC2FBB8B4540FC8C0B07429A3940B4295778978B4540A60A4625759A39409119A88C7F8B4540B4E55C8AAB9A394091DFDBF4678B45404278B471C49A3940D149EF1B5F8B4540DE54A4C2D89A3940DF9387855A8B4540098A1F63EE9A39405860C8EA568B4540EB8B84B69C9B39401FC4CE143A8B4540A31EA2D11D9C3940186536C8248B4540DCD78173469C3940E627D53E1D8B4540CE8DE9094B9C394058CF49EF1B8B4540F9A57EDE549C3940184850FC188B4540956588635D9C394091149161158B454015747B49639C39400AE1D1C6118B454015747B49639C3940D17EA4880C8B454023BE13B35E9C3940F5FDD478E98A45403F6F2A52619C394043B28009DC8A45405B5A0D897B9C394059AD4CF8A58A4540307C444C899C3940D23FC1C58A8A45409313ED2AA49C394068834C32728A4540E8263108AC9C3940EF9925016A8A45402FD3F6AFAC9C39409361156F648A45405ACEA5B8AA9C3940E132A7CB628A4540BE0E9C33A29C39407DD5CA845F8A45403E00A94D9C9C394059FFE7305F8A45406987BF266B9C3940A0ABADD85F8A45403E6F2A52619C3940EE7C3F355E8A4540CCAACFD5569C394027C286A7578A45405A77F354879C39400B117008558A4540DAF97E6ABC9C39406007CE19518A454076103B53E89C39402080D4264E8A454067CBB914579D394035EF3845478A45404A02D4D4B29D3940CA4FAA7D3A8A4540F4D6C056099E3940CA32C4B12E8A454002B2D7BB3F9E394098F56228278A45405739B4C8769E39405F9335EA218A4540E5797077D69E3940D85F764F1E8A4540D7868A71FE9E3940263108AC1C8A4540F2CD3637A69F39405F764F1E168A4540F27B9BFEEC9F39401FEF552B138A4540381092054CA0394074E5B33C0F8A454071C971A774A03940E68C28ED0D8A454071E6577380A03940E68C28ED0D8A45409CFEEC478AA039402D39EE940E8A4540D5264EEE77A03940F4D6C056098A45407238F3AB39A039403B49BA66F2894540D63E1D8F19A03940A674B0FECF894540BA7020240BA039409F32FE7DC68945409EA223B9FC9F3940D87745F0BF894540498FDFDBF49F394098F04BFDBC894540746DA818E79F3940EDE6A90EB989454011F3E505D89F3940AD5FB01BB6894540E6BD6A65C29F39404902D4D4B289454075A25D85949F39405E7138F3AB894540AEE7A4F78D9F3940D018ADA3AA894540769D465A2A9F394097B67F65A589454077D2FBC6D79E3940822A357BA089454031E7525C559E39402D17F19D988945404E7B832F4C9E394009410E4A988945404E24D1CB289E3940E56A2BF697894540DD7745F0BF9D39409057E7189089454008E275FD829D39409EA17F828B8945406C91ED7C3F9D3940D0C1FA3F878945404274417DCB9C39407BAEB6627F894540175CACA8C19C39403402F1BA7E894540EC4317D4B79C39403402F1BA7E8945405ECEA5B8AA9C3940C25A7C0A8089454033B610E4A09C39407489EAAD81894540504A41B7979C394050B3075A8189454017E81379929C3940090742B28089454097D920938C9C3940ED552B137E894540979F54FB749C3940D8C9E02879894540FB31E6AE259C394058BBED42738945400925CCB4FD9B3940CA6262F37189454050B4AB90F29B394083B69C4B71894540B4F4A10BEA9B3940EE38454772894540D188D2DEE09B3940A067B3EA738945404330478FDF9B39409942E73576894540DFD26A48DC9B39406E47382D788945401818B2BAD59B394067226C787A894540DFB5847CD09B3940D2A414747B89454018FBCBEEC99B39401951DA1B7C894540358FFCC1C09B3940F57AF7C77B89454052232D95B79B3940434C89247A894540D2143AAFB19B394003C58F31778945406EB75D68AE9B39407C91D09673894540B5632310AF9B39403C0AD7A370894540D1143AAFB19B39402059C0046E8945407C01F6D1A99B394004A8A9656B89454051E960FD9F9B394052793BC269894540C3E270E6579B394019170E8464894540C4FA3F87F99A39402E8672A25D8945407E2C7DE8829A39406EF085C9548945400DD7A3703D9A394059643BDF4F894540E3F3C308E19939406ED39FFD488945401CE25817B79939402E4CA60A46894540F1ACDD76A19939408A84B69C4B89454063FD9FC37C993940B57F65A549894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540AAA9656B7D993940BCA4315A47894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1668, 0, NULL, '', '0102000020E6100000C6000000B8EEE6A90E9939407333DC80CF874540553A58FFE79839408F01D9EBDD8745401C649291B39839409D853DEDF0874540F2F44A5986983940B22E6EA301884540C8A2E9EC64983940F9F719170E88454081D93D79589839400E84640113884540ACB706B64A983940CE1951DA1B8845407355D97745983940E3A59BC4208845400FF8FC3042983940CE3637A627884540C84B378941983940721B0DE02D88454056A4C2D842983940A4586E69358845401D5F7B6649983940809F71E1408845401D7C6132559839400E15E3FC4D884540F29D98F562983940C060376C5B8845402B00C63368983940CEC7B5A1628845400005172B6A98394095826E2F69884540E453008C67983940159161156F8845400F32C9C859983940637FD93D7988454056C1A8A44E9839404E10751F80884540D678E9263198394040E3C281908845404803780B249839407220240B988845409DF9D51C2098394064D68BA19C884540C8F484251E983940723D0AD7A3884540564D10751F983940CE751A69A9884540BAAAECBB2298394007D847A7AE884540566AF6402B983940153FC6DCB5884540AB9A20EA3E983940C78A1A4CC388454047CEC29E76983940CE069964E48845402A91442FA3983940319E4143FF884540B806B64AB098394086B18520078945402AE8F692C69839400D022B87168945400D71AC8BDB98394030F5F3A62289454070EB6E9EEA9839401361C3D32B8945400CC85EEFFE983940D3F6AFAC348945408CF337A110993940EFA7C64B37894540D31396784099394076DB85E63A8945408BF84ECC7A99394021E527D53E894540FCA4DAA7E39939400C76C3B645894540DFDBF4673F9A3940F7065F984C89454009BFD4CF9B9A3940E297FA7953894540C1FA3F87F99A3940A952B3075A894540DD9387855A9B3940B7B9313D618945404EE960FD9F9B394013F241CF66894540DC5ED218AD9B3940A14ACD1E6889454095CFF23CB89B394005A8A9656B894540EAE2361AC09B3940774F1E166A8945403FF67AF7C79B394053793BC269894540DBB5847CD09B3940774F1E166A894540A2703D0AD79B394005A8A9656B894540B0D7BB3FDE9B3940452FA3586E894540CC88D2DEE09B3940A98C7F9F71894540CC88D2DEE09B3940A267B3EA73894540682BF697DD9B3940299B72857789454076758E01D99B39402276A6D079894540680E10CCD19B3940D4A414747B89454013FBCBEEC99B39401B51DA1B7C894540A1367172BF9B3940D4A414747B8945404C232D95B79B39402276A6D0798945403055302AA99B3940FE9FC37C79894540697D91D0969B3940F77AF7C77B894540A26B26DF6C9B3940E20B93A98289454069CF2C09509B3940F797DD93878945405B2EE23B319B394029D53E1D8F894540BFDD59BBED9A39403759A31EA2894540C064AA60549A3940F745425BCE894540246BD443349A3940FE87F4DBD789454016390B7BDA99394085F57F0EF389454097081B9E5E993940EFCEDA6D178A45405F156F641E993940212922C32A8A45408AB96B09F99839408CC8B08A378A45402722C32ADE9839402888BA0F408A454060670A9DD79839402163EE5A428A454052008C67D0983940131956F1468A4540604A24D1CB983940B7FD2B2B4D8A4540604A24D1CB98394085DDB06D518A4540354F75C8CD98394030E7525C558A4540FC092E56D4983940B71A12F7588A4540511D7233DC9839401B78EE3D5C8A4540DF92E34EE9983940A2ABADD85F8A4540420DA661F898394077B0FECF618A454009E544BB0A993940BE5CC477628A45405005A3923A993940E232A7CB628A4540ECFE78AF5A993940BE5CC477628A454006850838849A3940A2ABADD85F8A4540F5A067B3EA9B39406224B4E55C8A454066F6402B309C3940B0F545425B8A4540C9AACFD5569C394029C286A7578A4540F319170E849C39400D117008558A45408FC151F2EA9C39402280D4264E8A4540F2234564589D3940141956F1468A4540F1D6C056099E3940CD32C4B12E8A4540B80512143F9E3940BFCB457C278A4540A92F12DA729E39408669183E228A4540A8FA5C6DC59E3940220C3CF71E8A45408BDAC4C9FD9E3940293108AC1C8A4540C34109336D9F3940377BA015188A454042ACC5A700A03940B76CAD2F128A45407ABC57AD4CA0394077E5B33C0F8A45404F185B0872A03940E98C28ED0D8A45404F5227A089A039400D630B410E8A45404F6F0D6C95A03940063E3F8C108A45401681785DBFA039407F2766BD188A45402405DD5ED2A03940B88993FB1D8A4540A4A44E4013A139400DBABDA4318A4540EBA7C64B37A13940BF0512143F8A4540A452B3075AA13940DBD30E7F4D8A45405D1A868F88A1394006098A1F638A4540F94D2844C0A1394046CA4FAA7D8A45405C764F1E16A2394014018750A58A454094C0ADBB79A23940374B02D4D48A454014265305A3A23940A2CDAACFD58A4540948BF84ECCA2394054FC1873D78A4540F75C6DC5FEA2394094831266DA8A454021E99AC937A33940B859F5B9DA8A454076FCDEA63FA3394094831266DA8A45404B3BFC3559A33940E9797077D68A45404B75C8CD70A3394022BFB7E9CF8A4540A0DFBE0E9CA3394029C79DD2C18A4540670E10CCD1A33940B0C090D5AD8A4540679F8EC70CA439402970EB6E9E8A454092B7239C16A439407E6649809A8A4540AEDCD26A48A43940BEB376DB858A4540676AD95A5FA439401BB2BAD5738A4540D94B1AA375A43940147008556A8A4540E7B298D87CA439408D3C49BA668A4540D968006F81A4394006098A1F638A45402E7C444C89A4394054DA1B7C618A454011E8137992A43940E9577380608A4540CA58349D9DA43940A2ABADD85F8A454003F52D73BAA439405BFFE7305F8A45409FD11DC4CEA43940145322895E8A4540BBF6CC9200A5394054DA1B7C618A45409E7F828B15A539409B86E123628A45401061C3D32BA5394022BAA0BE658A4540AC3DB32440A53940A9ED5F59698A45405747551344A53940147008556A8A45402C4CA60A46A5394054F701486D8A454048FDBCA948A5394029FC523F6F8A45400FB875374FA53940B754DE8E708A4540AB94658863A5394045AD69DE718A4540390AD7A370A53940D305F52D738A4540D5E6C6F484A539403763D174768A4540E38711C2A3A5394069A032FE7D8A4540AA997CB3CDA539409BDD9387858A4540F1B9DA8AFDA5394014C7BAB88D8A4540C615DEE522A639408DB0E1E9958A454070594C6C3EA639404D46CEC29E8A4540C589761552A63940C62FF5F3A68A4540F0A10BEA5BA63940B1C090D5AD8A4540F0BEF1B567A63940630CE544BB8A4540F0DBD78173A6394031095053CB8A454037889D2974A6394046959A3DD08A45401BD7868A71A63940C6A38D23D68A45408D7EFB3A70A639404DD74CBED98A454029211FF46CA63940F8E0EEACDD8A4540E257738060A63940BF9BA73AE48A4540E23A8DB454A639404DF4328AE58A4540B722F8DF4AA639404DF4328AE58A45407E4C327216A63940F1BB22F8DF8A4540C5DB114E0BA63940CDE53FA4DF8A45407E1266DAFEA539401492054CE08A4540E2525C55F6A53940C6C073EFE18A4540469352D0EDA53940B876DB85E68A45401B7BBDFBE3A53940780CC85EEF8A4540620A9DD7D8A539407F4E7ADFF88A454054A31EA2D1A539401B0E8464018B4540F045425BCEA53940774694F6068B454062EDB60BCDA539403E014D840D8B45407E9ECDAACFA539406919E258178B45401A5ED72FD8A539409431772D218B4540EF622827DAA53940F06987BF268B4540610A9DD7D8A539406953AEF02E8B454045598638D6A5394070956071388B4540FEACC090D5A539406285949F548B45400C143FC6DCA53940CD242367618B4540C432C4B12EA63940B8B5BE48688B454027EC6987BFA63940CD4109336D8B45408A831266DAA63940CD4109336D8B45408ABDDEFDF1A63940A96B26DF6C8B4540ED8E537424A73940450E4A98698B4540EDC81F0C3CA73940295D33F9668B4540FB4C840D4FA739407E53910A638B45406D11DF8959A739401AF6B4C35F8B4540C224236761A739406FEC12D55B8B4540259FE57970A73940D32C0950538B45406C6891ED7CA73940C5C58A1A4C8B4540979D0C8E92A73940A9F78DAF3D8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540EC936A9F8EA739403E75E5B33C8B4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1213, 0, NULL, '', '0102000020E61000003B010000F836FDD98FAC394047CEC29E76884540BFD4CF9B8AAC3940CE0182397A88454014CB2DAD86AC3940553541D47D8845408672A25D85AC3940DC68006F818845403FC6DCB584AC3940639CBF09858845402315C61682AC3940EACF7EA488884540780B24287EAC394095D920938C884540F8FC304278AC3940878F8829918845405C2041F163AC3940234F92AE998845406A1327F73BAC3940CE751A69A988454087A757CA32AC394007D847A7AE884540C0EC9E3C2CAC3940403A75E5B3884540EBE74D452AAC39401C81785DBF884540079964E42CAC3940F8C77BD5CA8845404E452A8C2DAC3940312AA913D0884540329413ED2AAC39404DDBBFB2D2884540F931E6AE25AC394022E010AAD488454016C616821CAC39401BBB44F5D68845407AE9263108AC3940C6C4E6E3DA8845401718B2BAD5AB3940865AD3BCE3884540DF0720B589AB3940BFD9E6C6F4884540A714747B49AB3940462A8C2D04894540E0E522BE13AB3940B1C91AF5108945400BC4EBFA05AB3940F15014E813894540FD5C6DC5FEAA3940C65565DF15894540EFF5EE8FF7AA3940BF30992A18894540FD3F87F9F2AA3940DBE1AFC91A894540E18E705AF0AA3940F792C6681D8945409AE2AAB2EFAA394077A1B94E23894540FE22A12DE7AA394077A1B94E23894540FEAE08FEB7AA394030F5F3A62289454054BD35B055AA394085EB51B81E8945407FD0B359F5A93940DAE1AFC91A89454080E882FA96A939400C022B8716894540C8AC174339A9394085CE6BEC12894540E592E34EE9A839401A4CC3F011894540CAF484251EA83940681D554D10894540832BD9B111A839403D22A64412894540D82137C30DA83940EF5014E8138945402D1895D409A839402FD80DDB168945409FBF098508A839409335EA211A8945402D1895D409A839407EC685032189454074C45A7C0AA8394053CBD6FA228945409075711B0DA8394005FA449E248945402DA4FCA4DAA73940695721E527894540670113B875A739403737A6272C8945403D75E5B33CA739409B94826E2F894540AFFF73982FA73940E24048163089454004D9EBDD1FA73940B745990D32894540BD0F406A13A73940B020CD5834894540AFA8C1340CA73940A9FB00A436894540BDF2599E07A739407E00529B38894540F637A11001A73940CCEEC9C3428945404B2EFF21FDA63940B77F65A5498945407629AE2AFBA63940C5E6E3DA508945403DE466B801A73940FE65F7E461894540AFA8C1340CA73940A96F99D36589454084AD122C0EA739400DCD751A69894540F65487DC0CA73940B8D617096D894540CB3CF20703A739409B42E7357689454084734694F6A639407EAEB6627F894540DA12F241CFA639401366DAFE95894540BED05CA791A639407D3F355EBA894540BEB376DB85A63940AF7C96E7C18945404CD235936FA63940849ECDAACF8945403E4ED1915CA63940A06CCA15DE894540BE3FDEAB56A63940D9CEF753E38945405AE2016553A63940E7357689EA894540CC89761552A639401973D712F2894540F784251E50A63940040473F4F889454093442FA358A639403D8386FE098A45403E4ED1915CA6394060764F1E168A45403E4ED1915CA639400B80F10C1A8A4540B0F545425BA63940273108AC1C8A45404C9869FB57A63940200C3CF71E8A4540CC89761552A63940609335EA218A4540777632384AA63940A01A2FDD248A45404C5E9D6340A6394099F56228278A45403090A0F831A6394099F56228278A454005780B2428A639402E73BA2C268A4540B064C74620A63940A01A2FDD248A4540699B1BD313A63940F5108DEE208A4540778E01D9EBA53940D9429083128A45408581E7DEC3A5394027F73B14058A454013A0A696ADA53940603C8386FE894540E86A2BF697A53940925CFE43FA894540E8305F5E80A53940C47C7901F6894540930035B56CA53940EF77280AF48945407715527E52A53940A8CB6262F3894540302FC03E3AA53940611F9DBAF2894540DB1B7C6132A53940611F9DBAF28945403F3F8C101EA53940CCA145B6F38945405CB6D61709A539405AFAD005F58945404EF8A57EDEA43940050473F4F889454023C32ADEC8A43940FEDEA63FFB894540C02B82FFADA43940851266DAFE894540B23385CE6BA439403E8386FE098A4540A43B889D29A439403EA06CCA158A45408850A5660FA439409AD87C5C1B8A4540A5C7EF6DFAA339401AE76F42218A454089DC0C37E0A339408CABCABE2B8A4540FB669B1BD3A339400CBABDA4318A4540EDFF1CE6CBA339400595F1EF338A4540DF989EB0C4A33940E1BE0E9C338A45407B3BC269C1A339402F90A0F8318A45407B3BC269C1A3394013DF89592F8A454026624A24D1A339404CEA0434118A454034C9C859D8A33940FEDEA63FFB894540B4D7BB3FDEA339408CFD65F7E48945405FE15D2EE2A33940B7BE4868CB894540D188D2DEE0A33940E9DEC325C7894540B5D7BB3FDEA33940F7285C8FC289454060C47762D6A33940F0E6A90EB98945400BB13385CEA3394005560E2DB2894540EFE2361AC0A33940699604A8A98945406F9A779CA2A339400D410E4A988945408B687407B1A3394054B3075A818945408B687407B1A33940F0552B137E894540520647C9ABA33940454C89247A894540D2F753E3A5A33940299B728577894540198733BF9AA33940A267B3EA738945406016139B8FA339407E91D096738945408B11C2A38DA3394085B69C4B718945408B11C2A38DA3394005A8A9656B894540A7C2D84290A339400CB08F4E5D894540351B649291A339409AEB34D2528945407CC7293A92A33940CC0BB08F4E8945400A20B58993A3394021020EA14A894540EE6E9EEA90A33940E17A14AE4789454035FE7DC685A33940367172BF438945405236E50AEFA2394076A1B94E238945409A2F2FC03EA239407DA99F37158945403741D47D00A23940681D554D10894540A9AE7C96E7A13940AFC91AF51089454062E5D022DBA139403D22A64412894540A974B0FECFA13940A17F828B158945409B0D32C9C8A1394028B3412619894540F00390DAC4A13940683A3B191C89454062AB048BC3A13940CC9717601F89454062AB048BC3A13940BE4D7FF623894540C608E1D1C6A1394045813E912789454062C8EA56CFA139407EE36BCF2C894540B7F81400E3A13940D3F6AFAC34894540281422E010A239409ACE4E0647894540FD3559A31EA23940855FEAE74D894540D25790662CA23940FE48111956894540D274763238A23940E1B4E0455F894540E0DBF4673FA2394036C82423678945404439D1AE42A239401934F44F708945408BE5965643A239409942E73576894540528369183EA23940E7305F5E80894540E0BE0E9C33A239406E8104C58F894540991249F432A2394027F224E99A89454035B56CAD2FA23940592F8672A2894540274EEE7728A239403C9B559FAB8945408B8EE4F21FA23940D85A5F24B4894540D23AAA9A20A239404A1FBAA0BE89454052499D8026A23940980D32C9C8894540C40DF8FC30A239409F4FE449D28945404439D1AE42A239407B96E7C1DD8945408B027D224FA23940D7CEF753E389454027C286A757A2394010312592E8894540A7D0798D5DA23940D7EBDD1FEF8945406024B4E55CA2394050D50451F78945409969FB5756A239409079E40F068A4540441CEBE236A2394050A04FE4498A45406FA301BC05A23940FA00A436718A4540613C8386FEA139404F14E813798A45406F861BF0F9A13940F3F8BD4D7F8A45403624EEB1F4A13940B38EAA26888A45406102B7EEE6A13940CF3FC1C58A8A4540EF3D5C72DCA13940F315A4198B8A454028F224E99AA13940C19E76F86B8A454037AB3E575BA13940FAA9F1D24D8A45409B94826E2FA139407A7E18213C8A454062F8889812A13940E5E3DA50318A454038A6272CF1A03940DEA128D0278A45402A05DD5ED2A03940D75F764F1E8A45401C81785DBFA039407B2766BD188A454063F3716DA8A03940AD47E17A148A4540E3AAB2EF8AA039402D39EE940E8A4540637FD93D79A039403B8386FE098A45402B8C2D0439A039401873D712F289454048E6913F18A039403CF20703CF894540BA7020240BA03940A032FE7DC68945400F4A9869FB9F3940B5A1629CBF8945409D853DEDF09F39400A98C0ADBB8945409D685721E59F3940CA10C7BAB8894540F241CF66D59F394066B3EA73B5894540E4BD6A65C29F3940262CF180B2894540AB048BC3999F3940A61DFE9AAC894540F2936A9F8E9F3940D118ADA3AA8945402CF180B2299F394098B67F65A5894540BB7EC16ED89E3940832A357BA089454003ECA353579E394051EDD3F198894540D8D30E7F4D9E39400A410E4A98894540751F80D4269E3940E66A2BF697894540BDC62E51BD9D39409157E718908945405AF5B9DA8A9D3940E64D452A8C89454093C6681D559D39405F1A868F8889454077D66EBBD09C39409F8499B67F89454077B988EFC49C39403402F1BA7E8945404CA1F31ABB9C39403402F1BA7E8945404C840D4FAF9C39407BAEB6627F8945401322E010AA9C3940E6305F5E8089454030B610E4A09C394051B3075A81894540224F92AE999C394051B3075A81894540A2409FC8939C39400A0742B280894540B08A37328F9C39407CAEB6627F8945404C2D5BEB8B9C3940CA7F48BF7D8945404CF38E53749C3940B5F3FDD478894540B0852007259C394059BBED4273894540BE95ECD8089C3940CB6262F37189454093607138F39B3940A78C7F9F71894540CCA5B8AAEC9B3940CB6262F37189454013359886E19B39407D91D09673894540F78381E7DE9B3940E1EEACDD7689454005CE1951DA9B3940DAC9E02879894540F7669B1BD39B3940AFCE31207B89454030ACE28DCC9B3940F67AF7C77B894540DB989EB0C49B39401A51DA1B7C894540F82CCF83BB9B39408CF84ECC7A894540781EDC9DB59B3940DAC9E02879894540CD143AAFB19B3940E1EEACDD76894540F80FE9B7AF9B39400CEA5BE674894540B1632310AF9B3940F03845477289454086687407B19B3940D4872EA86F894540CD143AAFB19B39402259C0046E8945407801F6D1A99B394006A8A9656B894540B1463D44A39B39409B25016A6A89454031384A5E9D9B394054793BC269894540C0E270E6579B39401B170E846489454032A2B437F89A3940308672A25D8945406CA818E76F9A3940E297FA79538945409847FE60E099394070D39FFD488945406ED39FFD48993940B7627FD93D894540FD9AAC510F9939405305A3923A89454061DBA2CC069939400C59DDEA398945407E52EDD3F1983940E15D2EE23B894540E292E34EE9983940053411363C8945401BD82AC1E29839409AB1683A3B894540B77A4E7ADF983940A1D634EF388945402922C32ADE983940F6CC920035894540A913D044D89839405A0D897B2C894540E25817B7D19839400C1F1153228945407094BC3AC798394030D80DDB16894540B706B64AB098394062DBA2CC06894540703D0AD7A398394054742497FF884540F180B22957983940E35817B7D188454063D17476329839407177D66EBB8845400057B26323983940715AF0A2AF884540554D10751F983940F14BFDBCA9884540C7F484251E983940713D0AD7A3884540554D10751F98394038DBDC989E88454071FE261422983940234F92AE99884540E3C281902C98394038BEF6CC92884540382D78D15798394015AE47E17A8845400D4FAF94659839400E6C956071884540B8585183699839408E5DA27A6B884540B8585183699839400E4FAF946588454054FB743C669839406A6AD95A5F884540718FA50F5D9839403F52448655884540AAB706B64A983940EA211ADD418845409C508880439839405587DC0C37884540C74B37894198394095F1EF332E8845400EF8FC304298394063B48EAA2688454000AE64C746983940554D10751F88454055C1A8A44E9839408E9257E7188845400E32C9C859983940C7D79E59128845400E4FAF9465983940D52137C30D88454063105839B49839409C853DEDF0874540714221020E9939409509BFD4CF874540F1A7C64B379939400EB9196EC08745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD8745409C94826E2F993940AA5B3D27BD874540', NULL, NULL);
INSERT INTO "tripshape" VALUES (158, 0, NULL, '', '0102000020E610000050000000F7CC920035A53940B554DE8E708A45401427F73B14A53940917EFB3A708A45405B5F24B4E5A439408A592F86728A4540062FFA0AD2A43940D105F52D738A4540EA60FD9FC3A439405F5E807D748A4540C00E9C33A2A43940DF6C73637A8A4540327C444C89A43940B471C45A7C8A4540B2DCD26A48A43940BBB376DB858A454096B7239C16A439409E3C2CD49A8A4540B34B546F0DA43940029A081B9E8A45405EC47762D6A33940FB912232AC8A4540FBB836548CA3394082FFAD64C78A45407B7077D66EA33940656B7D91D08A4540503BFC3559A33940095053CBD68A45405E4BC8073DA33940B459F5B9DA8A4540975643E21EA33940B459F5B9DA8A45406D04E275FDA2394090831266DA8A4540A6B8AAECBBA23940095053CBD68A4540DFE00B93A9A23940C2A38D23D68A4540A661F88898A239407BF7C77BD58A4540DF6C73637AA239405721E527D58A454052F2EA1C03A23940506B9A779C8A4540D3C1FA3F87A13940DF32A7CB628A4540533F6F2A52A1394051A04FE4498A4540A9FB00A436A13940982F2FC03E8A4540E2067C7E18A13940BCE82B48338A4540A94D9CDCEFA0394099F56228278A45402905DD5ED2A03940B68993FB1D8A4540622D3E05C0A039407D2766BD188A45407F6ABC7493A03940043E3F8C108A454046EBA86A82A03940E88C28ED0D8A4540AA0EB9196EA03940E88C28ED0D8A4540E6797077D69E3940B68993FB1D8A4540755E6397A89E39408B8EE4F21F8A4540044356B77A9E39403DBD5296218A45403D1405FA449E394052499D80268A4540AFD3484BE59D3940E0BE0E9C338A45407715527E529D39407C9BFEEC478A454022AB5B3D279D39402080D4264E8A45403FE8D9ACFA9C3940E73A8DB4548A4540B1726891ED9C39409969FB57568A4540865AD3BCE39C394027C286A7578A454023C32ADEC89C394043739D465A8A454040575BB1BF9C39405F24B4E55C8A45405DEB8B84B69C3940E6577380608A4540EB263108AC9C3940A6ED5F59698A45404F672783A39C394066834C32728A454079103B53E89C39406DC5FEB27B8A45405CB6D617099D3940897615527E8A4540F892C6681D9D3940D022DBF97E8A4540CDD1E3F7369D39403BA583F57F8A4540BFC11726539D39408251499D808A4540DBE6C6F4849D39408251499D808A4540B0997CB3CD9D3940EDD3F198818A4540F6DBD781739E3940F415A4198B8A4540BDB376DB859E39407B4963B48E8A454084A8FB00A49E3940C91AF5108D8A45402085EB51B89E394010C7BAB88D8A4540039F1F46089F394090D5AD9E938A45406653AEF02E9F3940D7BB3FDEAB8A4540916B43C5389F3940737B4963B48A4540E67E87A2409F39403311363CBD8A4540F4716DA8189F3940C88E8D40BC8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540F4716DA8189F39404FC24CDBBF8A4540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1809, 0, NULL, '', '0102000020E6100000E000000067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE3914540D981734694AE39405AC0046EDD91454067DAFE9595AE3940217BBDFBE39145403CDF4F8D97AE3940768E01D9EB91454004B2D7BB3FAE3940923F1878EE914540CC845FEAE7AD3940D2C6116BF19145407789EAAD81AD3940124E0B5EF4914540B15582C5E1AC394027DA5548F99145405CB1BFEC9EAC3940B532E197FA914540F919170E84AC3940FCDEA63FFB914540967D5704FFAB3940603C8386FE91454097CADB114EAB394075C8CD7003924540345019FF3EAB3940BC74931804924540892991442FAB394027F73B140592454009FEB7921DAB3940D925AAB70692454089B5F81400AB3940A7052FFA0A924540897B2C7DE8AA394099BB96900F9245407BA01518B2AA39406EDDCD531D92454042E7357689AA3940751F80D426924540EDB60BCD75AA394067D5E76A2B924540A6D0798D5DAA394035B56CAD2F924540183E22A644AA39402E90A0F8319245408A71FE2614AA39406E179AEB349245409881CAF8F7A939404A41B79734924540C325C79DD2A939405166834C329245408A89CDC7B5A93940588B4F0130924540353CBD5296A93940AD81AD122C9245405205A3923AA9394066B8019F1F924540E15817B7D1A83940261422E0109245401A47ACC5A7A839401188D7F50B92454037A1100187A83940F5D6C056099245406262F3716DA8394043A852B3079245404677103B53A83940FCFB8C0B07924540E3F736FDD9A7394020D26F5F07924540C798BB9690A73940677E3507089245401E85EB51B8A63940D200DE0209924540CA32C4B12EA639403D8386FE099245404CFDBCA948A53940A8052FFA0A924540CEC7B5A162A43940365EBA490C92454043041C4295A239402F39EE940E92454036B05582C5A1394076E5B33C0F924540B64AB0389CA13940520FD1E80E924540A8A9656B7DA13940C4B645990D9245400CB08F4E5DA13940EFB1F4A10B92454053E8BCC62EA1394021D26F5F07924540E1067C7E18A13940052159C004924540FE7DC68503A13940E96F42210292454045F0BF95ECA03940623C8386FE914540A913D044D8A03940DB08C4EBFA9145401BD3139678A039406202B7EEE6914540D495CFF23CA039401B390B7BDA9145402A52616C21A0394006ADC090D5914540478FDFDBF49F3940CD4A9352D091454080608E1EBF9F3940711283C0CA9145409D9D0C8E929F3940C608E1D1C69145408195438B6C9F394062AB048BC39145402C4833164D9F3940DB7745F0BF914540BB2C26361F9F39405B69520ABA914540BBB88D06F09E394070D8B628B39145402DEC6987BF9E3940B042CA4FAA914540BB0A293FA99E3940BE8C62B9A5914540F4328AE5969E3940CCD6FA22A1914540823463D1749E3940A1BE654E979145401F9DBAF2599E39409A7CB3CD8D9145401F80D4264E9E39403E44A33B88914540AD9E93DE379E394085D382177D914540E6C6F484259E3940690586AC6E914540BC749318049E39400D93A9825191454012312592E89D39401BA375543591454076543541D49D3940A9C1340C1F91454076374F75C89D3940D49FFD48119145402F6EA301BC9D394086949F54FB904540AF5FB01BB69D3940AAF6E978CC90454004560E2DB29D3940F953E3A59B90454004560E2DB29D39406BDE718A8E90454092AE997CB39D394048EBA86A82904540CB10C7BAB89D3940881BF0F9619045405969520ABA9D39409D6D6E4C4F90454012BD8C62B99D39408FE9094B3C904540F60B76C3B69D3940888A71FE2690454004560E2DB29D3940ECAD81AD1290454004392861A69D3940C980ECF5EE8F454021CD58349D9D394089BF266BD48F4540051C42959A9D3940F424E99AC98F454077C3B645999D39403BB4C876BE8F4540051C42959A9D3940097767EDB68F45401383C0CAA19D39403455302AA98F454077E09C11A59D39406675ABE7A48F45403051BD35B09D3940ED8B84B69C8F45405B69520ABA9D3940987840D9948F4540F745425BCE9D39402DD9B111888F45403E49BA66F29D39405175C8CD708F454069614F3BFC9D394091DFDBF4678F4540E96F4221029E39403CCC9717608F454022D26F5F079E3940835B77F3548F4540697E3507089E394098CADB114E8F4540697E3507089E39409FD2C1FA3F8F45409479E40F069E39404A85B185208F45409479E40F069E39408AEFC4AC178F4540697E3507089E3940C3340C1F118F45403EA06CCA159E394019F19D98F58E4540E9A90EB9199E39403DAA9A20EA8E4540E9A90EB9199E39400B6D3997E28E454014A5BDC1179E3940D92FD80DDB8E45403139EE940E9E3940125839B4C88E4540156BF129009E394004B7EEE6A98E4540072159C0049E3940CCA65CE15D8E4540DC25AAB7069E394005CFBD874B8E4540408386FE099E3940E2DBF4673F8E454095B3B0A71D9E3940220C3CF71E8E45405C6E6935249E3940540FD1E80E8E454007780B24289E3940D4E3F736FD8D45404E24D1CB289E3940943F1878EE8D4540B281AD122C9E39404651A04FE48D4540EBE3DA50319E394086BBB376DB8D454087A3E4D5399E39407F7901F6D18D4540797632384A9E3940F10390DAC48D4540155322895E9E3940B15FB01BB68D4540072670EB6E9E3940F8EE8FF7AA8D4540EAAE25E4839E3940E3455F419A8D4540F8A62215C69E3940DC8F1491618D45406A6B7D91D09E3940877CD0B3598D45405C3ECBF3E09E3940803A1E33508D45406AC22FF5F39E394079F86BB2468D4540DCA3703D0A9F3940968C9C853D8D45405C26FC523F9F39408F2D0439288D454095C2F5285C9F3940413F8C101E8D454087B22957789F394033D80DDB168D45404E8AC8B08A9F394088CE6BEC128D45404EC49448A29F3940BAEEE6A90E8D45407816F6B4C39F3940C8387F130A8D4540E96BCF2C09A039402C79758E018D4540AF4885B185A03940A528D027F28C45404B425BCEA5A039401EF5108DEE8C454059E3A59BC4A039400969C6A2E98C4540D89FFD4811A1394017967840D98C454002F25EB532A139409787855AD38C45400F98C0ADBBA1394042575BB1BF8C4540C7B645990DA2394066105839B48C454080444C8924A239409830D3F6AF8C4540AAD0798D5DA23940CA3368E89F8C4540D505F52D73A23940BCCCE9B2988C4540003B70CE88A23940200DE02D908C45401C096D3997A23940595227A0898C4540FF912232ACA23940365F5E807D8C4540AAB8AAECBBA23940A1C420B0728C4540E337BEF6CCA23940134FAF94658C4540AA4929E8F6A2394030A913D0448C4540462619390BA33940CD2E51BD358C45408D0CAB7823A3394046DEAB56268C45401B9F02603CA339408D6D8B321B8C454070EC12D55BA33940DB2137C30D8C454062F92CCF83A3394054D1915CFE8B45407EC7293A92A33940D4C29E76F88B454037384A5E9DA3394054B4AB90F28B4540E25ED218ADA33940299C16BCE88B4540FE2CCF83BBA33940DBAD9E93DE8B4540B7BAD573D2A339405B82C5E1CC8B4540456A1327F7A3394046BCAE5FB08B45407082A8FB00A439403855302AA98B4540A901BC0512A439400D3D9B559F8B45400C7C7E1821A439404682E2C7988B4540D3531D7233A43940381B6492918B4540E1D7817346A43940DCE253008C8B45409A6588635DA43940A38026C2868B4540FD36FDD98FA439405592AE997C8B454036D3F6AFACA43940D583BBB3768B454052BED9E6C6A43940319FE579708B454027FDF675E0A439408DBA0F406A8B45400A86AC6EF5A439405B7DAEB6628B45406D006F8104A5394094C2F5285C8B454026718FA50FA53940CD073D9B558B4540423F8C101EA53940C6C58A1A4C8B45406D5721E527A53940BF83D899428B45401861C3D32BA53940D4F23CB83B8B45407CBE9F1A2FA53940F1866D8B328B45407CBE9F1A2FA53940954E5DF92C8B4540A7B94E232DA5394007D9EBDD1F8B45409952D0ED25A539402B92E865148B4540D29717601FA5394064D72FD80D8B454027718FA50FA5394064BA490C028B45408BB1852007A539400882397AFC8A4540615F24B4E5A43940CF022670EB8A4540FE53E3A59BA43940CFAB730CC88A45408C72A25D85A439403A11363CBD8A4540B7F9B83654A4394088A8FB00A48A4540FE88981249A4394096F2936A9F8A4540C5EC9E3C2CA439409DFA7953918A4540C55B2041F1A33940CFE02879758A454037ACE28DCCA33940E432A7CB628A4540D431207BBDA33940B91A12F7588A4540A9198BA6B3A33940B2D85F764F8A4540540647C9ABA33940D6915CFE438A45401BA4198BA6A3394088A3E4D5398A45401BA4198BA6A3394081613255308A45407F01F6D1A9A339407A1F80D4268A45408D687407B1A3394017A5BDC1178A4540A9367172BFA339401E90BDDEFD89454029456458C5A339404249BA66F28945409B09BFD4CFA33940972232ACE2894540FF669B1BD3A33940D78C45D3D9894540D46BEC12D5A33940D04A9352D0894540D46BEC12D5A339403BB05582C5894540E2B5847CD0A33940501FBAA0BE89454062A79196CAA3394042B83B6BB78945400D944DB9C2A339407BFD82DDB0894540626DC5FEB2A33940C28C62B9A589454029EEB1F4A1A3394026CD58349D894540C673EFE192A33940D1B9145795894540553BFC3559A33940D17F48BF7D894540553BFC3559A33940D17F48BF7D894540553BFC3559A33940D17F48BF7D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1821, 0, NULL, '', '0102000020E6100000E000000067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE3914540D981734694AE39405AC0046EDD91454067DAFE9595AE3940217BBDFBE39145403CDF4F8D97AE3940768E01D9EB91454004B2D7BB3FAE3940923F1878EE914540CC845FEAE7AD3940D2C6116BF19145407789EAAD81AD3940124E0B5EF4914540B15582C5E1AC394027DA5548F99145405CB1BFEC9EAC3940B532E197FA914540F919170E84AC3940FCDEA63FFB914540967D5704FFAB3940603C8386FE91454097CADB114EAB394075C8CD7003924540345019FF3EAB3940BC74931804924540892991442FAB394027F73B140592454009FEB7921DAB3940D925AAB70692454089B5F81400AB3940A7052FFA0A924540897B2C7DE8AA394099BB96900F9245407BA01518B2AA39406EDDCD531D92454042E7357689AA3940751F80D426924540EDB60BCD75AA394067D5E76A2B924540A6D0798D5DAA394035B56CAD2F924540183E22A644AA39402E90A0F8319245408A71FE2614AA39406E179AEB349245409881CAF8F7A939404A41B79734924540C325C79DD2A939405166834C329245408A89CDC7B5A93940588B4F0130924540353CBD5296A93940AD81AD122C9245405205A3923AA9394066B8019F1F924540E15817B7D1A83940261422E0109245401A47ACC5A7A839401188D7F50B92454037A1100187A83940F5D6C056099245406262F3716DA8394043A852B3079245404677103B53A83940FCFB8C0B07924540E3F736FDD9A7394020D26F5F07924540C798BB9690A73940677E3507089245401E85EB51B8A63940D200DE0209924540CA32C4B12EA639403D8386FE099245404CFDBCA948A53940A8052FFA0A924540CEC7B5A162A43940365EBA490C92454043041C4295A239402F39EE940E92454036B05582C5A1394076E5B33C0F924540B64AB0389CA13940520FD1E80E924540A8A9656B7DA13940C4B645990D9245400CB08F4E5DA13940EFB1F4A10B92454053E8BCC62EA1394021D26F5F07924540E1067C7E18A13940052159C004924540FE7DC68503A13940E96F42210292454045F0BF95ECA03940623C8386FE914540A913D044D8A03940DB08C4EBFA9145401BD3139678A039406202B7EEE6914540D495CFF23CA039401B390B7BDA9145402A52616C21A0394006ADC090D5914540478FDFDBF49F3940CD4A9352D091454080608E1EBF9F3940711283C0CA9145409D9D0C8E929F3940C608E1D1C69145408195438B6C9F394062AB048BC39145402C4833164D9F3940DB7745F0BF914540BB2C26361F9F39405B69520ABA914540BBB88D06F09E394070D8B628B39145402DEC6987BF9E3940B042CA4FAA914540BB0A293FA99E3940BE8C62B9A5914540F4328AE5969E3940CCD6FA22A1914540823463D1749E3940A1BE654E979145401F9DBAF2599E39409A7CB3CD8D9145401F80D4264E9E39403E44A33B88914540AD9E93DE379E394085D382177D914540E6C6F484259E3940690586AC6E914540BC749318049E39400D93A9825191454012312592E89D39401BA375543591454076543541D49D3940A9C1340C1F91454076374F75C89D3940D49FFD48119145402F6EA301BC9D394086949F54FB904540AF5FB01BB69D3940AAF6E978CC90454004560E2DB29D3940F953E3A59B90454004560E2DB29D39406BDE718A8E90454092AE997CB39D394048EBA86A82904540CB10C7BAB89D3940881BF0F9619045405969520ABA9D39409D6D6E4C4F90454012BD8C62B99D39408FE9094B3C904540F60B76C3B69D3940888A71FE2690454004560E2DB29D3940ECAD81AD1290454004392861A69D3940C980ECF5EE8F454021CD58349D9D394089BF266BD48F4540051C42959A9D3940F424E99AC98F454077C3B645999D39403BB4C876BE8F4540051C42959A9D3940097767EDB68F45401383C0CAA19D39403455302AA98F454077E09C11A59D39406675ABE7A48F45403051BD35B09D3940ED8B84B69C8F45405B69520ABA9D3940987840D9948F4540F745425BCE9D39402DD9B111888F45403E49BA66F29D39405175C8CD708F454069614F3BFC9D394091DFDBF4678F4540E96F4221029E39403CCC9717608F454022D26F5F079E3940835B77F3548F4540697E3507089E394098CADB114E8F4540697E3507089E39409FD2C1FA3F8F45409479E40F069E39404A85B185208F45409479E40F069E39408AEFC4AC178F4540697E3507089E3940C3340C1F118F45403EA06CCA159E394019F19D98F58E4540E9A90EB9199E39403DAA9A20EA8E4540E9A90EB9199E39400B6D3997E28E454014A5BDC1179E3940D92FD80DDB8E45403139EE940E9E3940125839B4C88E4540156BF129009E394004B7EEE6A98E4540072159C0049E3940CCA65CE15D8E4540DC25AAB7069E394005CFBD874B8E4540408386FE099E3940E2DBF4673F8E454095B3B0A71D9E3940220C3CF71E8E45405C6E6935249E3940540FD1E80E8E454007780B24289E3940D4E3F736FD8D45404E24D1CB289E3940943F1878EE8D4540B281AD122C9E39404651A04FE48D4540EBE3DA50319E394086BBB376DB8D454087A3E4D5399E39407F7901F6D18D4540797632384A9E3940F10390DAC48D4540155322895E9E3940B15FB01BB68D4540072670EB6E9E3940F8EE8FF7AA8D4540EAAE25E4839E3940E3455F419A8D4540F8A62215C69E3940DC8F1491618D45406A6B7D91D09E3940877CD0B3598D45405C3ECBF3E09E3940803A1E33508D45406AC22FF5F39E394079F86BB2468D4540DCA3703D0A9F3940968C9C853D8D45405C26FC523F9F39408F2D0439288D454095C2F5285C9F3940413F8C101E8D454087B22957789F394033D80DDB168D45404E8AC8B08A9F394088CE6BEC128D45404EC49448A29F3940BAEEE6A90E8D45407816F6B4C39F3940C8387F130A8D4540E96BCF2C09A039402C79758E018D4540AF4885B185A03940A528D027F28C45404B425BCEA5A039401EF5108DEE8C454059E3A59BC4A039400969C6A2E98C4540D89FFD4811A1394017967840D98C454002F25EB532A139409787855AD38C45400F98C0ADBBA1394042575BB1BF8C4540C7B645990DA2394066105839B48C454080444C8924A239409830D3F6AF8C4540AAD0798D5DA23940CA3368E89F8C4540D505F52D73A23940BCCCE9B2988C4540003B70CE88A23940200DE02D908C45401C096D3997A23940595227A0898C4540FF912232ACA23940365F5E807D8C4540AAB8AAECBBA23940A1C420B0728C4540E337BEF6CCA23940134FAF94658C4540AA4929E8F6A2394030A913D0448C4540462619390BA33940CD2E51BD358C45408D0CAB7823A3394046DEAB56268C45401B9F02603CA339408D6D8B321B8C454070EC12D55BA33940DB2137C30D8C454062F92CCF83A3394054D1915CFE8B45407EC7293A92A33940D4C29E76F88B454037384A5E9DA3394054B4AB90F28B4540E25ED218ADA33940299C16BCE88B4540FE2CCF83BBA33940DBAD9E93DE8B4540B7BAD573D2A339405B82C5E1CC8B4540456A1327F7A3394046BCAE5FB08B45407082A8FB00A439403855302AA98B4540A901BC0512A439400D3D9B559F8B45400C7C7E1821A439404682E2C7988B4540D3531D7233A43940381B6492918B4540E1D7817346A43940DCE253008C8B45409A6588635DA43940A38026C2868B4540FD36FDD98FA439405592AE997C8B454036D3F6AFACA43940D583BBB3768B454052BED9E6C6A43940319FE579708B454027FDF675E0A439408DBA0F406A8B45400A86AC6EF5A439405B7DAEB6628B45406D006F8104A5394094C2F5285C8B454026718FA50FA53940CD073D9B558B4540423F8C101EA53940C6C58A1A4C8B45406D5721E527A53940BF83D899428B45401861C3D32BA53940D4F23CB83B8B45407CBE9F1A2FA53940F1866D8B328B45407CBE9F1A2FA53940954E5DF92C8B4540A7B94E232DA5394007D9EBDD1F8B45409952D0ED25A539402B92E865148B4540D29717601FA5394064D72FD80D8B454027718FA50FA5394064BA490C028B45408BB1852007A539400882397AFC8A4540615F24B4E5A43940CF022670EB8A4540FE53E3A59BA43940CFAB730CC88A45408C72A25D85A439403A11363CBD8A4540B7F9B83654A4394088A8FB00A48A4540FE88981249A4394096F2936A9F8A4540C5EC9E3C2CA439409DFA7953918A4540C55B2041F1A33940CFE02879758A454037ACE28DCCA33940E432A7CB628A4540D431207BBDA33940B91A12F7588A4540A9198BA6B3A33940B2D85F764F8A4540540647C9ABA33940D6915CFE438A45401BA4198BA6A3394088A3E4D5398A45401BA4198BA6A3394081613255308A45407F01F6D1A9A339407A1F80D4268A45408D687407B1A3394017A5BDC1178A4540A9367172BFA339401E90BDDEFD89454029456458C5A339404249BA66F28945409B09BFD4CFA33940972232ACE2894540FF669B1BD3A33940D78C45D3D9894540D46BEC12D5A33940D04A9352D0894540D46BEC12D5A339403BB05582C5894540E2B5847CD0A33940501FBAA0BE89454062A79196CAA3394042B83B6BB78945400D944DB9C2A339407BFD82DDB0894540626DC5FEB2A33940C28C62B9A589454029EEB1F4A1A3394026CD58349D894540C673EFE192A33940D1B9145795894540553BFC3559A33940D17F48BF7D894540553BFC3559A33940D17F48BF7D894540553BFC3559A33940D17F48BF7D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1765, 0, NULL, '', '0102000020E6100000E000000067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE391454067DAFE9595AE3940217BBDFBE3914540D981734694AE39405AC0046EDD91454067DAFE9595AE3940217BBDFBE39145403CDF4F8D97AE3940768E01D9EB91454004B2D7BB3FAE3940923F1878EE914540CC845FEAE7AD3940D2C6116BF19145407789EAAD81AD3940124E0B5EF4914540B15582C5E1AC394027DA5548F99145405CB1BFEC9EAC3940B532E197FA914540F919170E84AC3940FCDEA63FFB914540967D5704FFAB3940603C8386FE91454097CADB114EAB394075C8CD7003924540345019FF3EAB3940BC74931804924540892991442FAB394027F73B140592454009FEB7921DAB3940D925AAB70692454089B5F81400AB3940A7052FFA0A924540897B2C7DE8AA394099BB96900F9245407BA01518B2AA39406EDDCD531D92454042E7357689AA3940751F80D426924540EDB60BCD75AA394067D5E76A2B924540A6D0798D5DAA394035B56CAD2F924540183E22A644AA39402E90A0F8319245408A71FE2614AA39406E179AEB349245409881CAF8F7A939404A41B79734924540C325C79DD2A939405166834C329245408A89CDC7B5A93940588B4F0130924540353CBD5296A93940AD81AD122C9245405205A3923AA9394066B8019F1F924540E15817B7D1A83940261422E0109245401A47ACC5A7A839401188D7F50B92454037A1100187A83940F5D6C056099245406262F3716DA8394043A852B3079245404677103B53A83940FCFB8C0B07924540E3F736FDD9A7394020D26F5F07924540C798BB9690A73940677E3507089245401E85EB51B8A63940D200DE0209924540CA32C4B12EA639403D8386FE099245404CFDBCA948A53940A8052FFA0A924540CEC7B5A162A43940365EBA490C92454043041C4295A239402F39EE940E92454036B05582C5A1394076E5B33C0F924540B64AB0389CA13940520FD1E80E924540A8A9656B7DA13940C4B645990D9245400CB08F4E5DA13940EFB1F4A10B92454053E8BCC62EA1394021D26F5F07924540E1067C7E18A13940052159C004924540FE7DC68503A13940E96F42210292454045F0BF95ECA03940623C8386FE914540A913D044D8A03940DB08C4EBFA9145401BD3139678A039406202B7EEE6914540D495CFF23CA039401B390B7BDA9145402A52616C21A0394006ADC090D5914540478FDFDBF49F3940CD4A9352D091454080608E1EBF9F3940711283C0CA9145409D9D0C8E929F3940C608E1D1C69145408195438B6C9F394062AB048BC39145402C4833164D9F3940DB7745F0BF914540BB2C26361F9F39405B69520ABA914540BBB88D06F09E394070D8B628B39145402DEC6987BF9E3940B042CA4FAA914540BB0A293FA99E3940BE8C62B9A5914540F4328AE5969E3940CCD6FA22A1914540823463D1749E3940A1BE654E979145401F9DBAF2599E39409A7CB3CD8D9145401F80D4264E9E39403E44A33B88914540AD9E93DE379E394085D382177D914540E6C6F484259E3940690586AC6E914540BC749318049E39400D93A9825191454012312592E89D39401BA375543591454076543541D49D3940A9C1340C1F91454076374F75C89D3940D49FFD48119145402F6EA301BC9D394086949F54FB904540AF5FB01BB69D3940AAF6E978CC90454004560E2DB29D3940F953E3A59B90454004560E2DB29D39406BDE718A8E90454092AE997CB39D394048EBA86A82904540CB10C7BAB89D3940881BF0F9619045405969520ABA9D39409D6D6E4C4F90454012BD8C62B99D39408FE9094B3C904540F60B76C3B69D3940888A71FE2690454004560E2DB29D3940ECAD81AD1290454004392861A69D3940C980ECF5EE8F454021CD58349D9D394089BF266BD48F4540051C42959A9D3940F424E99AC98F454077C3B645999D39403BB4C876BE8F4540051C42959A9D3940097767EDB68F45401383C0CAA19D39403455302AA98F454077E09C11A59D39406675ABE7A48F45403051BD35B09D3940ED8B84B69C8F45405B69520ABA9D3940987840D9948F4540F745425BCE9D39402DD9B111888F45403E49BA66F29D39405175C8CD708F454069614F3BFC9D394091DFDBF4678F4540E96F4221029E39403CCC9717608F454022D26F5F079E3940835B77F3548F4540697E3507089E394098CADB114E8F4540697E3507089E39409FD2C1FA3F8F45409479E40F069E39404A85B185208F45409479E40F069E39408AEFC4AC178F4540697E3507089E3940C3340C1F118F45403EA06CCA159E394019F19D98F58E4540E9A90EB9199E39403DAA9A20EA8E4540E9A90EB9199E39400B6D3997E28E454014A5BDC1179E3940D92FD80DDB8E45403139EE940E9E3940125839B4C88E4540156BF129009E394004B7EEE6A98E4540072159C0049E3940CCA65CE15D8E4540DC25AAB7069E394005CFBD874B8E4540408386FE099E3940E2DBF4673F8E454095B3B0A71D9E3940220C3CF71E8E45405C6E6935249E3940540FD1E80E8E454007780B24289E3940D4E3F736FD8D45404E24D1CB289E3940943F1878EE8D4540B281AD122C9E39404651A04FE48D4540EBE3DA50319E394086BBB376DB8D454087A3E4D5399E39407F7901F6D18D4540797632384A9E3940F10390DAC48D4540155322895E9E3940B15FB01BB68D4540072670EB6E9E3940F8EE8FF7AA8D4540EAAE25E4839E3940E3455F419A8D4540F8A62215C69E3940DC8F1491618D45406A6B7D91D09E3940877CD0B3598D45405C3ECBF3E09E3940803A1E33508D45406AC22FF5F39E394079F86BB2468D4540DCA3703D0A9F3940968C9C853D8D45405C26FC523F9F39408F2D0439288D454095C2F5285C9F3940413F8C101E8D454087B22957789F394033D80DDB168D45404E8AC8B08A9F394088CE6BEC128D45404EC49448A29F3940BAEEE6A90E8D45407816F6B4C39F3940C8387F130A8D4540E96BCF2C09A039402C79758E018D4540AF4885B185A03940A528D027F28C45404B425BCEA5A039401EF5108DEE8C454059E3A59BC4A039400969C6A2E98C4540D89FFD4811A1394017967840D98C454002F25EB532A139409787855AD38C45400F98C0ADBBA1394042575BB1BF8C4540C7B645990DA2394066105839B48C454080444C8924A239409830D3F6AF8C4540AAD0798D5DA23940CA3368E89F8C4540D505F52D73A23940BCCCE9B2988C4540003B70CE88A23940200DE02D908C45401C096D3997A23940595227A0898C4540FF912232ACA23940365F5E807D8C4540AAB8AAECBBA23940A1C420B0728C4540E337BEF6CCA23940134FAF94658C4540AA4929E8F6A2394030A913D0448C4540462619390BA33940CD2E51BD358C45408D0CAB7823A3394046DEAB56268C45401B9F02603CA339408D6D8B321B8C454070EC12D55BA33940DB2137C30D8C454062F92CCF83A3394054D1915CFE8B45407EC7293A92A33940D4C29E76F88B454037384A5E9DA3394054B4AB90F28B4540E25ED218ADA33940299C16BCE88B4540FE2CCF83BBA33940DBAD9E93DE8B4540B7BAD573D2A339405B82C5E1CC8B4540456A1327F7A3394046BCAE5FB08B45407082A8FB00A439403855302AA98B4540A901BC0512A439400D3D9B559F8B45400C7C7E1821A439404682E2C7988B4540D3531D7233A43940381B6492918B4540E1D7817346A43940DCE253008C8B45409A6588635DA43940A38026C2868B4540FD36FDD98FA439405592AE997C8B454036D3F6AFACA43940D583BBB3768B454052BED9E6C6A43940319FE579708B454027FDF675E0A439408DBA0F406A8B45400A86AC6EF5A439405B7DAEB6628B45406D006F8104A5394094C2F5285C8B454026718FA50FA53940CD073D9B558B4540423F8C101EA53940C6C58A1A4C8B45406D5721E527A53940BF83D899428B45401861C3D32BA53940D4F23CB83B8B45407CBE9F1A2FA53940F1866D8B328B45407CBE9F1A2FA53940954E5DF92C8B4540A7B94E232DA5394007D9EBDD1F8B45409952D0ED25A539402B92E865148B4540D29717601FA5394064D72FD80D8B454027718FA50FA5394064BA490C028B45408BB1852007A539400882397AFC8A4540615F24B4E5A43940CF022670EB8A4540FE53E3A59BA43940CFAB730CC88A45408C72A25D85A439403A11363CBD8A4540B7F9B83654A4394088A8FB00A48A4540FE88981249A4394096F2936A9F8A4540C5EC9E3C2CA439409DFA7953918A4540C55B2041F1A33940CFE02879758A454037ACE28DCCA33940E432A7CB628A4540D431207BBDA33940B91A12F7588A4540A9198BA6B3A33940B2D85F764F8A4540540647C9ABA33940D6915CFE438A45401BA4198BA6A3394088A3E4D5398A45401BA4198BA6A3394081613255308A45407F01F6D1A9A339407A1F80D4268A45408D687407B1A3394017A5BDC1178A4540A9367172BFA339401E90BDDEFD89454029456458C5A339404249BA66F28945409B09BFD4CFA33940972232ACE2894540FF669B1BD3A33940D78C45D3D9894540D46BEC12D5A33940D04A9352D0894540D46BEC12D5A339403BB05582C5894540E2B5847CD0A33940501FBAA0BE89454062A79196CAA3394042B83B6BB78945400D944DB9C2A339407BFD82DDB0894540626DC5FEB2A33940C28C62B9A589454029EEB1F4A1A3394026CD58349D894540C673EFE192A33940D1B9145795894540553BFC3559A33940D17F48BF7D894540553BFC3559A33940D17F48BF7D894540553BFC3559A33940D17F48BF7D894540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1831, 0, NULL, '', '0102000020E6100000E0000000503BFC3559A33940CC7F48BF7D894540C173EFE192A33940CCB914579589454024EEB1F4A1A3394021CD58349D8945405D6DC5FEB2A33940BD8C62B9A589454008944DB9C2A3394076FD82DDB08945405DA79196CAA339403DB83B6BB7894540DDB5847CD0A339404B1FBAA0BE894540CF6BEC12D5A3394036B05582C5894540CF6BEC12D5A33940CB4A9352D0894540FA669B1BD3A33940D28C45D3D98945409609BFD4CFA33940922232ACE289454024456458C5A339403D49BA66F2894540A4367172BFA339401990BDDEFD89454088687407B1A3394012A5BDC1178A45407A01F6D1A9A33940751F80D4268A454016A4198BA6A339407C613255308A454016A4198BA6A3394083A3E4D5398A45404F0647C9ABA33940D1915CFE438A4540A4198BA6B3A33940ADD85F764F8A4540CF31207BBDA33940B41A12F7588A454032ACE28DCCA33940DF32A7CB628A4540C05B2041F1A33940CAE02879758A4540C0EC9E3C2CA4394098FA7953918A4540F988981249A4394091F2936A9F8A4540B2F9B83654A4394083A8FB00A48A45408772A25D85A439403511363CBD8A4540F953E3A59BA43940CAAB730CC88A45405C5F24B4E5A43940CA022670EB8A454086B1852007A539400382397AFC8A454022718FA50FA539405FBA490C028B4540CD9717601FA539405FD72FD80D8B45409452D0ED25A539402692E865148B4540A2B94E232DA5394002D9EBDD1F8B454077BE9F1A2FA53940904E5DF92C8B454077BE9F1A2FA53940EC866D8B328B45401361C3D32BA53940CFF23CB83B8B4540685721E527A53940BA83D899428B45403D3F8C101EA53940C1C58A1A4C8B454021718FA50FA53940C8073D9B558B454068006F8104A539408FC2F5285C8B45400586AC6EF5A43940567DAEB6628B454022FDF675E0A4394088BA0F406A8B45404DBED9E6C6A439402C9FE579708B454031D3F6AFACA43940D083BBB3768B4540F836FDD98FA439405092AE997C8B4540956588635DA439409E8026C2868B4540DCD7817346A43940D7E253008C8B4540CE531D7233A43940331B6492918B4540077C7E1821A439404182E2C7988B4540A401BC0512A43940083D9B559F8B45406B82A8FB00A439403355302AA98B4540406A1327F7A3394041BCAE5FB08B4540B2BAD573D2A339405682C5E1CC8B4540F92CCF83BBA33940D6AD9E93DE8B4540DD5ED218ADA33940249C16BCE88B454032384A5E9DA339404FB4AB90F28B454079C7293A92A33940CFC29E76F88B45405DF92CCF83A339404FD1915CFE8B45406BEC12D55BA33940D62137C30D8C4540169F02603CA33940886D8B321B8C4540880CAB7823A3394041DEAB56268C4540412619390BA33940C82E51BD358C4540A54929E8F6A239402BA913D0448C4540DE37BEF6CCA239400E4FAF94658C4540A5B8AAECBBA239409CC420B0728C4540FA912232ACA23940315F5E807D8C454017096D3997A23940545227A0898C4540FB3A70CE88A239401B0DE02D908C4540D005F52D73A23940B7CCE9B2988C4540A5D0798D5DA23940C53368E89F8C45407B444C8924A239409330D3F6AF8C4540C2B645990DA2394061105839B48C45400A98C0ADBBA139403D575BB1BF8C4540FDF15EB532A139409287855AD38C4540D39FFD4811A1394012967840D98C454054E3A59BC4A039400469C6A2E98C454046425BCEA5A0394019F5108DEE8C4540AA4885B185A03940A028D027F28C4540E46BCF2C09A039402779758E018D45407316F6B4C39F3940C3387F130A8D454049C49448A29F3940B5EEE6A90E8D4540498AC8B08A9F394083CE6BEC128D454082B22957789F39402ED80DDB168D454090C2F5285C9F39403C3F8C101E8D45405726FC523F9F39408A2D0439288D4540D7A3703D0A9F3940918C9C853D8D454065C22FF5F39E394074F86BB2468D4540573ECBF3E09E39407B3A1E33508D4540656B7D91D09E3940827CD0B3598D4540F3A62215C69E3940D78F1491618D4540E5AE25E4839E3940DE455F419A8D4540022670EB6E9E3940F3EE8FF7AA8D4540105322895E9E3940AC5FB01BB68D4540747632384A9E3940EC0390DAC48D454082A3E4D5399E39407A7901F6D18D4540E6E3DA50319E394081BBB376DB8D4540AD81AD122C9E39404151A04FE48D45404924D1CB289E39408F3F1878EE8D454002780B24289E3940CFE3F736FD8D4540576E6935249E39404F0FD1E80E8E454090B3B0A71D9E39401D0C3CF71E8E45403B8386FE099E3940DDDBF4673F8E4540D725AAB7069E394000CFBD874B8E4540022159C0049E3940C7A65CE15D8E4540106BF129009E3940FFB6EEE6A98E45402C39EE940E9E39400D5839B4C88E45400FA5BDC1179E3940D42FD80DDB8E4540E4A90EB9199E3940066D3997E28E4540E4A90EB9199E394038AA9A20EA8E454039A06CCA159E394014F19D98F58E4540647E3507089E3940BE340C1F118F45408F79E40F069E394085EFC4AC178F45408F79E40F069E39404585B185208F4540647E3507089E39409AD2C1FA3F8F4540647E3507089E394093CADB114E8F45401DD26F5F079E39407E5B77F3548F4540E46F4221029E394037CC9717608F454064614F3BFC9D39408CDFDBF4678F45403949BA66F29D39404C75C8CD708F4540F245425BCE9D394028D9B111888F45405669520ABA9D3940937840D9948F45402B51BD35B09D3940E88B84B69C8F454072E09C11A59D39406175ABE7A48F45400E83C0CAA19D39402F55302AA98F4540001C42959A9D3940047767EDB68F454072C3B645999D394036B4C876BE8F4540001C42959A9D3940EF24E99AC98F45401CCD58349D9D394084BF266BD48F4540FF382861A69D3940C480ECF5EE8F4540FF550E2DB29D3940E7AD81AD12904540F10B76C3B69D3940838A71FE269045400DBD8C62B99D39408AE9094B3C9045405469520ABA9D3940986D6E4C4F904540C610C7BAB89D3940831BF0F9619045408DAE997CB39D394043EBA86A82904540FF550E2DB29D394066DE718A8E904540FF550E2DB29D3940F453E3A59B904540AA5FB01BB69D3940A5F6E978CC9045402A6EA301BC9D394081949F54FB90454071374F75C89D3940CF9FFD481191454071543541D49D3940A4C1340C1F9145400D312592E89D394016A3755435914540B7749318049E39400893A98251914540E1C6F484259E3940640586AC6E914540A89E93DE379E394080D382177D9145401A80D4264E9E39403944A33B889145401A9DBAF2599E3940957CB3CD8D9145407D3463D1749E39409CBE654E9791454019F46C567D9E39409599999999914540EE328AE5969E3940C7D6FA22A1914540B50A293FA99E3940B98C62B9A591454027EC6987BF9E3940AB42CA4FAA914540B5B88D06F09E39406BD8B628B3914540B52C26361F9F39405669520ABA914540264833164D9F3940D67745F0BF9145407B95438B6C9F39405DAB048BC3914540979D0C8E929F3940C108E1D1C69145407A608E1EBF9F39406C1283C0CA914540418FDFDBF49F3940C84A9352D09145402452616C21A0394001ADC090D5914540CE95CFF23CA0394016390B7BDA91454015D3139678A039405D02B7EEE6914540A313D044D8A03940D608C4EBFA9145403FF0BF95ECA039405D3C8386FE914540F87DC68503A13940E46F422102924540DB067C7E18A13940002159C0049245404DE8BCC62EA139401CD26F5F0792454006B08F4E5DA13940EAB1F4A10B924540A2A9656B7DA13940BFB645990D924540B04AB0389CA139404D0FD1E80E92454030B05582C5A1394071E5B33C0F9245403D041C4295A239402A39EE940E924540C8C7B5A162A43940315EBA490C92454046FDBCA948A53940A3052FFA0A924540C432C4B12EA63940388386FE099245401885EB51B8A63940CD00DE0209924540C198BB9690A73940627E350708924540DDF736FDD9A739401BD26F5F079245404077103B53A83940F7FB8C0B079245405C62F3716DA839403EA852B30792454031A1100187A83940F0D6C056099245401447ACC5A7A839400C88D7F50B924540DB5817B7D1A83940211422E0109245404C05A3923AA9394061B8019F1F9245402F3CBD5296A93940A881AD122C9245408489CDC7B5A93940538B4F0130924540BD25C79DD2A939404C66834C329245409281CAF8F7A939404541B797349245408471FE2614AA394069179AEB34924540123E22A644AA39402990A0F831924540A0D0798D5DAA394030B56CAD2F924540E7B60BCD75AA394062D5E76A2B9245403CE7357689AA3940701F80D42692454075A01518B2AA394069DDCD531D924540837B2C7DE8AA394094BB96900F92454083B5F81400AB3940A2052FFA0A92454003FEB7921DAB3940D425AAB706924540832991442FAB394022F73B14059245402E5019FF3EAB3940B77493180492454091CADB114EAB394070C8CD7003924540907D5704FFAB39405B3C8386FE914540F319170E84AC3940F7DEA63FFB91454056B1BFEC9EAC3940B032E197FA914540AB5582C5E1AC394022DA5548F99145407189EAAD81AD39400D4E0B5EF4914540C6845FEAE7AD3940CDC6116BF1914540FEB1D7BB3FAE39408D3F1878EE91454036DF4F8D97AE3940718E01D9EB91454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE3914540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1764, 0, NULL, '', '0102000020E6100000E0000000503BFC3559A33940CC7F48BF7D894540C173EFE192A33940CCB914579589454024EEB1F4A1A3394021CD58349D8945405D6DC5FEB2A33940BD8C62B9A589454008944DB9C2A3394076FD82DDB08945405DA79196CAA339403DB83B6BB7894540DDB5847CD0A339404B1FBAA0BE894540CF6BEC12D5A3394036B05582C5894540CF6BEC12D5A33940CB4A9352D0894540FA669B1BD3A33940D28C45D3D98945409609BFD4CFA33940922232ACE289454024456458C5A339403D49BA66F2894540A4367172BFA339401990BDDEFD89454088687407B1A3394012A5BDC1178A45407A01F6D1A9A33940751F80D4268A454016A4198BA6A339407C613255308A454016A4198BA6A3394083A3E4D5398A45404F0647C9ABA33940D1915CFE438A4540A4198BA6B3A33940ADD85F764F8A4540CF31207BBDA33940B41A12F7588A454032ACE28DCCA33940DF32A7CB628A4540C05B2041F1A33940CAE02879758A4540C0EC9E3C2CA4394098FA7953918A4540F988981249A4394091F2936A9F8A4540B2F9B83654A4394083A8FB00A48A45408772A25D85A439403511363CBD8A4540F953E3A59BA43940CAAB730CC88A45405C5F24B4E5A43940CA022670EB8A454086B1852007A539400382397AFC8A454022718FA50FA539405FBA490C028B4540CD9717601FA539405FD72FD80D8B45409452D0ED25A539402692E865148B4540A2B94E232DA5394002D9EBDD1F8B454077BE9F1A2FA53940904E5DF92C8B454077BE9F1A2FA53940EC866D8B328B45401361C3D32BA53940CFF23CB83B8B4540685721E527A53940BA83D899428B45403D3F8C101EA53940C1C58A1A4C8B454021718FA50FA53940C8073D9B558B454068006F8104A539408FC2F5285C8B45400586AC6EF5A43940567DAEB6628B454022FDF675E0A4394088BA0F406A8B45404DBED9E6C6A439402C9FE579708B454031D3F6AFACA43940D083BBB3768B4540F836FDD98FA439405092AE997C8B4540956588635DA439409E8026C2868B4540DCD7817346A43940D7E253008C8B4540CE531D7233A43940331B6492918B4540077C7E1821A439404182E2C7988B4540A401BC0512A43940083D9B559F8B45406B82A8FB00A439403355302AA98B4540406A1327F7A3394041BCAE5FB08B4540B2BAD573D2A339405682C5E1CC8B4540F92CCF83BBA33940D6AD9E93DE8B4540DD5ED218ADA33940249C16BCE88B454032384A5E9DA339404FB4AB90F28B454079C7293A92A33940CFC29E76F88B45405DF92CCF83A339404FD1915CFE8B45406BEC12D55BA33940D62137C30D8C4540169F02603CA33940886D8B321B8C4540880CAB7823A3394041DEAB56268C4540412619390BA33940C82E51BD358C4540A54929E8F6A239402BA913D0448C4540DE37BEF6CCA239400E4FAF94658C4540A5B8AAECBBA239409CC420B0728C4540FA912232ACA23940315F5E807D8C454017096D3997A23940545227A0898C4540FB3A70CE88A239401B0DE02D908C4540D005F52D73A23940B7CCE9B2988C4540A5D0798D5DA23940C53368E89F8C45407B444C8924A239409330D3F6AF8C4540C2B645990DA2394061105839B48C45400A98C0ADBBA139403D575BB1BF8C4540FDF15EB532A139409287855AD38C4540D39FFD4811A1394012967840D98C454054E3A59BC4A039400469C6A2E98C454046425BCEA5A0394019F5108DEE8C4540AA4885B185A03940A028D027F28C4540E46BCF2C09A039402779758E018D45407316F6B4C39F3940C3387F130A8D454049C49448A29F3940B5EEE6A90E8D4540498AC8B08A9F394083CE6BEC128D454082B22957789F39402ED80DDB168D454090C2F5285C9F39403C3F8C101E8D45405726FC523F9F39408A2D0439288D4540D7A3703D0A9F3940918C9C853D8D454065C22FF5F39E394074F86BB2468D4540573ECBF3E09E39407B3A1E33508D4540656B7D91D09E3940827CD0B3598D4540F3A62215C69E3940D78F1491618D4540E5AE25E4839E3940DE455F419A8D4540022670EB6E9E3940F3EE8FF7AA8D4540105322895E9E3940AC5FB01BB68D4540747632384A9E3940EC0390DAC48D454082A3E4D5399E39407A7901F6D18D4540E6E3DA50319E394081BBB376DB8D4540AD81AD122C9E39404151A04FE48D45404924D1CB289E39408F3F1878EE8D454002780B24289E3940CFE3F736FD8D4540576E6935249E39404F0FD1E80E8E454090B3B0A71D9E39401D0C3CF71E8E45403B8386FE099E3940DDDBF4673F8E4540D725AAB7069E394000CFBD874B8E4540022159C0049E3940C7A65CE15D8E4540106BF129009E3940FFB6EEE6A98E45402C39EE940E9E39400D5839B4C88E45400FA5BDC1179E3940D42FD80DDB8E4540E4A90EB9199E3940066D3997E28E4540E4A90EB9199E394038AA9A20EA8E454039A06CCA159E394014F19D98F58E4540647E3507089E3940BE340C1F118F45408F79E40F069E394085EFC4AC178F45408F79E40F069E39404585B185208F4540647E3507089E39409AD2C1FA3F8F4540647E3507089E394093CADB114E8F45401DD26F5F079E39407E5B77F3548F4540E46F4221029E394037CC9717608F454064614F3BFC9D39408CDFDBF4678F45403949BA66F29D39404C75C8CD708F4540F245425BCE9D394028D9B111888F45405669520ABA9D3940937840D9948F45402B51BD35B09D3940E88B84B69C8F454072E09C11A59D39406175ABE7A48F45400E83C0CAA19D39402F55302AA98F4540001C42959A9D3940047767EDB68F454072C3B645999D394036B4C876BE8F4540001C42959A9D3940EF24E99AC98F45401CCD58349D9D394084BF266BD48F4540FF382861A69D3940C480ECF5EE8F4540FF550E2DB29D3940E7AD81AD12904540F10B76C3B69D3940838A71FE269045400DBD8C62B99D39408AE9094B3C9045405469520ABA9D3940986D6E4C4F904540C610C7BAB89D3940831BF0F9619045408DAE997CB39D394043EBA86A82904540FF550E2DB29D394066DE718A8E904540FF550E2DB29D3940F453E3A59B904540AA5FB01BB69D3940A5F6E978CC9045402A6EA301BC9D394081949F54FB90454071374F75C89D3940CF9FFD481191454071543541D49D3940A4C1340C1F9145400D312592E89D394016A3755435914540B7749318049E39400893A98251914540E1C6F484259E3940640586AC6E914540A89E93DE379E394080D382177D9145401A80D4264E9E39403944A33B889145401A9DBAF2599E3940957CB3CD8D9145407D3463D1749E39409CBE654E9791454019F46C567D9E39409599999999914540EE328AE5969E3940C7D6FA22A1914540B50A293FA99E3940B98C62B9A591454027EC6987BF9E3940AB42CA4FAA914540B5B88D06F09E39406BD8B628B3914540B52C26361F9F39405669520ABA914540264833164D9F3940D67745F0BF9145407B95438B6C9F39405DAB048BC3914540979D0C8E929F3940C108E1D1C69145407A608E1EBF9F39406C1283C0CA914540418FDFDBF49F3940C84A9352D09145402452616C21A0394001ADC090D5914540CE95CFF23CA0394016390B7BDA91454015D3139678A039405D02B7EEE6914540A313D044D8A03940D608C4EBFA9145403FF0BF95ECA039405D3C8386FE914540F87DC68503A13940E46F422102924540DB067C7E18A13940002159C0049245404DE8BCC62EA139401CD26F5F0792454006B08F4E5DA13940EAB1F4A10B924540A2A9656B7DA13940BFB645990D924540B04AB0389CA139404D0FD1E80E92454030B05582C5A1394071E5B33C0F9245403D041C4295A239402A39EE940E924540C8C7B5A162A43940315EBA490C92454046FDBCA948A53940A3052FFA0A924540C432C4B12EA63940388386FE099245401885EB51B8A63940CD00DE0209924540C198BB9690A73940627E350708924540DDF736FDD9A739401BD26F5F079245404077103B53A83940F7FB8C0B079245405C62F3716DA839403EA852B30792454031A1100187A83940F0D6C056099245401447ACC5A7A839400C88D7F50B924540DB5817B7D1A83940211422E0109245404C05A3923AA9394061B8019F1F9245402F3CBD5296A93940A881AD122C9245408489CDC7B5A93940538B4F0130924540BD25C79DD2A939404C66834C329245409281CAF8F7A939404541B797349245408471FE2614AA394069179AEB34924540123E22A644AA39402990A0F831924540A0D0798D5DAA394030B56CAD2F924540E7B60BCD75AA394062D5E76A2B9245403CE7357689AA3940701F80D42692454075A01518B2AA394069DDCD531D924540837B2C7DE8AA394094BB96900F92454083B5F81400AB3940A2052FFA0A92454003FEB7921DAB3940D425AAB706924540832991442FAB394022F73B14059245402E5019FF3EAB3940B77493180492454091CADB114EAB394070C8CD7003924540907D5704FFAB39405B3C8386FE914540F319170E84AC3940F7DEA63FFB91454056B1BFEC9EAC3940B032E197FA914540AB5582C5E1AC394022DA5548F99145407189EAAD81AD39400D4E0B5EF4914540C6845FEAE7AD3940CDC6116BF1914540FEB1D7BB3FAE39408D3F1878EE91454036DF4F8D97AE3940718E01D9EB91454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE3914540', NULL, NULL);
INSERT INTO "tripshape" VALUES (1837, 0, NULL, '', '0102000020E6100000E0000000503BFC3559A33940CC7F48BF7D894540C173EFE192A33940CCB914579589454024EEB1F4A1A3394021CD58349D8945405D6DC5FEB2A33940BD8C62B9A589454008944DB9C2A3394076FD82DDB08945405DA79196CAA339403DB83B6BB7894540DDB5847CD0A339404B1FBAA0BE894540CF6BEC12D5A3394036B05582C5894540CF6BEC12D5A33940CB4A9352D0894540FA669B1BD3A33940D28C45D3D98945409609BFD4CFA33940922232ACE289454024456458C5A339403D49BA66F2894540A4367172BFA339401990BDDEFD89454088687407B1A3394012A5BDC1178A45407A01F6D1A9A33940751F80D4268A454016A4198BA6A339407C613255308A454016A4198BA6A3394083A3E4D5398A45404F0647C9ABA33940D1915CFE438A4540A4198BA6B3A33940ADD85F764F8A4540CF31207BBDA33940B41A12F7588A454032ACE28DCCA33940DF32A7CB628A4540C05B2041F1A33940CAE02879758A4540C0EC9E3C2CA4394098FA7953918A4540F988981249A4394091F2936A9F8A4540B2F9B83654A4394083A8FB00A48A45408772A25D85A439403511363CBD8A4540F953E3A59BA43940CAAB730CC88A45405C5F24B4E5A43940CA022670EB8A454086B1852007A539400382397AFC8A454022718FA50FA539405FBA490C028B4540CD9717601FA539405FD72FD80D8B45409452D0ED25A539402692E865148B4540A2B94E232DA5394002D9EBDD1F8B454077BE9F1A2FA53940904E5DF92C8B454077BE9F1A2FA53940EC866D8B328B45401361C3D32BA53940CFF23CB83B8B4540685721E527A53940BA83D899428B45403D3F8C101EA53940C1C58A1A4C8B454021718FA50FA53940C8073D9B558B454068006F8104A539408FC2F5285C8B45400586AC6EF5A43940567DAEB6628B454022FDF675E0A4394088BA0F406A8B45404DBED9E6C6A439402C9FE579708B454031D3F6AFACA43940D083BBB3768B4540F836FDD98FA439405092AE997C8B4540956588635DA439409E8026C2868B4540DCD7817346A43940D7E253008C8B4540CE531D7233A43940331B6492918B4540077C7E1821A439404182E2C7988B4540A401BC0512A43940083D9B559F8B45406B82A8FB00A439403355302AA98B4540406A1327F7A3394041BCAE5FB08B4540B2BAD573D2A339405682C5E1CC8B4540F92CCF83BBA33940D6AD9E93DE8B4540DD5ED218ADA33940249C16BCE88B454032384A5E9DA339404FB4AB90F28B454079C7293A92A33940CFC29E76F88B45405DF92CCF83A339404FD1915CFE8B45406BEC12D55BA33940D62137C30D8C4540169F02603CA33940886D8B321B8C4540880CAB7823A3394041DEAB56268C4540412619390BA33940C82E51BD358C4540A54929E8F6A239402BA913D0448C4540DE37BEF6CCA239400E4FAF94658C4540A5B8AAECBBA239409CC420B0728C4540FA912232ACA23940315F5E807D8C454017096D3997A23940545227A0898C4540FB3A70CE88A239401B0DE02D908C4540D005F52D73A23940B7CCE9B2988C4540A5D0798D5DA23940C53368E89F8C45407B444C8924A239409330D3F6AF8C4540C2B645990DA2394061105839B48C45400A98C0ADBBA139403D575BB1BF8C4540FDF15EB532A139409287855AD38C4540D39FFD4811A1394012967840D98C454054E3A59BC4A039400469C6A2E98C454046425BCEA5A0394019F5108DEE8C4540AA4885B185A03940A028D027F28C4540E46BCF2C09A039402779758E018D45407316F6B4C39F3940C3387F130A8D454049C49448A29F3940B5EEE6A90E8D4540498AC8B08A9F394083CE6BEC128D454082B22957789F39402ED80DDB168D454090C2F5285C9F39403C3F8C101E8D45405726FC523F9F39408A2D0439288D4540D7A3703D0A9F3940918C9C853D8D454065C22FF5F39E394074F86BB2468D4540573ECBF3E09E39407B3A1E33508D4540656B7D91D09E3940827CD0B3598D4540F3A62215C69E3940D78F1491618D4540E5AE25E4839E3940DE455F419A8D4540022670EB6E9E3940F3EE8FF7AA8D4540105322895E9E3940AC5FB01BB68D4540747632384A9E3940EC0390DAC48D454082A3E4D5399E39407A7901F6D18D4540E6E3DA50319E394081BBB376DB8D4540AD81AD122C9E39404151A04FE48D45404924D1CB289E39408F3F1878EE8D454002780B24289E3940CFE3F736FD8D4540576E6935249E39404F0FD1E80E8E454090B3B0A71D9E39401D0C3CF71E8E45403B8386FE099E3940DDDBF4673F8E4540D725AAB7069E394000CFBD874B8E4540022159C0049E3940C7A65CE15D8E4540106BF129009E3940FFB6EEE6A98E45402C39EE940E9E39400D5839B4C88E45400FA5BDC1179E3940D42FD80DDB8E4540E4A90EB9199E3940066D3997E28E4540E4A90EB9199E394038AA9A20EA8E454039A06CCA159E394014F19D98F58E4540647E3507089E3940BE340C1F118F45408F79E40F069E394085EFC4AC178F45408F79E40F069E39404585B185208F4540647E3507089E39409AD2C1FA3F8F4540647E3507089E394093CADB114E8F45401DD26F5F079E39407E5B77F3548F4540E46F4221029E394037CC9717608F454064614F3BFC9D39408CDFDBF4678F45403949BA66F29D39404C75C8CD708F4540F245425BCE9D394028D9B111888F45405669520ABA9D3940937840D9948F45402B51BD35B09D3940E88B84B69C8F454072E09C11A59D39406175ABE7A48F45400E83C0CAA19D39402F55302AA98F4540001C42959A9D3940047767EDB68F454072C3B645999D394036B4C876BE8F4540001C42959A9D3940EF24E99AC98F45401CCD58349D9D394084BF266BD48F4540FF382861A69D3940C480ECF5EE8F4540FF550E2DB29D3940E7AD81AD12904540F10B76C3B69D3940838A71FE269045400DBD8C62B99D39408AE9094B3C9045405469520ABA9D3940986D6E4C4F904540C610C7BAB89D3940831BF0F9619045408DAE997CB39D394043EBA86A82904540FF550E2DB29D394066DE718A8E904540FF550E2DB29D3940F453E3A59B904540AA5FB01BB69D3940A5F6E978CC9045402A6EA301BC9D394081949F54FB90454071374F75C89D3940CF9FFD481191454071543541D49D3940A4C1340C1F9145400D312592E89D394016A3755435914540B7749318049E39400893A98251914540E1C6F484259E3940640586AC6E914540A89E93DE379E394080D382177D9145401A80D4264E9E39403944A33B889145401A9DBAF2599E3940957CB3CD8D9145407D3463D1749E39409CBE654E9791454019F46C567D9E39409599999999914540EE328AE5969E3940C7D6FA22A1914540B50A293FA99E3940B98C62B9A591454027EC6987BF9E3940AB42CA4FAA914540B5B88D06F09E39406BD8B628B3914540B52C26361F9F39405669520ABA914540264833164D9F3940D67745F0BF9145407B95438B6C9F39405DAB048BC3914540979D0C8E929F3940C108E1D1C69145407A608E1EBF9F39406C1283C0CA914540418FDFDBF49F3940C84A9352D09145402452616C21A0394001ADC090D5914540CE95CFF23CA0394016390B7BDA91454015D3139678A039405D02B7EEE6914540A313D044D8A03940D608C4EBFA9145403FF0BF95ECA039405D3C8386FE914540F87DC68503A13940E46F422102924540DB067C7E18A13940002159C0049245404DE8BCC62EA139401CD26F5F0792454006B08F4E5DA13940EAB1F4A10B924540A2A9656B7DA13940BFB645990D924540B04AB0389CA139404D0FD1E80E92454030B05582C5A1394071E5B33C0F9245403D041C4295A239402A39EE940E924540C8C7B5A162A43940315EBA490C92454046FDBCA948A53940A3052FFA0A924540C432C4B12EA63940388386FE099245401885EB51B8A63940CD00DE0209924540C198BB9690A73940627E350708924540DDF736FDD9A739401BD26F5F079245404077103B53A83940F7FB8C0B079245405C62F3716DA839403EA852B30792454031A1100187A83940F0D6C056099245401447ACC5A7A839400C88D7F50B924540DB5817B7D1A83940211422E0109245404C05A3923AA9394061B8019F1F9245402F3CBD5296A93940A881AD122C9245408489CDC7B5A93940538B4F0130924540BD25C79DD2A939404C66834C329245409281CAF8F7A939404541B797349245408471FE2614AA394069179AEB34924540123E22A644AA39402990A0F831924540A0D0798D5DAA394030B56CAD2F924540E7B60BCD75AA394062D5E76A2B9245403CE7357689AA3940701F80D42692454075A01518B2AA394069DDCD531D924540837B2C7DE8AA394094BB96900F92454083B5F81400AB3940A2052FFA0A92454003FEB7921DAB3940D425AAB706924540832991442FAB394022F73B14059245402E5019FF3EAB3940B77493180492454091CADB114EAB394070C8CD7003924540907D5704FFAB39405B3C8386FE914540F319170E84AC3940F7DEA63FFB91454056B1BFEC9EAC3940B032E197FA914540AB5582C5E1AC394022DA5548F99145407189EAAD81AD39400D4E0B5EF4914540C6845FEAE7AD3940CDC6116BF1914540FEB1D7BB3FAE39408D3F1878EE91454036DF4F8D97AE3940718E01D9EB91454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE391454061DAFE9595AE39401C7BBDFBE3914540', NULL, NULL);


--
-- TOC entry 2802 (class 2606 OID 18437)
-- Dependencies: 162 162 3049
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "account"
    ADD CONSTRAINT "account_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2804 (class 2606 OID 18439)
-- Dependencies: 163 163 3049
-- Name: agency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "agency"
    ADD CONSTRAINT "agency_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2806 (class 2606 OID 18441)
-- Dependencies: 165 165 165 165 165 3049
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "geometry_columns"
    ADD CONSTRAINT "geometry_columns_pk" PRIMARY KEY ("f_table_catalog", "f_table_schema", "f_table_name", "f_geometry_column");


--
-- TOC entry 2808 (class 2606 OID 18443)
-- Dependencies: 166 166 3049
-- Name: gisexport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisexport"
    ADD CONSTRAINT "gisexport_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2810 (class 2606 OID 18445)
-- Dependencies: 168 168 3049
-- Name: gisroute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisroute"
    ADD CONSTRAINT "gisroute_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2812 (class 2606 OID 18447)
-- Dependencies: 169 169 3049
-- Name: gisroutealignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisroutealignment"
    ADD CONSTRAINT "gisroutealignment_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2814 (class 2606 OID 18449)
-- Dependencies: 170 170 3049
-- Name: gisroutecontrolpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisroutecontrolpoint"
    ADD CONSTRAINT "gisroutecontrolpoint_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2816 (class 2606 OID 18451)
-- Dependencies: 171 171 3049
-- Name: gisroutecontrolpointsequence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisroutecontrolpointsequence"
    ADD CONSTRAINT "gisroutecontrolpointsequence_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2818 (class 2606 OID 18453)
-- Dependencies: 172 172 3049
-- Name: gisroutesegment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisroutesegment"
    ADD CONSTRAINT "gisroutesegment_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2820 (class 2606 OID 18455)
-- Dependencies: 173 173 3049
-- Name: gisstop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisstop"
    ADD CONSTRAINT "gisstop_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2822 (class 2606 OID 18457)
-- Dependencies: 174 174 3049
-- Name: gisupload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisupload"
    ADD CONSTRAINT "gisupload_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2824 (class 2606 OID 18459)
-- Dependencies: 175 175 3049
-- Name: gisuploadfield_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gisuploadfield"
    ADD CONSTRAINT "gisuploadfield_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2826 (class 2606 OID 18461)
-- Dependencies: 176 176 3049
-- Name: gtfsagency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gtfsagency"
    ADD CONSTRAINT "gtfsagency_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2828 (class 2606 OID 18463)
-- Dependencies: 177 177 3049
-- Name: gtfssnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gtfssnapshot"
    ADD CONSTRAINT "gtfssnapshot_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2830 (class 2606 OID 18465)
-- Dependencies: 178 178 3049
-- Name: gtfssnapshotexport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gtfssnapshotexport"
    ADD CONSTRAINT "gtfssnapshotexport_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2832 (class 2606 OID 18467)
-- Dependencies: 180 180 3049
-- Name: gtfssnapshotmerge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gtfssnapshotmerge"
    ADD CONSTRAINT "gtfssnapshotmerge_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2834 (class 2606 OID 18469)
-- Dependencies: 181 181 3049
-- Name: gtfssnapshotmergetask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gtfssnapshotmergetask"
    ADD CONSTRAINT "gtfssnapshotmergetask_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2836 (class 2606 OID 18471)
-- Dependencies: 182 182 3049
-- Name: gtfssnapshotvalidation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "gtfssnapshotvalidation"
    ADD CONSTRAINT "gtfssnapshotvalidation_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2838 (class 2606 OID 18473)
-- Dependencies: 184 184 3049
-- Name: oauthtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "oauthtoken"
    ADD CONSTRAINT "oauthtoken_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2840 (class 2606 OID 18475)
-- Dependencies: 185 185 3049
-- Name: route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "route"
    ADD CONSTRAINT "route_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2842 (class 2606 OID 18477)
-- Dependencies: 186 186 3049
-- Name: routetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "routetype"
    ADD CONSTRAINT "routetype_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2844 (class 2606 OID 18479)
-- Dependencies: 187 187 3049
-- Name: servicecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "servicecalendar"
    ADD CONSTRAINT "servicecalendar_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2846 (class 2606 OID 18481)
-- Dependencies: 188 188 3049
-- Name: servicecalendardate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "servicecalendardate"
    ADD CONSTRAINT "servicecalendardate_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2848 (class 2606 OID 18483)
-- Dependencies: 189 189 3049
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "spatial_ref_sys"
    ADD CONSTRAINT "spatial_ref_sys_pkey" PRIMARY KEY ("srid");


--
-- TOC entry 2850 (class 2606 OID 18485)
-- Dependencies: 190 190 3049
-- Name: stop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "stop"
    ADD CONSTRAINT "stop_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2852 (class 2606 OID 18487)
-- Dependencies: 191 191 3049
-- Name: stoptime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "stoptime"
    ADD CONSTRAINT "stoptime_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2854 (class 2606 OID 18489)
-- Dependencies: 192 192 3049
-- Name: stoptype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "stoptype"
    ADD CONSTRAINT "stoptype_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2856 (class 2606 OID 18491)
-- Dependencies: 193 193 3049
-- Name: trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "trip"
    ADD CONSTRAINT "trip_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2858 (class 2606 OID 18493)
-- Dependencies: 194 194 3049
-- Name: trippattern_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "trippattern"
    ADD CONSTRAINT "trippattern_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2860 (class 2606 OID 18495)
-- Dependencies: 195 195 3049
-- Name: trippattern_trippatternstop_patternstops_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "trippattern_trippatternstop"
    ADD CONSTRAINT "trippattern_trippatternstop_patternstops_id_key" UNIQUE ("patternstops_id");


--
-- TOC entry 2862 (class 2606 OID 18497)
-- Dependencies: 196 196 3049
-- Name: trippatternstop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "trippatternstop"
    ADD CONSTRAINT "trippatternstop_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2864 (class 2606 OID 18499)
-- Dependencies: 197 197 3049
-- Name: tripshape_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "tripshape"
    ADD CONSTRAINT "tripshape_pkey" PRIMARY KEY ("id");


--
-- TOC entry 2880 (class 2606 OID 18500)
-- Dependencies: 174 2803 163 3049
-- Name: fk152bc912d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisupload"
    ADD CONSTRAINT "fk152bc912d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2904 (class 2606 OID 18505)
-- Dependencies: 197 2863 194 3049
-- Name: fk1a65b38b604a2ff6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trippattern"
    ADD CONSTRAINT "fk1a65b38b604a2ff6" FOREIGN KEY ("shape_id") REFERENCES "tripshape"("id");


--
-- TOC entry 2905 (class 2606 OID 18510)
-- Dependencies: 2839 194 185 3049
-- Name: fk1a65b38bea648c9b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trippattern"
    ADD CONSTRAINT "fk1a65b38bea648c9b" FOREIGN KEY ("route_id") REFERENCES "route"("id");


--
-- TOC entry 2865 (class 2606 OID 18515)
-- Dependencies: 163 2803 162 3049
-- Name: fk1d0c220dd46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "account"
    ADD CONSTRAINT "fk1d0c220dd46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2886 (class 2606 OID 18520)
-- Dependencies: 181 2831 180 3049
-- Name: fk1fcf8ff74c5206c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gtfssnapshotmergetask"
    ADD CONSTRAINT "fk1fcf8ff74c5206c" FOREIGN KEY ("merge_id") REFERENCES "gtfssnapshotmerge"("id");


--
-- TOC entry 2895 (class 2606 OID 18525)
-- Dependencies: 190 163 2803 3049
-- Name: fk277c22d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "stop"
    ADD CONSTRAINT "fk277c22d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2899 (class 2606 OID 18530)
-- Dependencies: 193 187 2843 3049
-- Name: fk27e845434c4b3b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trip"
    ADD CONSTRAINT "fk27e845434c4b3b" FOREIGN KEY ("servicecalendar_id") REFERENCES "servicecalendar"("id");


--
-- TOC entry 2900 (class 2606 OID 18535)
-- Dependencies: 193 197 2863 3049
-- Name: fk27e845604a2ff6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trip"
    ADD CONSTRAINT "fk27e845604a2ff6" FOREIGN KEY ("shape_id") REFERENCES "tripshape"("id");


--
-- TOC entry 2901 (class 2606 OID 18540)
-- Dependencies: 193 194 2857 3049
-- Name: fk27e8456c88ee96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trip"
    ADD CONSTRAINT "fk27e8456c88ee96" FOREIGN KEY ("pattern_id") REFERENCES "trippattern"("id");


--
-- TOC entry 2902 (class 2606 OID 18545)
-- Dependencies: 193 188 2845 3049
-- Name: fk27e845dd77d01b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trip"
    ADD CONSTRAINT "fk27e845dd77d01b" FOREIGN KEY ("servicecalendardate_id") REFERENCES "servicecalendardate"("id");


--
-- TOC entry 2903 (class 2606 OID 18550)
-- Dependencies: 193 185 2839 3049
-- Name: fk27e845ea648c9b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trip"
    ADD CONSTRAINT "fk27e845ea648c9b" FOREIGN KEY ("route_id") REFERENCES "route"("id");


--
-- TOC entry 2888 (class 2606 OID 18555)
-- Dependencies: 184 163 2803 3049
-- Name: fk30923da2d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "oauthtoken"
    ADD CONSTRAINT "fk30923da2d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2893 (class 2606 OID 18560)
-- Dependencies: 187 163 2803 3049
-- Name: fk34c58f3d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "servicecalendar"
    ADD CONSTRAINT "fk34c58f3d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2906 (class 2606 OID 18565)
-- Dependencies: 195 2857 194 3049
-- Name: fk3a1f0579474c387b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trippattern_trippatternstop"
    ADD CONSTRAINT "fk3a1f0579474c387b" FOREIGN KEY ("trippattern_id") REFERENCES "trippattern"("id");


--
-- TOC entry 2907 (class 2606 OID 18570)
-- Dependencies: 196 195 2861 3049
-- Name: fk3a1f0579992b8387; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trippattern_trippatternstop"
    ADD CONSTRAINT "fk3a1f0579992b8387" FOREIGN KEY ("patternstops_id") REFERENCES "trippatternstop"("id");


--
-- TOC entry 2908 (class 2606 OID 18575)
-- Dependencies: 190 196 2849 3049
-- Name: fk4222722d4cea3ad9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trippatternstop"
    ADD CONSTRAINT "fk4222722d4cea3ad9" FOREIGN KEY ("stop_id") REFERENCES "stop"("id");


--
-- TOC entry 2909 (class 2606 OID 18580)
-- Dependencies: 194 196 2857 3049
-- Name: fk4222722d6c88ee96; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "trippatternstop"
    ADD CONSTRAINT "fk4222722d6c88ee96" FOREIGN KEY ("pattern_id") REFERENCES "trippattern"("id");


--
-- TOC entry 2871 (class 2606 OID 18585)
-- Dependencies: 2809 168 169 3049
-- Name: fk42f8abab140cc93b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutealignment"
    ADD CONSTRAINT "fk42f8abab140cc93b" FOREIGN KEY ("gisroute_id") REFERENCES "gisroute"("id");


--
-- TOC entry 2867 (class 2606 OID 18590)
-- Dependencies: 2803 167 163 3049
-- Name: fk448fedf3e9f741b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisexport_agency"
    ADD CONSTRAINT "fk448fedf3e9f741b" FOREIGN KEY ("agencies_id") REFERENCES "agency"("id");


--
-- TOC entry 2868 (class 2606 OID 18595)
-- Dependencies: 2807 167 166 3049
-- Name: fk448fedf67040139; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisexport_agency"
    ADD CONSTRAINT "fk448fedf67040139" FOREIGN KEY ("gisexport_id") REFERENCES "gisexport"("id");


--
-- TOC entry 2869 (class 2606 OID 18600)
-- Dependencies: 2821 168 174 3049
-- Name: fk4ad6d118b28cc219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroute"
    ADD CONSTRAINT "fk4ad6d118b28cc219" FOREIGN KEY ("gisupload_id") REFERENCES "gisupload"("id");


--
-- TOC entry 2870 (class 2606 OID 18605)
-- Dependencies: 163 168 2803 3049
-- Name: fk4ad6d118d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroute"
    ADD CONSTRAINT "fk4ad6d118d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2889 (class 2606 OID 18610)
-- Dependencies: 185 168 2809 3049
-- Name: fk4b7c229140cc93b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "route"
    ADD CONSTRAINT "fk4b7c229140cc93b" FOREIGN KEY ("gisroute_id") REFERENCES "gisroute"("id");


--
-- TOC entry 2890 (class 2606 OID 18615)
-- Dependencies: 186 185 2841 3049
-- Name: fk4b7c22948f7a5fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "route"
    ADD CONSTRAINT "fk4b7c22948f7a5fb" FOREIGN KEY ("routetype_id") REFERENCES "routetype"("id");


--
-- TOC entry 2891 (class 2606 OID 18620)
-- Dependencies: 185 2821 174 3049
-- Name: fk4b7c229b28cc219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "route"
    ADD CONSTRAINT "fk4b7c229b28cc219" FOREIGN KEY ("gisupload_id") REFERENCES "gisupload"("id");


--
-- TOC entry 2892 (class 2606 OID 18625)
-- Dependencies: 185 163 2803 3049
-- Name: fk4b7c229d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "route"
    ADD CONSTRAINT "fk4b7c229d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2885 (class 2606 OID 18630)
-- Dependencies: 2827 180 177 3049
-- Name: fk4f470c5ac9819064; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gtfssnapshotmerge"
    ADD CONSTRAINT "fk4f470c5ac9819064" FOREIGN KEY ("snapshot_id") REFERENCES "gtfssnapshot"("id");


--
-- TOC entry 2910 (class 2606 OID 18635)
-- Dependencies: 163 197 2803 3049
-- Name: fk5f09da5cd46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "tripshape"
    ADD CONSTRAINT "fk5f09da5cd46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2894 (class 2606 OID 18640)
-- Dependencies: 187 188 2843 3049
-- Name: fk62e10b415aede510; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "servicecalendardate"
    ADD CONSTRAINT "fk62e10b415aede510" FOREIGN KEY ("calendar_id") REFERENCES "servicecalendar"("id");


--
-- TOC entry 2876 (class 2606 OID 18645)
-- Dependencies: 170 172 2813 3049
-- Name: fk64057afb6d144a11; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutesegment"
    ADD CONSTRAINT "fk64057afb6d144a11" FOREIGN KEY ("topoint_id") REFERENCES "gisroutecontrolpoint"("id");


--
-- TOC entry 2877 (class 2606 OID 18650)
-- Dependencies: 2813 170 172 3049
-- Name: fk64057afbddbbb440; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutesegment"
    ADD CONSTRAINT "fk64057afbddbbb440" FOREIGN KEY ("frompoint_id") REFERENCES "gisroutecontrolpoint"("id");


--
-- TOC entry 2878 (class 2606 OID 18655)
-- Dependencies: 2821 173 174 3049
-- Name: fk65835353b28cc219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisstop"
    ADD CONSTRAINT "fk65835353b28cc219" FOREIGN KEY ("gisupload_id") REFERENCES "gisupload"("id");


--
-- TOC entry 2879 (class 2606 OID 18660)
-- Dependencies: 2803 173 163 3049
-- Name: fk65835353d46c7c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisstop"
    ADD CONSTRAINT "fk65835353d46c7c39" FOREIGN KEY ("agency_id") REFERENCES "agency"("id");


--
-- TOC entry 2896 (class 2606 OID 18665)
-- Dependencies: 2861 196 191 3049
-- Name: fk6a10620f405c7d76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "stoptime"
    ADD CONSTRAINT "fk6a10620f405c7d76" FOREIGN KEY ("patternstop_id") REFERENCES "trippatternstop"("id");


--
-- TOC entry 2897 (class 2606 OID 18670)
-- Dependencies: 191 190 2849 3049
-- Name: fk6a10620f4cea3ad9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "stoptime"
    ADD CONSTRAINT "fk6a10620f4cea3ad9" FOREIGN KEY ("stop_id") REFERENCES "stop"("id");


--
-- TOC entry 2898 (class 2606 OID 18675)
-- Dependencies: 193 191 2855 3049
-- Name: fk6a10620f7e12a3f9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "stoptime"
    ADD CONSTRAINT "fk6a10620f7e12a3f9" FOREIGN KEY ("trip_id") REFERENCES "trip"("id");


--
-- TOC entry 2866 (class 2606 OID 18680)
-- Dependencies: 163 186 2841 3049
-- Name: fk74c60825373f22bc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "agency"
    ADD CONSTRAINT "fk74c60825373f22bc" FOREIGN KEY ("defaultroutetype_id") REFERENCES "routetype"("id");


--
-- TOC entry 2887 (class 2606 OID 18685)
-- Dependencies: 182 177 2827 3049
-- Name: fk7cb5a597c9819064; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gtfssnapshotvalidation"
    ADD CONSTRAINT "fk7cb5a597c9819064" FOREIGN KEY ("snapshot_id") REFERENCES "gtfssnapshot"("id");


--
-- TOC entry 2873 (class 2606 OID 18690)
-- Dependencies: 171 172 2817 3049
-- Name: fk80c9544ca1055f01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutecontrolpointsequence"
    ADD CONSTRAINT "fk80c9544ca1055f01" FOREIGN KEY ("segment_id") REFERENCES "gisroutesegment"("id");


--
-- TOC entry 2874 (class 2606 OID 18695)
-- Dependencies: 171 169 2811 3049
-- Name: fk80c9544ca773ac59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutecontrolpointsequence"
    ADD CONSTRAINT "fk80c9544ca773ac59" FOREIGN KEY ("gisroutealignment_id") REFERENCES "gisroutealignment"("id");


--
-- TOC entry 2875 (class 2606 OID 18700)
-- Dependencies: 2813 171 170 3049
-- Name: fk80c9544ce07f9ef3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutecontrolpointsequence"
    ADD CONSTRAINT "fk80c9544ce07f9ef3" FOREIGN KEY ("controlpoint_id") REFERENCES "gisroutecontrolpoint"("id");


--
-- TOC entry 2882 (class 2606 OID 18705)
-- Dependencies: 176 177 2827 3049
-- Name: fk8b4b333fc9819064; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gtfsagency"
    ADD CONSTRAINT "fk8b4b333fc9819064" FOREIGN KEY ("snapshot_id") REFERENCES "gtfssnapshot"("id");


--
-- TOC entry 2881 (class 2606 OID 18710)
-- Dependencies: 175 174 2821 3049
-- Name: fk8e8cc308b28cc219; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisuploadfield"
    ADD CONSTRAINT "fk8e8cc308b28cc219" FOREIGN KEY ("gisupload_id") REFERENCES "gisupload"("id");


--
-- TOC entry 2883 (class 2606 OID 18715)
-- Dependencies: 179 163 2803 3049
-- Name: fkb3db45323e9f741b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gtfssnapshotexport_agency"
    ADD CONSTRAINT "fkb3db45323e9f741b" FOREIGN KEY ("agencies_id") REFERENCES "agency"("id");


--
-- TOC entry 2884 (class 2606 OID 18720)
-- Dependencies: 179 178 2829 3049
-- Name: fkb3db4532a15bb94a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gtfssnapshotexport_agency"
    ADD CONSTRAINT "fkb3db4532a15bb94a" FOREIGN KEY ("gtfssnapshotexport_id") REFERENCES "gtfssnapshotexport"("id");


--
-- TOC entry 2872 (class 2606 OID 18725)
-- Dependencies: 170 168 2809 3049
-- Name: fkb6a7136b140cc93b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "gisroutecontrolpoint"
    ADD CONSTRAINT "fkb6a7136b140cc93b" FOREIGN KEY ("gisroute_id") REFERENCES "gisroute"("id");


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA "public" FROM PUBLIC;
REVOKE ALL ON SCHEMA "public" FROM "postgres";
GRANT ALL ON SCHEMA "public" TO "postgres";
GRANT ALL ON SCHEMA "public" TO PUBLIC;


-- Completed on 2016-01-23 14:54:39

--
-- PostgreSQL database dump complete
--

