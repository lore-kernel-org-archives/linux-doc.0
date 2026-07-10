Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B20D358389
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 08:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673386; cv=pass; b=dLEvi2gzYUdDlqfp9/lk8/d/QH5XnLlxdC2DzV0tClyOMxr+BYejX/jM3R/l6IIkLFz6BBLtSSYI2Arbf1CusH1YXjvwqzZQPp7HHebucr4fTtelH/BmTA7Bb4RcMOcNwRdTRJOsT9PC7XNjMrFYqCXYhwa2d72RIOkKQ7t7Pgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673386; c=relaxed/simple;
	bh=GB1rwwZf2E0oG9D8FQOZVFHR4cSbiG9yzuCPbja5sY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jI8zWAK81E+NAg32dmo95AWHm1aim64ue4DeXuQN1EQm30LMA6q4Oik/X1F1i+KmgFJknYhD5iANk5SkD5zeicvkx+OC0o87XXuYyY1pS9k8OUAUFF82fBNdqcP09Ysf+zwRXJKkbIBpAZrmy6nTw/k6JnY/93gTY/GliKlEkQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqFV75Jk; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqFV75Jk"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb0c46243so49075e87.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 01:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783673382; cv=none;
        d=google.com; s=arc-20260327;
        b=WjBrGxB5FkLx/WyfqCJUJyMpqBmjmwLNALSVwtucbvqW+bWimIHmCf1fF1OTEPccBH
         8xub+6+b5iIAI7prv0uSR721URtIwqYOaR3dRacZqGhmSzbsWXyjeCEF85vscQfIYDoN
         1itCvgavejm/8WPsTIeuYYRHXd9Sw9iyThKx2Ie8OHPCQ78SAaVv4lTYUxdC8pWeosFX
         3K42V7v5sLuCiwyxEJZVWioTISnrgJVHC6MEf19U/H8FKKqS3qJ00fsMwb6MDxd8jXi0
         huNYuW7Mzc0y25zOvSSLF4wBxj+OKyHUFJYsGSL0XNff7Sf4u1r//DH0xr0XkGuV5+Gx
         M+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GB1rwwZf2E0oG9D8FQOZVFHR4cSbiG9yzuCPbja5sY8=;
        fh=2WjSO1H1b0riWxy63P5RwKLJQYsKpnePLtlQw+owReg=;
        b=iRutcdeGiOR6vY6V/fnb3vu80QpOvcQQ1Ft7+lb9D9FN5JUhHz6MdQD2jEhNHLgU24
         W9N5VWXszbmaJnt+MezP9BuNxcilKbyH6pOEY7mVUyvFSpi34IXmijuPFQkNPJU1nT41
         MUE0Jiop9nOdPmbLc6JaZt+C+56aBMsxkcAbd4sxHWCQ+8tecQWnGFHmPODio6kRytiC
         AnGMZ3XWizOsslQl+/IF/ZHU69RKDTzyjyYrDdObIL41LYp9w6c8PhZmzQbgMFipSaqQ
         MG83PLxM7b7W6I4iUuxVsjMRblMUA653qkhEGbuaSXNdE2gLLeMxodo+jDM2n1rjCLKO
         8b9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783673382; x=1784278182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GB1rwwZf2E0oG9D8FQOZVFHR4cSbiG9yzuCPbja5sY8=;
        b=TqFV75JkrZGuy9Rwmbw9SR40EvYkMNRFs2yGMDBB8fjVaOiH/y2EbykiJObvn3FY9h
         7UrEAQU+PhVAGhzD9LLGJTRSVvdtIH7LyTbg4kUXzylrcDuua/o7hQzksI8AlGqn9y5o
         T3jYyTw38042GkFNN6o0mQmA3QqWMl3LSCf2u3/eNhqk2hILKjo4COXfQgDqjwiqwRgt
         DknHOGDUXZdoH98SO7sr/gZdXas6DRWpFmXDGXQ69L6rBePNY8arCVNN75rBXT7OQyyJ
         +uvFyeLTJ4W7R1mwpzVOwG1/Yw1zh1L+ajm63NKH/vEepG2tQ68bwXczAumLAJQg+5Pj
         1bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673382; x=1784278182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB1rwwZf2E0oG9D8FQOZVFHR4cSbiG9yzuCPbja5sY8=;
        b=GXY7R8Pp07sYqTJmnKSFte3HNPP0LUJOhCWJBwuRA4P5oGbW/qOYqlAK+H1OGMUFIr
         E3SevatG30bTjIV+SKhyOaX6MBsjxgsTZGlupe/NX9wOgs63jH73hBGqe8KKATU/O5MW
         GdGyrFnT+5QzCY3xL7I9DQhmwJtPsxt+GcX+gj3Z1CspShrJxqdZhSuNM3hVOLfR+oQH
         0lWQuGBwxsu5t7Kg/P1D5SCmtum61ZG0p0F3I7fB+AHGuizm97NarCsPNSx5dwtMSTvT
         FSR3JvKxWTSEo2fPtatkJEUUdE3Pa5oQ5OUE0be0/RBKF9Y0Cw+c/jTHYyC1kZfYLFG3
         6zsw==
X-Forwarded-Encrypted: i=1; AHgh+RrFksQ5J/ilMcAE1l3qCRy9BW+wvzYX21p29HbQCe7scO9XJRolFoSZ5f2WGY6K0lLckwmOD74ZdmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDtA3/dUO3EdWXEyz7VkHrvu+Tlq5rgaSlMhHjNocoaiU1mr/A
	oWew00swZUg2z0sWisgSBLGq1ZWWEpgq1LjOb7rmCKSFg/5mH/3UNT0QZ0JQVCUylLpS5V7kkjB
	4ATbMdvSozVBLkimVxlLSsQHOGBTt3wpVBVz5
X-Gm-Gg: AfdE7clUwbLJXPL372ytYxcQ50A5YWiG1gTqfszA3VkwU2iVeXPjMuSXFkLRbGzfzc3
	5rFbmDFnOCeaAzolAKcOhohcfFM9zZGbjNzgCsvnM63+HRWPxBBDy7KpHkzWQuZnKimQ2a0hE2C
	+ZknMdjRtHUn6+Z2KM6iC514ibj6y0VsrmJaMwk8H53aNVLDB72ouF5Cs3Nxr5NExxwVywRsW4Y
	UYoxnN762iDqGayXYJYItya+wQX5lDK/JsLSA1FuU+vH54wGoBKszZQB5bh0YYaowvBk1tZURBp
	Zx/UfB16S0gN1ZJWS7ZvvcrzCSv7xo2YuiTL0mLZaYKi/XqNTH9XuX4=
X-Received: by 2002:a2e:a882:0:b0:39b:3019:2267 with SMTP id
 38308e7fff4ca-39c8270017bmr8380651fa.0.1783673382114; Fri, 10 Jul 2026
 01:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603082531.263115-1-chenyou910331@gmail.com>
In-Reply-To: <20260603082531.263115-1-chenyou910331@gmail.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 10 Jul 2026 16:49:30 +0800
X-Gm-Features: AVVi8Cfkm6jqZmFl4uLQwgOQ_HHoAa9ziRVe_GW6v_AXuPKqt4hJJ5Lgc4QuZGI
Message-ID: <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
To: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

R2VudGxlIHBpbmcuDQoNClRoaXMgdjIgYWRkcmVzc2VkIHRoZSByZXZpZXcgY29tbWVudHMgZnJv
bSBBbGV4IGFuZCBEb25nbGlhbmcuDQpJcyB0aGVyZSBhbnl0aGluZyBlbHNlIEkgc2hvdWxkIGlt
cHJvdmUsIG9yIGlzIGl0IHF1ZXVlZCBzb21ld2hlcmUNCkkgbWlnaHQgaGF2ZSBtaXNzZWQ/DQoN
ClRoYW5rcywNCkNoZW4tWXUNCg0KQ2hlbi1ZdSBZZWggPGNoZW55b3U5MTAzMzFAZ21haWwuY29t
PiDmlrwgMjAyNuW5tDbmnIgz5pel6YCx5LiJIOS4i+WNiDQ6Mjblr6vpgZPvvJoNCj4NCj4gVHJh
bnNsYXRlIFBSQyB0ZWNoIHRlcm1zIGludG8gVGFpd2FuZXNlIHRlY2ggdGVybXMgKGUuZy4sDQo+
IOWFp+aguCAtPiDmoLjlv4MsIOS7o+eivCAtPiDnqIvlvI/norwsIOi7n+S7tiAtPiDou5/pq5Qp
IHRvIGltcHJvdmUNCj4gcmVhZGFiaWxpdHkgZm9yIGxvY2FsIGRldmVsb3BlcnMuIEFsc28sIHJl
cGhyYXNlIHNldmVyYWwNCj4gYXdrd2FyZCBzZW50ZW5jZXMgdG8gbWFrZSB0aGUgZG9jdW1lbnQg
bW9yZSBmbHVlbnQuDQo+DQo+IFJldmlld2VkLWJ5OiBEb25nbGlhbmcgTXUgPGR6bTkxQGh1c3Qu
ZWR1LmNuPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFp
bC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFVwZGF0ZSBTaWduZWQtb2ZmLWJ5
IHRvIHVzZSBmdWxsIHJlYWwgbmFtZS4NCj4gLSBBZGQgUmV2aWV3ZWQtYnkgdGFnIGZyb20gRG9u
Z2xpYW5nIE11Lg0KPg0KPiAgLi4uL3poX1RXL3Byb2Nlc3MvOC5Db25jbHVzaW9uLnJzdCAgICAg
ICAgICAgIHwgNDUgKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0DQo+IGlu
ZGV4IGQxNjM0NDIxYjYyYy4uODIzOTY5Y2Y3OTNkIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9wcm9jZXNzLzguQ29uY2x1c2lvbi5yc3QNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy84LkNvbmNsdXNpb24ucnN0
DQo+IEBAIC0xNCw0MiArMTQsNDEgQEANCj4NCj4gIC4uIF90d19kZXZlbG9wbWVudF9jb25jbHVz
aW9uOg0KPg0KPiAt5pu05aSa5L+h5oGvDQo+ICvmm7TlpJros4foqIoNCj4gID09PT09PT09DQo+
DQo+IC3pl5zmlrxMaW51eOWFp+aguOmWi+eZvOWSjOebuOmXnOS4u+mhjOeahOS/oeaBr+S+hua6
kOW+iOWkmuOAgummluWFiOaYr+WcqOWFp+aguOa6kOS7o+eivOWIhueZvOS4reaJvuWIsOeahA0K
PiAt5paH5qqU55uu6YyE44CC6aCC57SaDQo+ICvpl5zmlrxMaW51eOaguOW/g+mWi+eZvOWSjOeb
uOmXnOS4u+mhjOeahOizh+ioiuS+hua6kOW+iOWkmuOAgummluWFiOaYr+WcqOaguOW/g+WOn+Wn
i+eivOWIhueZvOS4reaJvuWIsOeahA0KPiAr5paH5Lu255uu6YyE44CC6aCC57SaDQo+ICA6cmVm
OmBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wcm9jZXNzL2hvd3RvLnJzdCA8dHdf
cHJvY2Vzc19ob3d0bz5gDQo+ICDmlofku7bmmK/kuIDlgIvph43opoHnmoTotbfpu57vvJsNCj4g
IDpyZWY6YERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3Mvc3VibWl0dGlu
Zy1wYXRjaGVzLnJzdCA8dHdfc3VibWl0dGluZ3BhdGNoZXM+YA0KPiAt5Lmf5piv5omA5pyJ5YWn
5qC46ZaL55m85Lq65ZOh6YO95oeJ6Kmy6Zax6K6A55qE5YWn5a6544CC6Kix5aSa5YWn6YOo5YWn
5qC4QVBJ6YO95piv5L2/55Soa2VybmVsZG9j5qmf5Yi2DQo+IC3oqJjpjITnmoTvvJvigJxtYWtl
IGh0bWxkb2Nz4oCd5oiW4oCcbWFrZSBwZGZkb2Nz4oCd5Y+v55So5pa85LulSFRNTOaIllBERuag
vOW8j+eUn+aIkOmAmeS6m+aWh+aqlA0KPiAt77yI5YSY566h5p+Q5Lqb55m86KGM54mI5o+Q5L6b
55qEdGV454mI5pys5pyD6YGH5Yiw5YWn6YOo6ZmQ5Yi277yM54Sh5rOV5q2j56K66JmV55CG5paH
5qqU77yJ44CCDQo+IC0NCj4gLeS4jeWQjOeahOe2suermeWcqOWQhOWAi+e0sOevgOWxpOasoeS4
iuiojuirluWFp+aguOmWi+eZvOOAguacrOaWh+S9nOiAheaDs+ismeiZm+WcsOW7uuitsOeUqCBo
dHRwczovL2x3bi5uZXQvDQo+IC3kvZzniLLkvobmupDvvJvmnInpl5zoqLHlpJrnibnlrprlhafm
oLjkuLvpoYznmoTkv6Hmga/lj6/ku6XpgJrpgY7ku6XkuIvntrLlnYDnmoQgTFdOIOWFp+aguOe0
ouW8leaJvuWIsO+8mg0KPiAr5Lmf5piv5omA5pyJ5qC45b+D6ZaL55m85Lq65ZOh6YO95oeJ6Kmy
6Zax6K6A55qE5YWn5a6544CC6Kix5aSa5YWn6YOo5qC45b+DQVBJ6YO95piv5L2/55Soa2VybmVs
ZG9j5qmf5Yi2DQo+ICvoqJjpjITnmoTvvJvigJxtYWtlIGh0bWxkb2Nz4oCd5oiW4oCcbWFrZSBw
ZGZkb2Nz4oCd5Y+v55So5pa85LulSFRNTOaIllBERuagvOW8j+eUn+aIkOmAmeS6m+aWh+S7tg0K
PiAr77yI5YSY566h5p+Q5Lqb55m86KGM54mI5o+Q5L6b55qEdGV454mI5pys5pyD6YGH5Yiw5YWn
6YOo6ZmQ5Yi277yM54Sh5rOV5q2j56K66JmV55CG5paH5Lu277yJ44CCDQo+DQo+ICvkuI3lkIzn
moTntrLnq5nlnKjlkITlgIvntLDnr4DlsaTmrKHkuIroqI7oq5bmoLjlv4PplovnmbzjgILmnKzm
lofkvZzogIXmg7PorJnomZvlnLDlu7rorbDnlKggaHR0cHM6Ly9sd24ubmV0Lw0KPiAr5L2c54iy
5L6G5rqQ77yb5pyJ6Zec6Kix5aSa54m55a6a5qC45b+D5Li76aGM55qE6LOH6KiK5Y+v5Lul6YCa
6YGO5Lul5LiL57ay5Z2A55qEIExXTiDmoLjlv4PntKLlvJXmib7liLA6DQo+ICAgIGh0dHA6Ly9s
d24ubmV0L2tlcm5lbC9pbmRleC8NCj4NCj4gLemZpOatpOS5i+Wklu+8jOWFp+aguOmWi+eZvOS6
uuWToeeahOS4gOWAi+WvtuiytOizh+a6kOaYr++8mg0KPiAr6Zmk5q2k5LmL5aSW77yM5qC45b+D
6ZaL55m85Lq65ZOh55qE5LiA5YCL5a+26LK06LOH5rqQ5piv77yaDQo+DQo+ICAgIGh0dHBzOi8v
a2VybmVsbmV3Ymllcy5vcmcvDQo+DQo+IC3nlbbnhLbvvIzkuZ/kuI3mh4noqbLlv5joqJggaHR0
cHM6Ly9rZXJuZWwub3JnLyDvvIzpgJnmmK/lhafmoLjnmbzkvYjkv6Hmga/nmoTmnIDntYLkvY3n
va7jgIINCj4gK+eVtueEtu+8jOS5n+S4jeaHieipsuW/mOiomCBodHRwczovL2tlcm5lbC5vcmcv
IO+8jOmAmeaYr+aguOW/g+eZvOS9iOizh+ioiueahOacgOe1guS9jee9ruOAgg0KPg0KPiAt6Zec
5pa85YWn5qC46ZaL55m85pyJ5b6I5aSa5pu477yaDQo+ICvpl5zmlrzmoLjlv4PplovnmbzmnInl
vojlpJrmm7jvvJoNCj4NCj4gICAg44CKTGludXjoqK3lgpnpqYXli5XnqIvluo/jgIvnrKzkuInn
iYjvvIhKb25hdGhhbiBDb3JiZXTjgIFBbGVzc2FuZHJvIFJ1YmluaeWSjEdyZWcgS3JvYWggSGFy
dG1hbu+8iQ0KPiAgICDnt5rkuIrniYjmnKzlnKggaHR0cDovL2x3bi5uZXQva2VybmVsL2xkZDMv
DQo+DQo+IC0gIOOAikxpbnV45YWn5qC46Kit6KiI6IiH5a+m54++44CL77yIUm9iZXJ0IExvdmXv
vIkNCj4gKyAg44CKTGludXjmoLjlv4PoqK3oqIjoiIflr6bnj77jgIvvvIhSb2JlcnQgTG92Ze+8
iQ0KPg0KPiAtICDjgIrmt7HlhaXnkIbop6NMaW51eOWFp+aguOOAiyhEYW5pZWwgQm92ZXTlkoxN
YXJjbyBDZXNhdGnvvIkNCj4gKyAg44CK5rex5YWl55CG6KejTGludXjmoLjlv4PjgIsoRGFuaWVs
IEJvdmV05ZKMTWFyY28gQ2VzYXRp77yJDQo+DQo+ICDnhLbogIzvvIzmiYDmnInpgJnkupvmm7jp
g73mnInkuIDlgIvlhbHlkIznmoTnvLrpu57vvJrlroPlgJHkuIrmnrbmmYLlsLHlvoDlvoDmnInk
upvpgY7mmYLvvIzogIzkuJTlt7LntpPkuIrmnrYNCj4gLeS4gOauteaZgumWk+S6huOAguS4jemB
ju+8jOWcqOmCo+ijj+mChOaYr+WPr+S7peaJvuWIsOebuOeVtuWkmueahOWlveS/oeaBr+OAgg0K
PiAr5LiA5q615pmC6ZaT5LqG44CC5LiN6YGO77yM5Zyo6YKj6KOP6YKE5piv5Y+v5Lul5om+5Yiw
55u455W25aSa55qE5aW96LOH6KiK44CCDQo+DQo+IC3mnInpl5xnaXTnmoTmlofmqpTvvIzoq4vo
qKrllY/vvJoNCj4gK+aciemXnGdpdOeahOaWh+S7tu+8jOiri+ioquWVj++8mg0KPg0KPiAgICBo
dHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0d2FyZS9zY20vZ2l0L2RvY3MvDQo+DQo+IEBA
IC01OCwxNiArNTcsMTYgQEANCj4gIOe1kOirlg0KPiAgPT09PQ0KPg0KPiAt56Wd6LOA5omA5pyJ
6YCa6YGO6YCZ56+H5YaX6ZW355qE5paH5qqU55qE5Lq644CC5biM5pyb5a6D6IO95aSg5bmr5Yqp
5oKo55CG6KejTGludXjlhafmoLjmmK/lpoLkvZXplovnmbznmoTvvIwNCj4gK+elneizgOaJgOac
iemAmumBjumAmeevh+WGl+mVt+eahOaWh+S7tueahOS6uuOAguW4jOacm+Wug+iDveWkoOW5q+WK
qeaCqOeQhuino0xpbnV45qC45b+D5piv5aaC5L2V6ZaL55m855qE77yMDQo+ICDku6Xlj4rmgqjl
poLkvZXlj4PoiIfpgJnlgIvpgY7nqIvjgIINCj4NCj4gLeacgOW+jO+8jOmHjeimgeeahOaYr+WP
g+iIh+OAguS7u+S9lemWi+a6kOi7n+S7tumgheebrumDveS4jeacg+i2hemBjuWFtuiyoueNu+iA
heaKleWFpeWFtuS4reeahOe4veWSjOOAgkxpbnV4DQo+IC3lhafmoLjnmoTnmbzlsZXpgJ/luqbl
kozku6XliY3kuIDmqKPlv6vvvIzlm6DniLLlroPlvpfliLDkuoblpKfph4/plovnmbzkurrlk6Hn
moTluavliqnvvIzku5blgJHpg73lnKjliqrlipvkvb/lroMNCj4gLeiuiuW+l+abtOWlveOAguWF
p+aguOaYr+S4gOWAi+acgOaIkOWKn+eahOS+i+WtkO+8jOiqquaYjuS6hueVtuaIkOWNg+S4iuiQ
rOeahOS6uueIsuS6huS4gOWAi+WFseWQjOeahOebruaomeS4gOi1tw0KPiAr5pyA5b6M77yM6YeN
6KaB55qE5piv5Y+D6IiH44CC5Lu75L2V6ZaL5rqQ6Luf6auU5bCI5qGI6YO95LiN5pyD6LaF6YGO
5YW26LKi54276ICF5oqV5YWl5YW25Lit55qE57i95ZKM44CCTGludXgNCj4gK+aguOW/g+eahOeZ
vOWxlemAn+W6puWSjOS7peWJjeS4gOaoo+W/q++8jOWboOeIsuWug+W+l+WIsOS6huWkp+mHj+mW
i+eZvOS6uuWToeeahOW5q+WKqe+8jOS7luWAkemDveWcqOWKquWKm+S9v+Wugw0KPiAr6K6K5b6X
5pu05aW944CC5qC45b+D5piv5LiA5YCL5pyA5oiQ5Yqf55qE5L6L5a2Q77yM6Kqq5piO5LqG55W2
5oiQ5Y2D5LiK6JCs55qE5Lq654iy5LqG5LiA5YCL5YWx5ZCM55qE55uu5qiZ5LiA6LW3DQo+ICDl
t6XkvZzmmYLvvIzlj6/ku6XlgZrlh7rku4DpurzjgIINCj4NCj4gLeS4jemBju+8jOWFp+aguOe4
veaYr+WPr+S7peW+nuabtOWkp+eahOmWi+eZvOS6uuWToeWfuuekjuS4reeNsuebiuOAgue4veac
ieabtOWkmueahOW3peS9nOimgeWBmuOAguS9huaYr+WQjOaoow0KPiAt6YeN6KaB55qE5piv77yM
TGludXjnlJ/mhYvns7vntbHkuK3nmoTlpKflpJrmlbjlhbbku5blj4PoiIfogIXlj6/ku6XpgJrp
gY7niLLlhafmoLjlgZrlh7rosqLnjbvogIzlj5fnm4rjgILkvb8NCj4gLeS7o+eivOmAsuWFpeS4
u+e3muaYr+aPkOmrmOS7o+eivOizqumHj+OAgemZjeS9jue2reitt+WSjOWIhueZvOaIkOacrOOA
geaPkOmrmOWwjeWFp+aguOmWi+eZvOaWueWQkeeahOW9semfv+eoi+W6pg0KPiAr5LiN6YGO77yM
5qC45b+D57i95piv5Y+v5Lul5b6e5pu05aSn55qE6ZaL55m85Lq65ZOh5Z+656SO5Lit542y55uK
44CC57i95pyJ5pu05aSa55qE5bel5L2c6KaB5YGa44CC5L2G5piv5ZCM5qijDQo+ICvph43opoHn
moTmmK/vvIxMaW51eOeUn+aFi+ezu+e1seS4reeahOWkp+WkmuaVuOWFtuS7luWPg+iIh+iAheWP
r+S7pemAmumBjueIsuaguOW/g+WBmuWHuuiyoueNu+iAjOWPl+ebiuOAguS9vw0KPiAr56iL5byP
56K86YCy5YWl5Li757ea5piv5o+Q6auY56iL5byP56K85ZOB6LOq44CB6ZmN5L2O57at6K235ZKM
5YiG55m85oiQ5pys44CB5o+Q6auY5bCN5qC45b+D6ZaL55m85pa55ZCR55qE5b2x6Z+/56iL5bqm
DQo+ICDnrYnnmoTpl5zpjbXjgILpgJnmmK/kuIDnqK7lhbHotI/nmoTlsYDpnaLjgILllZPli5Xk
vaDnmoTnt6jovK/lmajvvIzkvobliqDlhaXmiJHlgJHlkKfvvJvkvaDmnIPpnZ7luLjlj5fmraHo
v47nmoTjgIINCj4NCj4gLS0NCj4gMi40My4wDQo+DQo=
