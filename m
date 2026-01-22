Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E5638BDB1;
	Thu, 22 Jan 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769071571; cv=none; b=k7xSe9HPRHEkfTQe+Qre5xxqzoHQvDaSmV9e9+2OlfV4UBusYE4Q14jY/gYu3VlG9kaE3XjtWrsuZBol4wmb0+4ceoyp3A+PnI4jUEXeA5lSNfdIz+vTWcZOnzMvl2SYhMCcYmNh62giGg9kC1ytX6o+PgsGAEovVBkjI5c+w7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769071571; c=relaxed/simple;
	bh=bTQS2Ub48cluoF04AksxVAcZz1dPPLXQ7ZO9ToPloD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=U/wfQeZ7YNPUuJ+Q0y6AbKnnvRnyBmcUd0GnlnJ85HgApKSs4NccSwaauS2r676w9nvtKOIPgYUXJVYvAMPiPcduu8sSzy7BTwzssKZiClSKdKJ1zkO7TarGx73ic3fxdA3WuucvtKde5dqpikejtyGiHHeA3PoZErqyv5kPpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kg/vJ0TP; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kg/vJ0TP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=bTQS2Ub48cluoF04AksxVAcZz1dPPLXQ7ZO9ToPloD8=; b=k
	g/vJ0TPJyGvaf2ouh7+ZkgLUAP8nvM10am5Erku9m7bIbDckHfw0bURZa0D/VQb4
	nX7Sf5y4c+Eqiu8X38rRqxwoeOJXcn3ThpWJfObzkfeaAc8S9/n6PdA45lsFq3q3
	L1SiiNyCptSK+e3S0ohSaxovyeMZr1hT3qdJdBa8QY=
Received: from andyshrk$163.com ( [110.83.51.2] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Thu, 22 Jan 2026 16:44:24 +0800
 (CST)
Date: Thu, 22 Jan 2026 16:44:24 +0800 (CST)
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
Subject: Re:[PATCH v7 13/22] drm/rockchip: vop2: Set correct output format
 for RK3576 YUV422
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121-color-format-v7-13-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <20260121-color-format-v7-13-ef790dae780c@collabora.com>
X-CM-CTRLMSGS: RtNQZnBsdXM9MTc2OTA3MTQ2MzM1NV8yNGY3NzZiM2I2YjU1M2E3ZjVjMWNiM
 GY5NjQzYTBhNw==
X-NTES-SC: AL_Qu2dC/ycvkwt4iOcYukfmUgWjuw/WsG1v/Ul1YBSP556jCHp1zA+YHtOI0XuzsGkOiqykTu2XSVH2/VTe6BkepsbYkh+3JfXd1VE6LuMWmOAAQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <27c44445.7a56.19be4e04fa9.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgDnDxRo43FpXbFcAA--.14910W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgjJKGlx42hHoQAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIZWxsbyBOaWNvbGFzLAoKQXQgMjAyNi0wMS0yMSAyMjo0NToyMCwgIk5pY29sYXMgRnJhdHRh
cm9saSIgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPkZvciBSSzM1
NzYgdG8gYmUgYWJsZSB0byBvdXRwdXQgWVVWNDIyIHNpZ25hbHMsIGl0IGZpcnN0IG5lZWRzIHRv
IGJlCj5hYmxlIHRvIHBpY2sgdGhlIHJpZ2h0IG91dHB1dCBtb2RlIGluIHRoZSBkaXNwbGF5IGNv
bnRyb2xsZXIgdG8gZG8gc28uCj4KPlRoZSBSSzM1NzYgaGFyZHdhcmUgc3BlY2lmaWVzIGRpZmZl
cmVudCBvdXRwdXQgZm9ybWF0cyBkZXBlbmRpbmcgb24gdGhlCj51c2VkIGRpc3BsYXkgcHJvdG9j
b2wuCj4KPkFkanVzdCB0aGUgd3JpdHRlbiByZWdpc3RlciB2YWx1ZSBiYXNlZCBvbiB0aGUgU29D
IGFuZCBjb25uZWN0b3IsIHNvCj5vdGhlciB1c2VycyBvZiB2Y3N0YXRlLT5vdXRwdXRfbW9kZSBk
b24ndCBoYXZlIHRvIGNhcmUgYWJvdXQgdGhpcy4KPgo+U2lnbmVkLW9mZi1ieTogTmljb2xhcyBG
cmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFib3JhLmNvbT4KCgogICAgUmV2aWV3
ZWQtYnk6IEFuZHkgWWFuIDxhbmR5c2hya0AxNjMuY29tPgo+LS0tCj4gZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AyLmMgfCAxNiArKysrKysrKysrKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPgo+ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AyLmMKPmluZGV4IDNkZDdiNzU3MTQ4Ny4uZDkzYzY3NzkyODZl
IDEwMDY0NAo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3Ay
LmMKPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wMi5jCj5A
QCAtMTcwNiw2ICsxNzA2LDIyIEBAIHN0YXRpYyB2b2lkIHZvcDJfY3J0Y19hdG9taWNfZW5hYmxl
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAJaWYgKHZjc3RhdGUtPm91dHB1dF9tb2RlID09IFJP
Q0tDSElQX09VVF9NT0RFX0FBQUEgJiYKPiAJICAgICEodnBfZGF0YS0+ZmVhdHVyZSAmIFZPUDJf
VlBfRkVBVFVSRV9PVVRQVVRfMTBCSVQpKQo+IAkJb3V0X21vZGUgPSBST0NLQ0hJUF9PVVRfTU9E
RV9QODg4Owo+KwllbHNlIGlmICh2Y3N0YXRlLT5vdXRwdXRfbW9kZSA9PSBST0NLQ0hJUF9PVVRf
TU9ERV9ZVVY0MjIgJiYKPisJCSB2b3AyLT52ZXJzaW9uID09IFZPUF9WRVJTSU9OX1JLMzU3NikK
PisJCXN3aXRjaCAodmNzdGF0ZS0+b3V0cHV0X3R5cGUpIHsKPisJCWNhc2UgRFJNX01PREVfQ09O
TkVDVE9SX0Rpc3BsYXlQb3J0Ogo+KwkJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfZURQOgo+KwkJ
CW91dF9tb2RlID0gUk9DS0NISVBfT1VUX01PREVfWVVWNDIyX1JLMzU3Nl9EUDsKPisJCQlicmVh
azsKPisJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0hETUlBOgo+KwkJCW91dF9tb2RlID0gUk9D
S0NISVBfT1VUX01PREVfWVVWNDIyX1JLMzU3Nl9IRE1JOwo+KwkJCWJyZWFrOwo+KwkJZGVmYXVs
dDoKPisJCQlkcm1fZXJyKHZvcDItPmRybSwgIlVua25vd24gRFJNX01PREVfQ09OTkVDVE9SICVk
XG4iLAo+KwkJCQl2Y3N0YXRlLT5vdXRwdXRfdHlwZSk7Cj4rCQkJdm9wMl91bmxvY2sodm9wMik7
Cj4rCQkJcmV0dXJuOwo+KwkJfQo+IAllbHNlCj4gCQlvdXRfbW9kZSA9IHZjc3RhdGUtPm91dHB1
dF9tb2RlOwo+IAo+Cj4tLSAKPjIuNTIuMAo+Cg==
