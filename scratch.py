import datetime

print("I'm scratch")

x1 = None
x2 = None
if isinstance(x1, dict) and isinstance(x2, dict):
    res = x1.copy()
    for k, v in x2.items():
        res[k] = merge(res[k], v) if k in res else v
    return res
elif isinstance(x1, list) and isinstance(x2, list):
    res = list(x1)
    res.extend(x2)
    return res
elif x1 == x2:
    return x1
else:
    raise ValueError(f"Cannot merge '{x1!r}' and '{x2!r}'")

print("Test")
