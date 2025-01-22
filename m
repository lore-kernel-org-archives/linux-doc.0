Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96238B
	for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2025 02:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511283; cv=none; b=Kp/r0ih84S3GxtP3X8c+DpkpaFRr0DYvl/E5UYT4XUVnQEDfTa76qS2qotEdukEXC5nAiaNHMqnhuq5Lmf46Buvs9S3uRppX5Lql5ZrABf9zRPqkPJqc2pNTGf35LasIDok2zYPUAu8Aad5O7C/1BPPvtzHfmeOD1KAaBX+HIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511283; c=relaxed/simple;
	bh=EUMuRACLYsS2DRIkpbm4jZ6hDBfpxyPcIlb+RyyJ2Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cI4wsWfM4BDTbPaKDlsvWRvJ4fWeiy7pb6HGH1xQ+kUgV7wRLDfspZeEPgG2gCEIRwLfgMC11zgG8TCw4si5RGXh5gU3inNeUjQRyfn8EgPalmzIxWM2m0vmgSfL1l+wRRSkDTllr0Pwg/jXuan+blmDR7pRzuN71EvPplJAdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2zeqV+Z; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2zeqV+Z"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso13264511a12.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 18:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737511279; x=1738116079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUMuRACLYsS2DRIkpbm4jZ6hDBfpxyPcIlb+RyyJ2Cc=;
        b=V2zeqV+ZO2NkZgASyGzD1hyEtyoSU+h4RI30p5M6GW6nMN0fKQ19i2OCRWoK+teP4D
         tpMJIFuyj2dVdG2AUup5bhLgzQanlLWy3iVZ45//YObzAJT/LWAl5sGlQOITtmCrkW+A
         QAwmHETXEVtvACtd3NCC8eHfnE1PmFogFBMROt60Hqac+ok0v7cvjmNVWb7vj4rdG77h
         kvdL4XMHCboXGJorGKCxaJIVjRt9ay5IAcloJXmia9mWh5Dug4URja8kHhAyDi+44Hwy
         v5DlxIGyHw5daJ5xXSje0huNTWdIRIw6SZc6++YeYH3SwRPWh1DHmQjc9oOKjbLLKw+J
         IQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737511279; x=1738116079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUMuRACLYsS2DRIkpbm4jZ6hDBfpxyPcIlb+RyyJ2Cc=;
        b=A4JscrW3KY+fyjoZ37OF4oSaAdih3wi+WjZZXmzXQ6bdOPT+bujtQTueTRZM2R3Z8V
         RuzJu7WY1W1yVsQ+Ku/kyySzbRwe1rRJONdabjp7+qI9fgHPTIEHW81SH/G1Vmd3l1+4
         NgM0Cvej1D4g86NKjyNyYoHOxeyQumMPGX3RgYTYqMCIhcsxTW9uo7t5tbX0hPdo/L7x
         pxo0P9n8iTnNP4MQYbHeqAQJNmPFK2311dQJjKNcUAKbMPX/b0n6HltpsGNbfyJArBn+
         GrCfUlMDunZed+vzO1sGPHXMEPexjozhisCMd+037xfzeSv1/QkewtgcR4BjV25ySlRC
         YmHA==
X-Forwarded-Encrypted: i=1; AJvYcCUjNZmDkA4Awp8KOM9K+oL3q6aKpG42fFYZ2jpcZzwc0y8ybWU+F5AY7Ktz/tz9km4fWjmpAgg5dnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhGmiihy2/1kQ18Vtp6EriOZlfvVQgdxkC1ANsiYxzO014TkE
	pmwmtxaph0jXJUtsnUZv7la5A0sc5kRXqQFeCFV8dTIsKsCKY7DV4/CNNxmMv57VoIy9aNmz5FC
	zjsIoNLxiOZeAshzzn8WeqTIYXDg=
X-Gm-Gg: ASbGncsbwgTSBKymvt/hLIpvwYlorLKVMTZ3fOEGovDSmIaIrVrVqYuKm7u5Q7ACxql
	vmakHhkGSF2WQEDogXe07RbtIFcdPuSKpkHZvgf3DuC38J2Qt8CI=
X-Google-Smtp-Source: AGHT+IEmamTYcpPNaSW+gYFyI97w+frTnEke8fTAkSyAiIrDYGh/NMV2c8hoYgLLhoccTNYWrgC4Eo8F2s94CQCJhDc=
X-Received: by 2002:a17:907:3f99:b0:ab2:d8e7:682c with SMTP id
 a640c23a62f3a-ab38b372461mr1893704466b.38.1737511278613; Tue, 21 Jan 2025
 18:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1737354981.git.zhaoshuo@cqsoftware.com.cn> <2c161d628a9d6cf2f8cb9a72511838207015faf1.1737354981.git.zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <2c161d628a9d6cf2f8cb9a72511838207015faf1.1737354981.git.zhaoshuo@cqsoftware.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Wed, 22 Jan 2025 10:00:41 +0800
X-Gm-Features: AbW1kvbnsJapOZKjRZvn0YoHFYkbVFgl5aLHuGvKnm7fINRRBfsRD_zkWxjlzUk
Message-ID: <CAJy-AmnOaU0_84pXuKtHskNM3AHO_QvWR7D1wcAXrvt3ueF3-w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] docs/zh_CN: Add tpm tpm_tis Chinese translation
To: Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	zhaoyuehui@cqsoftware.com.cn, zhangwei@cqsoftware.com.cn, 
	maoyuxian@cqsoftware.com.cn, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

VHJhbnNsYXRpb24gbG9va3MgZ29vZCBmb3IgbWUNCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxh
bGV4c0BrZXJuZWwub3JnPg0KDQpTaHVvIFpoYW8gPHpoYW9zaHVvQGNxc29mdHdhcmUuY29tLmNu
PiDkuo4yMDI15bm0MeaciDIw5pel5ZGo5LiAIDE1OjA25YaZ6YGT77yaDQo+DQo+IFRyYW5zbGF0
ZSAuLi4vc2VjdXJpdHkvdHBtL3RwbV90aXMucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gVXBkYXRl
IHRoZSB0cmFuc2xhdGlvbiB0aHJvdWdoIGNvbW1pdCA4YTU1MjU2YTg0NjINCj4gKCJEb2N1bWVu
dGF0aW9uOiB0cG1fdGlzIikNCj4NCj4gU2lnbmVkLW9mZi1ieTogU2h1byBaaGFvIDx6aGFvc2h1
b0BjcXNvZnR3YXJlLmNvbS5jbj4NCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3Nl
Y3VyaXR5L3RwbS9pbmRleC5yc3QgfCAgMiArLQ0KPiAgLi4uL3poX0NOL3NlY3VyaXR5L3RwbS90
cG1fdGlzLnJzdCAgICAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL3Rw
bV90aXMucnN0DQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9zZWN1cml0eS90cG0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vc2VjdXJpdHkvdHBtL2luZGV4LnJzdA0KPiBpbmRleCA0NmNkZjdjMWExYzEuLjRlZTg4
ODFhNDFhNCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
c2VjdXJpdHkvdHBtL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9zZWN1cml0eS90cG0vaW5kZXgucnN0DQo+IEBAIC0xNCw5ICsxNCw5IEBADQo+DQo+
ICAgICB0cG1fZXZlbnRfbG9nDQo+ICAgICB0cG0tc2VjdXJpdHkNCj4gKyAgIHRwbV90aXMNCj4N
Cj4gIFRPRE9MSVNUOg0KPiAtKiAgIHRwbV90aXMNCj4gICogICB0cG1fdnRwbV9wcm94eQ0KPiAg
KiAgIHhlbi10cG1mcm9udA0KPiAgKiAgIHRwbV9mdHBtX3RlZQ0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL3RwbV90aXMucnN0IGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2VjdXJpdHkvdHBtL3RwbV90aXMucnN0
DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGZiMDA5Zjkz
ZTEwDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vc2VjdXJpdHkvdHBtL3RwbV90aXMucnN0DQo+IEBAIC0wLDAgKzEsNDMgQEANCj4gKy4u
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRlOjogLi4vLi4v
ZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3Nl
Y3VyaXR5L3RwbS90cG1fdGlzLnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArIOi1teehlSBTaHVv
IFpoYW8gPHpoYW9zaHVvQGNxc29mdHdhcmUuY29tLmNuPg0KPiArDQo+ICtUUE0gRklGT+aOpeWP
o+mpseWKqA0KPiArPT09PT09PT09PT09PT09PQ0KPiArDQo+ICtUQ0cgUFRQ6KeE6IyD5a6a5LmJ
5LqG5Lik56eN5o6l5Y+j57G75Z6L77yaRklGT+WSjENSQuOAguWJjeiAheWfuuS6jumhuuW6j+ea
hOivu+WGmeaTjeS9nO+8jA0KPiAr5ZCO6ICF5Z+65LqO5YyF5ZCr5a6M5pW05ZG95Luk5oiW5ZON
5bqU55qE57yT5Yay5Yy644CCDQo+ICsNCj4gK0ZJRk/vvIjlhYjov5vlhYjlh7rvvInmjqXlj6Po
oqt0cG1fdGlzX2NvcmXkvp3otZbnmoTpqbHliqjnqIvluo/kvb/nlKjjgILmnIDliJ3vvIxMaW51
eOWPqg0KPiAr5pyJ5LiA5Liq5ZCN5Li6dHBtX3Rpc+eahOmpseWKqO+8jOimhuebluS6huWGheWt
mOaYoOWwhO+8iOWNsyBNTUlP77yJ5o6l5Y+j77yM5L2G5ZCO5p2l5a6D6KKrDQo+ICvmianlsZXk
u6XmlK/mjIFUQ0fmoIflh4bmiYDmlK/mjIHnmoTlhbbku5bniannkIbmjqXlj6PjgIINCj4gKw0K
PiAr55Sx5LqO5Y6G5Y+y5Y6f5Zug77yM5pyA5Yid55qETU1JT+mpseWKqOiiq+ensOS4unRwbV90
aXPvvIzogIxGSUZP6amx5Yqo55qE5qGG5p626KKr5ZG95ZCN5Li6DQo+ICt0cG1fdGlzX2NvcmXj
gILlnKh0cG1fdGlz5Lit55qE4oCcdGlz4oCd5ZCO57yA5p2l6IeqVFBN5o6l5Y+j6KeE6IyD77yM
6L+Z5piv6ZKI5a+5VFBNMS54DQo+ICvoiq/niYfnmoTnoazku7bmjqXlj6Pop4TojIPjgIINCj4g
Kw0KPiAr6YCa5L+h5Z+65LqO5LiA5Liq55SxVFBN6Iqv54mH6YCa6L+H56Gs5Lu25oC757q/5oiW
5YaF5a2Y5pig5bCE5YWx5Lqr55qEMjBLaUIg57yT5Yay5Yy677yM5YW35L2TDQo+ICvlj5blhrPk
uo7niannkIbmjqXnur/jgILor6XnvJPlhrLljLrov5vkuIDmraXliIbkuLrkupTkuKrnm7jnrYnl
pKflsI/nmoQ0S2lC57yT5Yay5Yy677yM5Li6Q1BV5ZKMDQo+ICtUUE3kuYvpl7TnmoTpgJrkv6Hm
j5DkvpvnrYnmlYjnmoTlr4TlrZjlmajpm4bjgILov5nkupvpgJrkv6Hnq6/ngrnlnKhUQ0fmnK/o
r63kuK3np7DkuLpsb2NhbGl0aWVz44CCDQo+ICsNCj4gK+W9k+WGheaguOaDs+imgeWQkVRQTeiK
r+eJh+WPkemAgeWRveS7pOaXtu+8jOWug+mmluWFiOmAmui/h+WcqFRQTV9BQ0NFU1Plr4TlrZjl
majkuK3orr7nva4NCj4gK3JlcXVlc3RVc2XkvY3mnaXkv53nlZlsb2NhbGl0eTDjgILlvZPorr/p
l67ooqvmjojkuojml7bvvIzor6XkvY3nlLHoiq/niYfmuIXpmaTjgILkuIDml6blrozmiJANCj4g
K+mAmuS/oe+8jOWGheaguOS8muWGmeWFpVRQTV9BQ0NFU1MuYWN0aXZlTG9jYWxpdHnkvY3jgILo
v5nlkYror4noiq/niYfor6XmnKzlnLDmgKflt7LooqsNCj4gK+mHiuaUvuOAgg0KPiArDQo+ICvl
voXlpITnkIbnmoTmnKzlnLDmgKfnlLHoiq/niYfmjInkvJjlhYjnuqfpmY3luo/pgJDkuKrmnI3l
iqHvvIzkuIDmrKHkuIDkuKrvvJoNCj4gKw0KPiArLSBMb2NhbGl0eTDkvJjlhYjnuqfmnIDkvY7j
gIINCj4gKy0gTG9jYWxpdHk15LyY5YWI57qn5pyA6auY44CCDQo+ICsNCj4gK+WFs+S6jmxvY2Fs
aXRpZXPnmoTmm7TlpJrkv6Hmga/lkozlkKvkuYnvvIzor7flj4LpmIVUQ0cgUEPlrqLmiLfnq6/l
ubPlj7BUUE0g6YWN572u5paH5Lu26KeE6IyD55qE56ysMy4y6IqC44CCDQo+ICsNCj4gK+WPguiA
g+aWh+eMrg0KPiArPT09PT09PT0NCj4gKw0KPiArVENHIFBD5a6i5oi356uv5bmz5Y+wVFBN6YWN
572u5paH5Lu277yIUFRQ77yJ6KeE6IyDDQo+ICtodHRwczovL3RydXN0ZWRjb21wdXRpbmdncm91
cC5vcmcvcmVzb3VyY2UvcGMtY2xpZW50LXBsYXRmb3JtLXRwbS1wcm9maWxlLXB0cC1zcGVjaWZp
Y2F0aW9uLw0KPiAtLQ0KPiAyLjQ3LjENCj4NCg==
