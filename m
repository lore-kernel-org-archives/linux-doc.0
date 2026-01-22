Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50A258CD7;
	Thu, 22 Jan 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071473; cv=none; b=fRXsfB8q+2w1dibhrNXp36TXitYIlzct9BJC6NOiqJmReLZMwVPnbLW6dpMAlmtm8T08gX2wVDPDK1A7UranuZiKngTlkFVZVW92IDey7QH+QKz0AAqz32KDSO942RM1CUJWmrD3MYus+zLVSr7RUJga6D/+gJj4vFGzvjhbD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071473; c=relaxed/simple;
	bh=fTA80FuqYhWOuMXsi1m55riPj78ukM7kbnYx2MFukug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=dFIWIZpDc4wIk+6d8JyMCMstEhwYuRGQAEUMAVT5LIut6L3pg/W1dkm+fLy1W0/oYRBgGw0UVGg1+0wXEOvWNcTtwKJNkt75CHc2WV2hsGE3NFcamfUaIP0UbmLTaybAF5AsV9j0b0zOfdiYr+ax0SuUIF7R48Y5chPOaO3gflM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EXxVLKR4; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EXxVLKR4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=fTA80FuqYhWOuMXsi1m55riPj78ukM7kbnYx2MFukug=; b=E
	XxVLKR4JFoLFd4tAIFASWJYld+cUVz83lO658BVm3W046UVIQAKtz3wbssJG1PBx
	qeybRO4NxGiXAaFrm4KPM9F40TBO7+8iYJlYKFm+U1aoqqlUzrvwMSVa4JXZiaEt
	oaIUWJCX8t5g+8SmxBxe5EYEakz+D22bplz0HrqscA=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:42:32 +0800
 (CST)
Date: Thu, 22 Jan 2026 16:42:32 +0800 (CST)
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
Subject: Re:[PATCH v7 12/22] drm/rockchip: vop2: Recognise 10/12-bit YUV422
 as YUV formats
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-12-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-12-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: JAf/VHBsdXM9MTc2OTA3MTM1MTA2N185NzcxMDNkMTY1YzkwNTg0MDdmOWY0M
 zliMmZkZDZhZQ==
X-NTES-SC: AL_Qu2dC/ycvksu5CCdZukfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbgpnbONL2klcdDdTogoXoxQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3e736769.79ad.19be4de9900.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgDHlU_44nFpZLBcAA--.14934W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7hitDGlx4vgiFwAA3g
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIZWxsbyBOaWNvbGFz77yMCkF0IDIwMjYtMDEtMjEgMjI6NDU6MTksICJOaWNvbGFzIEZyYXR0
YXJvbGkiIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj5UaGUgUm9j
a2NoaXAgVk9QMiB2aWRlbyBvdXRwdXQgZHJpdmVyIGhhcyBhICJpc195dXZfb3V0cHV0IiBmdW5j
dGlvbiwKPndoaWNoIHJldHVybnMgdHJ1ZSB3aGVuIGEgZ2l2ZW4gYnVzIGZvcm1hdCBpcyBhIFlV
ViBmb3JtYXQsIGFuZCBmYWxzZQo+b3RoZXJ3aXNlLgo+Cj5UaGlzIHN3aXRjaCBzdGF0ZW1lbnQg
aXMgbGFja2luZyB0aGUgYnVzIGZvcm1hdCB1c2VkIGZvciBZVVY0MjIgMTAtYml0LAo+YXMgd2Vs
bCBhcyB0aGUgYnVzIGZvcm1hdCB1c2VkIGZvciBZVVY0MjIgMTItYml0Lgo+Cj5BZGQgTUVESUFf
QlVTX0ZNVF9ZVVlWMTBfMVgyMCBhbmQgTUVESUFfQlVTX0ZNVF9ZVVlWMTJfMVgyNCB0bwo+aXNf
eXV2X291dHB1dCdzIHN3aXRjaCBjYXNlcyB0byByZXNvbHZlIHRoaXMuCj4KPkZpeGVzOiA2MDRi
ZTg1NTQ3Y2UgKCJkcm0vcm9ja2NoaXA6IEFkZCBWT1AyIGRyaXZlciIpCj5TaWduZWQtb2ZmLWJ5
OiBOaWNvbGFzIEZyYXR0YXJvbGkgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPgo+
LS0tCj4gZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAzICsr
Kwo+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IGYyMWVmYmNhNDJlNi4uM2RkN2I3
NTcxNDg3IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AyLmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9w
Mi5jCj5AQCAtMzY5LDYgKzM2OSw5IEBAIHN0YXRpYyBib29sIGlzX3l1dl9vdXRwdXQodTMyIGJ1
c19mb3JtYXQpCj4gCXN3aXRjaCAoYnVzX2Zvcm1hdCkgewo+IAljYXNlIE1FRElBX0JVU19GTVRf
WVVWOF8xWDI0Ogo+IAljYXNlIE1FRElBX0JVU19GTVRfWVVWMTBfMVgzMDoKPisJY2FzZSBNRURJ
QV9CVVNfRk1UX1lVWVYxMF8xWDIwOgo+KwljYXNlIE1FRElBX0JVU19GTVRfVVlWWTEwXzFYMjA6
Cgo+KwljYXNlIE1FRElBX0JVU19GTVRfWVVZVjEyXzFYMjQ6CgogICAgICAgICBNRURJQV9CVVNf
Rk1UX1lVWVYxMl8xWDI0IGlzIG5vdCBzdXBwb3J0ZWQgYnkgVk9QLCAgdGhlIG1heCBvdXRwdXQg
ZGVwdGggb2YgVk9QIGlzIDEwCgoKCgo+IAljYXNlIE1FRElBX0JVU19GTVRfVVlZVllZOF8wXzVY
MjQ6Cj4gCWNhc2UgTUVESUFfQlVTX0ZNVF9VWVlWWVkxMF8wXzVYMzA6Cj4gCWNhc2UgTUVESUFf
QlVTX0ZNVF9ZVVlWOF8yWDg6Cj4KPi0tIAo+Mi41Mi4wCj4K
