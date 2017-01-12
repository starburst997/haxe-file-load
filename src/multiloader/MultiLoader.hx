package multiloader;

import multiloader.Loaders;

/**
 * Load resources helper function
 */
class MultiLoader
{
  // Keep reference to the different loaders available
  private static var bytesLoader = new BytesLoaders();
  private static var stringLoader = new StringLoaders();
  private static var jsonLoader = new JsonLoaders();

  // No need to instantiate
  private function new() {}

  // Load a single Bytes
  public static inline function loadBytes(params:BytesLoaderParams)
  {
    bytesLoader.load([params], null);
  }

  // Load multiple Bytes at the same time
  public static inline function multiBytes(loaders:Array<BytesLoaderParams>, callbacks:LoadersCallbacks)
  {
    bytesLoader.load(loaders, callbacks);
  }

  // Load a single String
  public static inline function loadString(params:StringLoaderParams)
  {
    stringLoader.load([params], null);
  }

  // Load multiple String at the same time
  public static inline function multiString(loaders:Array<StringLoaderParams>, callbacks:LoadersCallbacks)
  {
    stringLoader.load(loaders, callbacks);
  }

  // Load a single Json
  public static inline function loadJson(params:JsonLoaderParams)
  {
    jsonLoader.load([params], null);
  }

  // Load multiple Json at the same time
  public static inline function multiJson(loaders:Array<JsonLoaderParams>, callbacks:LoadersCallbacks)
  {
    jsonLoader.load(loaders, callbacks);
  }
}