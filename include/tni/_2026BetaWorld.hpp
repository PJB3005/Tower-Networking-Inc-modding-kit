#ifndef TNI_API_HEADER__2026BETAWORLD
#define TNI_API_HEADER__2026BETAWORLD
// Generated API for game version 0.13.3
// If any constants or enum's change between versions, a rebuild of your mod with updated headers may be required!

#include <generated_api.hpp>
#include "structs.hpp"

struct _2026BetaWorld : public Object {
	using Object::Object;

	constexpr _2026BetaWorld(Object base) : Object{base} {}
	constexpr _2026BetaWorld(uint64_t addr) : Object{addr} {}
	_2026BetaWorld(Variant variant) : _2026BetaWorld{variant.as_object().address()} {}



};



#endif
