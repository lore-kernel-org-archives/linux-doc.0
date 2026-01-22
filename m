Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19EA3570BB;
	Thu, 22 Jan 2026 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070654; cv=none; b=rTX/AQdmAc9sigKEXYDAFIJr7vXqe2P9ZBRYeF3VhVfbmWXp6+DahXRQxRRBFnwVub4ZzXa7ps3n0WJiIGmn9wOTWESQUNsPXaI9enANl7DvJ2EvRt83Hk+5NV6QqXTv8w8z6xvq5WtD9+Cxt4ASbRIsA+rcnC++ANn561a7Ny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070654; c=relaxed/simple;
	bh=YpHkF0PLrAmWgJ2y41sYnkiBbZA8Rmsqiunwuw1wlLQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=mp6OKKlxCedad/bCoVazah8hYsq1NsLzn4j0qAuYr3gtvm1nP/qWxMN94e0xk7ANSkMVBmZ39QujG4fK9jfvN0Lya1+bsVWp0j8DBldmSZR+AS2A/HBsero+A0cjy5FF1O9xRt9Kvxy3HIzY9bVCbXG+XZpPBu8s4kGis8HfbU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MEo/pl72; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MEo/pl72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=YpHkF0PLrAmWgJ2y41sYnkiBbZA8Rmsqiunwuw1wlLQ=; b=M
	Eo/pl72xhjpuqjVaZfsFCyfB0Jh4pcQR8hNh9TA5djbetuG/xfJYoxILUJImg8AH
	fGBfo1HuBNK7EGFiatWzQPWm0SBPqH7vU+l4ltBzyClTtclqaG6uKFX1pBcY3PLL
	O+77urt1O+GXqgJAc6BU7gQPjJWhJbGQ3HLEz4iJNM=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:28:54 +0800
 (CST)
Date: Thu, 22 Jan 2026 16:28:54 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Cc: "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>,
	"Rodrigo Siqueira" <siqueira@igalia.com>,
	"Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"Andrzej Hajda" <andrzej.hajda@intel.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>,
	"Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
	"Jonas Karlman" <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>,
	"Sandy Huang" <hjc@rock-chips.com>,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Jani Nikula" <jani.nikula@linux.intel.com>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>,
	"Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>,
	"Tvrtko Ursulin" <tursulin@ursulin.net>,
	"Dmitry Baryshkov" <lumag@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Rob Herring" <robh@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
	kernel@collabora.com, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re:[PATCH v7 10/22] drm/rockchip: vop2: Fix YUV444 output
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-10-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-10-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: AbTxoXBsdXM9MTc2OTA3MDUzMzU4OV82OGJjODgyMTUxZmVjNWI2OWI5YzM2M
 zgyYTBiMjU2Mw==
X-NTES-SC: AL_Qu2dC/ycv00o4iSRY+kfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbUyHYPfMpAkwhfRVxHtZeeA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7ab32c86.7542.19be4d21f69.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgDXvwTG33FpCKpcAA--.14948W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxQbfPmlx38b4GQAA3C
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIZWxsbyBOaWNvbGFz77yMCgpBdCAyMDI2LTAxLTIxIDIyOjQ1OjE3LCAiTmljb2xhcyBGcmF0
dGFyb2xpIiA8bmljb2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+WVVWNDQ0
IChha2EgWUNiQ3I0NDQpIG91dHB1dCBpc24ndCB3b3JraW5nIHF1aXRlIHJpZ2h0IG9uIFJLMzU4
OC4gVGhlCj5yZXN1bHRpbmcgaW1hZ2Ugb24gdGhlIGRpc3BsYXksIHdoaWxlIGlkZW50aWZ5aW5n
IGl0c2VsZiBhcyBZVVY0NDQsIGhhcwo+c29tZSBjb21wb25lbnRzIHN3YXBwZWQsIGV2ZW4gYWZ0
ZXIgYWRkaW5nIHRoZSBuZWNlc3NhcnkgRFJNIGZvcm1hdHMgdG8KPnRoZSBjb252ZXJzaW9uIGZ1
bmN0aW9ucy4KPgo+SnVkZ2luZyBieSBkb3duc3RyZWFtLCB0aGlzIGlzIGJlY2F1c2UgWVVWNDQ0
IGFsc28gbmVlZHMgYW4gcmIgc3dhcAo+cGVyZm9ybWVkIGluIHRoZSBBRkJDIGNhc2UuCj4KPkFk
ZCB0aGUgRFJNIGZvcm1hdHMgdG8gdGhlIGFwcHJvcHJpYXRlIHN3aXRjaCBzdGF0ZW1lbnRzLCBh
bmQgYWRkIGEKPmZ1bmN0aW9uIGZvciBjaGVja2luZyB3aGV0aGVyIGFuIHJiIHN3YXAgbmVlZHMg
dG8gYmUgcGVyZm9ybWVkIGluIHRoZQo+QUZCQyBjYXNlLgo+Cj5GaXhlczogNjA0YmU4NTU0N2Nl
ICgiZHJtL3JvY2tjaGlwOiBBZGQgVk9QMiBkcml2ZXIiKQo+U2lnbmVkLW9mZi1ieTogTmljb2xh
cyBGcmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4KPi0tLQo+IGRy
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIHwgMTkgKysrKysrKysr
KysrKysrKysrKwo+IDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4KPmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcDIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5pbmRleCBlYzNiNGZkZTEw
ZGIuLjQ2OWM2M2RkOTdkNSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fdm9wMi5jCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcDIuYwo+QEAgLTE3Niw2ICsxNzYsNyBAQCBzdGF0aWMgZW51bSB2b3AyX2RhdGFf
Zm9ybWF0IHZvcDJfY29udmVydF9mb3JtYXQodTMyIGZvcm1hdCkKPiAJY2FzZSBEUk1fRk9STUFU
X0FSR0IyMTAxMDEwOgo+IAljYXNlIERSTV9GT1JNQVRfWEJHUjIxMDEwMTA6Cj4gCWNhc2UgRFJN
X0ZPUk1BVF9BQkdSMjEwMTAxMDoKPisJY2FzZSBEUk1fRk9STUFUX1ZVWTEwMTAxMDoKPiAJCXJl
dHVybiBWT1AyX0ZNVF9YUkdCMTAxMDEwOwo+IAljYXNlIERSTV9GT1JNQVRfWFJHQjg4ODg6Cj4g
CWNhc2UgRFJNX0ZPUk1BVF9BUkdCODg4ODoKPkBAIC0xODQsNiArMTg1LDcgQEAgc3RhdGljIGVu
dW0gdm9wMl9kYXRhX2Zvcm1hdCB2b3AyX2NvbnZlcnRfZm9ybWF0KHUzMiBmb3JtYXQpCj4gCQly
ZXR1cm4gVk9QMl9GTVRfQVJHQjg4ODg7Cj4gCWNhc2UgRFJNX0ZPUk1BVF9SR0I4ODg6Cj4gCWNh
c2UgRFJNX0ZPUk1BVF9CR1I4ODg6Cj4rCWNhc2UgRFJNX0ZPUk1BVF9WVVk4ODg6Cj4gCQlyZXR1
cm4gVk9QMl9GTVRfUkdCODg4Owo+IAljYXNlIERSTV9GT1JNQVRfUkdCNTY1Ogo+IAljYXNlIERS
TV9GT1JNQVRfQkdSNTY1Ogo+QEAgLTIyNSw2ICsyMjcsNyBAQCBzdGF0aWMgZW51bSB2b3AyX2Fm
YmNfZm9ybWF0IHZvcDJfY29udmVydF9hZmJjX2Zvcm1hdCh1MzIgZm9ybWF0KQo+IAljYXNlIERS
TV9GT1JNQVRfQVJHQjIxMDEwMTA6Cj4gCWNhc2UgRFJNX0ZPUk1BVF9YQkdSMjEwMTAxMDoKPiAJ
Y2FzZSBEUk1fRk9STUFUX0FCR1IyMTAxMDEwOgo+KwljYXNlIERSTV9GT1JNQVRfVlVZMTAxMDEw
Ogo+IAkJcmV0dXJuIFZPUDJfQUZCQ19GTVRfQVJHQjIxMDEwMTA7Cj4gCWNhc2UgRFJNX0ZPUk1B
VF9YUkdCODg4ODoKPiAJY2FzZSBEUk1fRk9STUFUX0FSR0I4ODg4Ogo+QEAgLTIzMyw2ICsyMzYs
NyBAQCBzdGF0aWMgZW51bSB2b3AyX2FmYmNfZm9ybWF0IHZvcDJfY29udmVydF9hZmJjX2Zvcm1h
dCh1MzIgZm9ybWF0KQo+IAkJcmV0dXJuIFZPUDJfQUZCQ19GTVRfQVJHQjg4ODg7Cj4gCWNhc2Ug
RFJNX0ZPUk1BVF9SR0I4ODg6Cj4gCWNhc2UgRFJNX0ZPUk1BVF9CR1I4ODg6Cj4rCWNhc2UgRFJN
X0ZPUk1BVF9WVVk4ODg6CgpIb3cgZGlkIHlvdSB0ZXN0IHRoaXMgZm9ybWF0PyBJdCBzZWVtcyB0
b29scyBsaWtlIG1vZGV0ZXN0IGRvbuKAmXQgc3VwcG9ydCB0ZXN0aW5nIHRoaXMgcGF0dGVybi4K
CgoKPiAJCXJldHVybiBWT1AyX0FGQkNfRk1UX1JHQjg4ODsKPiAJY2FzZSBEUk1fRk9STUFUX1JH
QjU2NToKPiAJY2FzZSBEUk1fRk9STUFUX0JHUjU2NToKPkBAIC0yNzAsNiArMjc0LDE5IEBAIHN0
YXRpYyBib29sIHZvcDJfd2luX3JiX3N3YXAodTMyIGZvcm1hdCkKPiAJfQo+IH0KPiAKPitzdGF0
aWMgYm9vbCB2b3AyX2FmYmNfcmJfc3dhcCh1MzIgZm9ybWF0KQo+K3sKPisJc3dpdGNoIChmb3Jt
YXQpIHsKPisJY2FzZSBEUk1fRk9STUFUX05WMjQ6Cj4rCWNhc2UgRFJNX0ZPUk1BVF9OVjMwOgo+
KwljYXNlIERSTV9GT1JNQVRfVlVZODg4Ogo+KwljYXNlIERSTV9GT1JNQVRfVlVZMTAxMDEwOgo+
KwkJcmV0dXJuIHRydWU7Cj4rCWRlZmF1bHQ6Cj4rCQlyZXR1cm4gZmFsc2U7Cj4rCX0KPit9Cj4r
Cj4gc3RhdGljIGJvb2wgdm9wMl9hZmJjX3V2X3N3YXAodTMyIGZvcm1hdCkKPiB7Cj4gCXN3aXRj
aCAoZm9ybWF0KSB7Cj5AQCAtMTI5MSw2ICsxMzA4LDcgQEAgc3RhdGljIHZvaWQgdm9wMl9wbGFu
ZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+IAkJIC8qIEl0J3MgZm9y
IGhlYWQgc3RyaWRlLCBlYWNoIGhlYWQgc2l6ZSBpcyAxNiBieXRlICovCj4gCQlzdHJpZGUgPSBB
TElHTihzdHJpZGUsIGJsb2NrX3cpIC8gYmxvY2tfdyAqIDE2Owo+IAo+KwkJcmJfc3dhcCA9IHZv
cDJfYWZiY19yYl9zd2FwKGZiLT5mb3JtYXQtPmZvcm1hdCk7Cj4gCQl1dl9zd2FwID0gdm9wMl9h
ZmJjX3V2X3N3YXAoZmItPmZvcm1hdC0+Zm9ybWF0KTsKPiAJCS8qCj4gCQkgKiBUaGlzIGlzIGEg
d29ya2Fyb3VuZCBmb3IgY3JhenkgSUMgZGVzaWduLCBDbHVzdGVyCj5AQCAtMTMwOCw2ICsxMzI2
LDcgQEAgc3RhdGljIHZvaWQgdm9wMl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAo+IAkJCXZvcDJfd2luX3dyaXRlKHdpbiwgVk9QMl9XSU5fQUZCQ19FTkFCTEUs
IDEpOwo+IAkJdm9wMl93aW5fd3JpdGUod2luLCBWT1AyX1dJTl9BRkJDX0ZPUk1BVCwgYWZiY19m
b3JtYXQpOwo+IAkJdm9wMl93aW5fd3JpdGUod2luLCBWT1AyX1dJTl9BRkJDX1VWX1NXQVAsIHV2
X3N3YXApOwo+KwkJdm9wMl93aW5fd3JpdGUod2luLCBWT1AyX1dJTl9BRkJDX1JCX1NXQVAsIHJi
X3N3YXApOwo+IAkJLyoKPiAJCSAqIE9uIHJrMzU2Ni84LCB0aGlzIGJpdCBpcyBhdXRvIGdhdGlu
ZyBlbmFibGUsCj4gCQkgKiBidXQgdGhpcyBmdW5jdGlvbiBpcyBub3Qgd29yayB3ZWxsIHNvIHdl
IG5lZWQKPgo+LS0gCj4yLjUyLjAKPgo=
