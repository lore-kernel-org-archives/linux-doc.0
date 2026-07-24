Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7BA37C908
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875279; cv=pass; b=q/06T0mRh031bOQ8WmwIstO9z864LYuFbwE+d/dx0KCMcIFjMQp4tZ5ATqNkmDKMP6hIiuLN1nV2XqFX9QZyHEtsIYum8IQVxS4Gq29FCgBPY9sKLJQjofihpr6Lyw8VyS/YJ89wpVx62CbZMQl1V8IXq1dWeBq/YZ7JvH4+nuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875279; c=relaxed/simple;
	bh=WN7PX+KXayyPD4Yw09gzaxXA12UO+Szcpr9bsk/q8Nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9mrqTdaA5EK30QFUl3xZex4QjREWH/01B3dRDU24kULpniH2dXptGTya/lYVhZVlTdYQg2sQcds2/xYTD57/lNt+IsUNUsOI+w3cHqpH8uDLzMV1DyiaBuJZSq2C9kJ1VacpVtqIHl0wzMYYh0c5deW7zsTUUSy5gX9vaQJHTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgbZib8g; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgbZib8g"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0190a62beso17116e87.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 23:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784875276; cv=none;
        d=google.com; s=arc-20260327;
        b=iFwycckV4Vo/0usEVBPoYMPZDk6zOHiSyi0lR4ASce+03L9A5Xxr9/TVVBRUDJanj9
         WFYmpDqiJT6PSgitrFv8L3W2ofWecFrxxCxSyglcPZNT/yeGKZB2J7ihxuh8eljOvYI2
         XfMTgujMm0VRzUps8oFc6wKbgvDiRmWy5IwLisS1AQ9FI9+EriO9ouMpAT4ZbAo2TRAj
         emYy9zbRVF/3sStzTGKh1hHZfaEGm/97lIl+tSDl8PONwW5t6Ic2+ajEIXUMqghyKR7A
         dW98eFbyfHhcvq1CRYeoz9x/8wiACRR60o8hRNL4nH5NMRhSmqJ/asmibtmF5CcK+REi
         uyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WN7PX+KXayyPD4Yw09gzaxXA12UO+Szcpr9bsk/q8Nc=;
        fh=H+efLU/ddDPLhX3MAeqO5x2oEIHbU3Vx7bdfhf9PatM=;
        b=acC9qWivYfR8iX+yeWFaipe/7WiDuvIqyN2xOhHKPFo1THzED90qejTSDcOEjnU8oS
         8y2NlHhCNsRCaaVTpgSMLiJgsPdXJrUPEZPVuVdQKGe2mmTsxydkJ+pOWtiiBe+6Ov0n
         PKq8SlLx+pfPAtPD625nwYXO91ZmsKKaK8p2mWOpiaObIN+h1jRyIRG8R6vAWvsGay1N
         ST+D0Rfp2m8QwD9CQdDcBwZ0wD25hj34RRBhSZ6k9GiutvVR5oaOj4yjcWhMyyMhPRI+
         0XH2S6t8So39s+d2CJJ6rN93fztCoFKsVkTbUkjIOlst34rpcK9xsZigEmQLMJXlPja2
         iy2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784875276; x=1785480076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WN7PX+KXayyPD4Yw09gzaxXA12UO+Szcpr9bsk/q8Nc=;
        b=LgbZib8gF8CA6OGcr6uSkT/1I2fq1/YHUHi1yFKJFnE7gIkHYUl5aGmrBTSixXISda
         E1CkPhHCnr55nGqjw3A97wrHArS33F081636dqXXyoZQeQW3IDWoip2RgqXM7cI1UeYf
         Uag/uWXbOX5hW6OvmcVk77AFPQ5mdC94man6pnduwO+ASgwA95CvhANLjRq9nxlCosYF
         P5LayIQKqeMXmQz4Jdl4QfyKIt2V8bXUwW3S6iYepCqW0cMdDTrTWfJ5hjvRQ+J/0DYA
         ggj+39/fJ6yWouedYGgm27hd3RWhGC8uBrov1JB3RKUrR+ok3ipg5SvioI1hyuCUO9Cy
         IkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784875276; x=1785480076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WN7PX+KXayyPD4Yw09gzaxXA12UO+Szcpr9bsk/q8Nc=;
        b=id0Np3FTLj+uJ6lnTfFjdB9JshtEWjcEOawRTagzLAbUZRz4W0MZBWZfSG1vftTHfg
         a20NH9s0Kb7aeKjus6hyZwGVahPQBmgJvCl1tFvQlN7x0mBdV6u0LUkU0HXIPOZsaCmC
         Fhjlp39Zn54iTTFnq/pUkDFS9pTXuauJl+6a+yRjAKUYFvKa61n3Ber1ts89qgXdBh+l
         zwgnPRVrWm6zikBEM/K/FUXR6wmObYA0r9ve5yReo8qDsRaRy2st2Z4mXG8gmDEF2LLH
         fnnh/jpnuo2jQqiJ2uxuEwgPpnTkLh3unDO8nJ6TixyU71jgI8eFvNrVMwk2OW1RQhtr
         G3iA==
X-Forwarded-Encrypted: i=1; AHgh+RoSJiqWF14iLCbyf8VMVF2SvcQKu1eJqcIGXfDjomfinfAWV58bZdsXkCMwbzlrs6uFVaYm5xKe6zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbVaAdXJ1azmxWNmv+dXzR9x/Ugr+TQ2lr4Kes/qahgG76ise
	2hIqJ/Ir42FKw0HC4TAVIQLFZzbDXGOIWR70tSd/WkOD8NWlkinxmqWpaLTuEfCKV694ecFMi3J
	xO57gb8sc4Ta+v78LSpUh6UR6VY9yCL4=
X-Gm-Gg: AR+sD10L7S9al39PSARSOVBWaCUoPsbG6v1rMTlOnOYq/HlHnTdTy6Br9MgYGhLMBnQ
	seOe1roCyCv5JV/ZP+BoTzeqNsLOtgbFKfY5q6HXijeoXosmIHh1cAyCUDVJ7chb1zhdnoQithp
	/OXzEyphVfKHh7/0BElbUJvZCDZyQQNAclmanSe11RSYpGUFIYDk7mNRf7Svkr9CDUEdkthrgkd
	xw5rtLZCdGgpMvE97ynG3f587BZQCEEE7ge0uaxJq5A6acHW0BWnOsBYvY41464xnaBHXpBN8hQ
	cWfLOYRBW13oAFzE+KdIydqqlu+Q/X48g9oGCIJ2t8EF
X-Received: by 2002:a05:651c:546:b0:39c:750e:9378 with SMTP id
 38308e7fff4ca-39f07f26767mr7156351fa.6.1784875275542; Thu, 23 Jul 2026
 23:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-11-chenyou910331@gmail.com> <amG08XPfZzA5y00N@wyuan.org>
In-Reply-To: <amG08XPfZzA5y00N@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 24 Jul 2026 14:41:02 +0800
X-Gm-Features: AUfX_mxPok2wOcDh0EUOS7GPBQAjaMZqMN08IxBm23i2SLuH4Kv8UmFOhfHYFho
Message-ID: <CAKspUhJe1WmZzRh0TZDsO+jX_gWt6brhGuK3+o3T_k-eHc+aCQ@mail.gmail.com>
Subject: Re: [PATCH 10/16] docs/zh_TW: process: localize terminology in 2.Process.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBKdWwgMjMsIDIwMjYgYXQgMDI6MzA6MDlQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+IHMvTGludXNUb3J2YWxkcy9MaW51cyBUb3J2YWxkcy8NCg0KPiAxKSBhZGQgYSA8c3Bh
Y2U+IGJlZm9yZSBzdGFnaW5nDQo+IDIpIHJlbW92ZSB0aGUgPHNwYWNlPiBhZnRlciBzdGFnaW5n
DQoNCj4gV3JhcCBhIGxpdHRsZSBiaXQgZWFybGllciBoZXJlPw0KDQpBbGwgdGhyZWUgd2lsbCBi
ZSBmaXhlZCBpbiB2Mi4gVGhlIG1pc3Npbmcgc3BhY2UgaW4gIkxpbnVzVG9ydmFsZHMiDQphbmQg
dGhlIHNwYWNpbmcgYXJvdW5kICJzdGFnaW5nIiB3ZXJlIGNhcnJpZWQgb3ZlciBmcm9tIHRoZSBv
bGQNCnRyYW5zbGF0aW9uLCBhbmQgdGhlIGxvbmcgbGluZSBpcyBvbmUgb2YgdGhlIHBhcmFncmFw
aHMgdGhhdCBuZWVkcw0KcmVmbG93aW5nIGFmdGVyIGxvY2FsaXphdGlvbi4NCg0KVGhhbmtzIGZv
ciBjYXRjaGluZyB0aGVzZS4NCg0KQ2hlbi1ZdQ0KDQpXZWlqaWUgWXVhbiA8d3lAd3l1YW4ub3Jn
PiDmlrwgMjAyNuW5tDfmnIgyM+aXpemAseWbmyDkuIvljYgyOjMw5a+r6YGT77yaDQo+DQo+IE9u
IFdlZCwgSnVsIDIyLCAyMDI2IGF0IDA1OjU1OjM2QU0gKzA4MDAsIENoZW4tWXUgWWVoIHdyb3Rl
Og0KPiA+IExvY2FsaXplIG1haW5sYW5kIHRlcm1zIHRvIFRhaXdhbmVzZSBNYW5kYXJpbiAo5YWn
5qC44oaS5qC45b+DLCDnpL7ljYDihpLnpL7nvqQsDQo+ID4g6YO1566x4oaS5L+h566xLCAuLi4p
IGFuZCBzeW5jIHdpdGggdGhlIEVuZ2xpc2ggb3JpZ2luYWw6IHJvbGxpbmctcmVsZWFzZQ0KPiA+
IHdvcmRpbmcgd2l0aCB0aGUgOS54IGV4YW1wbGUgYW5kIFdpa2lwZWRpYSBsaW5rLCA5LngtcmMx
IGV4YW1wbGVzLA0KPiA+IHN0YWJsZSB0ZWFtIG5vdyBHcmVnIEtyb2FoLUhhcnRtYW4gYW5kIFNh
c2hhIExldmluLCBMVFMgbGlzdCBtb3ZlZCB0bw0KPiA+IGtlcm5lbC5vcmcsIGxpbnV4LW5leHQg
bWFpbnRhaW5lZCBieSBNYXJrIEJyb3duLCBhbmQgbWFpbGluZyBsaXN0cw0KPiA+IGhvc3RlZCBh
dCBzdWJzcGFjZS5rZXJuZWwub3JnLg0KPiA+DQo+ID4gdXBkYXRlIHRvIGNvbW1pdCA0NjI5ODM3
NTQ3N2IgKCJsaW51eC1uZXh0OiB1cGRhdGUgbWFpbnRhaW5lciBpbmZvLiIpDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5jb20+DQo+ID4g
LS0tDQo+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfVFcvcHJvY2Vzcy8yLlByb2Nlc3MucnN0ICB8
IDMwNCArKysrKysrKystLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0NiBpbnNlcnRp
b25zKCspLCAxNTggZGVsZXRpb25zKC0pDQo+ID4NCj4gWy4uLl0NCj4gPg0KPiA+IC3kuIDml6bk
uIDlgIvnqanlrprnmoTniYjmnKznmbzkvYjvvIzlroPnmoTmjIHnuozntq3orbflt6XkvZzlsLHo
oqvnp7vkuqTntabigJznqanlrprlnJjpmorigJ3vvIznm67liY3nlLENCj4gPiAtR3JlZyBLcm9h
aC1IYXJ0bWFu6aCY5bCO44CC56mp5a6a5ZyY6ZqK5bCH5L2/55SoNS54Lnnnt6jomZ/mlrnmoYjk
uI3lrprmnJ/lnLDnmbzkvYjnqanlrprniYjmnKznmoQNCj4gPiAt5pu05paw44CC6KaB5ZCI5YWl
5pu05paw54mI5pys77yM6KOc5LiB5b+F6aCI77yIMe+8ieS/ruW+qeS4gOWAi+mHjeimgeeahOe8
uumZt++8jOS4lO+8iDLvvInlt7LntpPlkIjkvbXliLANCj4gPiAt5LiL5LiA5YCL6ZaL55m854mI
5pys5Li757ea5Lit44CC5YWn5qC46YCa5bi45pyD5Zyo5YW25Yid5aeL54mI5pys5b6M55qE5LiA
5YCL5Lul5LiK55qE6ZaL55m86YCx5pyf5YWn5pS25YiwDQo+ID4gLeepqeWumueJiOabtOaWsOOA
guS+i+Wmgu+8jDUuMuWFp+aguOeahOatt+WPsuWmguS4i++8iDIwMTnlubTvvInvvJoNCj4gPiAr
5LiA5pem5LiA5YCL56mp5a6a55qE54mI5pys55m85biD77yM5a6D55qE5oyB57qM57at6K235bel
5L2c5bCx6KKr56e75Lqk57Wm4oCc56mp5a6a5ZyY6ZqK4oCd77yM55uu5YmN55SxDQo+ID4gK0dy
ZWcgS3JvYWgtSGFydG1hbuWSjFNhc2hhIExldmlu57WE5oiQ44CC56mp5a6a5ZyY6ZqK5bCH5L2/
55SoOS54Lnnnt6jomZ/mlrnmoYjkuI3lrprmnJ/lnLANCj4gPiAr55m85biD56mp5a6a54mI5pys
55qE5pu05paw44CC6KaB5ZCI5YWl5pu05paw54mI5pys77yM6KOc5LiB5b+F6aCI77yIMe+8ieS/
ruW+qeS4gOWAi+mHjeimgeeahOe8uumZt++8jOS4lO+8iDLvvInlt7LntpPlkIjkvbXliLANCj4N
Cj4gV3JhcCBhIGxpdHRsZSBiaXQgZWFybGllciBoZXJlPw0KPg0KPiBbLi4uXQ0KPiA+IEBAIC0x
NTAsNzQgKzEzOCw3NCBAQCBHcmVnIEtyb2FoLUhhcnRtYW7poJjlsI7jgILnqanlrprlnJjpmorl
sIfkvb/nlKg1Lngueee3qOiZn+aWueahiOS4jeWumuacn+WcsOeZvA0KPiA+ICAgIOWVj+mhjOOA
gg0KPiA+DQo+ID4gIC0g6KuL5rOo5oSP77yM5aSn5aSa5pW457at6K235Lq65ZOh5Lmf5pyJ5pel
5bi45bel5L2c77yM5Zug5q2k5ZCI5L216KOc5LiB5Y+v6IO95LiN5piv5LuW5YCR55qE5pyA5YSq
5YWI5bel5L2c44CCDQo+ID4gLSAg5aaC5p6c5oKo55qE6KOc5LiB5b6X5Yiw5LqG6ZyA6KaB5pu0
5pS555qE5Y+N6aWL77yM6YKj6bq85oKo5oeJ6Kmy6YCy6KGM6YCZ5Lqb5pu05pS577yM5oiW6ICF
6Kej6YeL54iy5L2VDQo+ID4gKyAg5aaC5p6c5oKo55qE6KOc5LiB5b6X5Yiw5LqG6ZyA6KaB5pu0
5pS555qE5Y+N6aWL77yM6YKj6bq85oKo5oeJ6Kmy6YCy6KGM6YCZ5Lqb5pu05pS577yM5oiW6ICF
6Kej6YeL54K65L2VDQo+ID4gICAg5LiN5oeJ6Kmy6YCy6KGM6YCZ5Lqb5pu05pS544CC5aaC5p6c
5oKo55qE6KOc5LiB5rKS5pyJ6KmV5a+p5oSP6KaL77yM5Lmf5rKS5pyJ6KKr5YW255u45oeJ55qE
5a2Q57O757Wx5oiWDQo+ID4gLSAg6amF5YuV56iL5bqP57at6K236ICF5o6l5Y+X77yM6YKj6bq8
5oKo5oeJ6Kmy5aCF5oyB5LiN5oeI5Zyw5bCH6KOc5LiB5pu05paw5Yiw55W25YmN5YWn5qC45L2/
5YW25Y+v6KKr5q2j5bi4DQo+ID4gLSAg5oeJ55So77yM5Lim5LiN5pa35Zyw55m86YCB5a6D5Lul
5L6b5a+p5p+l5ZKM5ZCI5Lim44CCDQo+ID4gKyAg6amF5YuV56iL5byP57at6K236ICF5o6l5Y+X
77yM6YKj6bq85oKo5oeJ6Kmy5aCF5oyB5LiN5oeI5Zyw5bCH6KOc5LiB5pu05paw5Yiw55W25YmN
5qC45b+D5L2/5YW25Y+v6KKr5q2j5bi4DQo+ID4gKyAg5oeJ55So77yM5Lim5LiN5pa35Zyw55m8
6YCB5a6D5Lul5L6b5a+p5p+l5ZKM5ZCI5L2144CCDQo+ID4NCj4gPiAtLSDlkIjkvbXliLDkuLvn
t5rjgILmnIDntYLvvIzkuIDlgIvmiJDlip/nmoToo5zkuIHlsIfooqvlkIjkvbXliLDnlLFMaW51
c1RvcnZhbGRz566h55CG55qE5Li757ea5a2Y5YSy5bqrDQo+ID4gKy0g5ZCI5L215Yiw5Li757ea
44CC5pyA57WC77yM5LiA5YCL5oiQ5Yqf55qE6KOc5LiB5bCH6KKr5ZCI5L215Yiw55SxTGludXNU
b3J2YWxkc+euoeeQhueahOS4u+e3muWEsuWtmOW6qw0KPg0KPiBzL0xpbnVzVG9ydmFsZHMvTGlu
dXMgVG9ydmFsZHMvDQo+DQo+ID4gICAg5Lit44CC5q2k5pmC5Y+v6IO95pyD5Ye654++5pu05aSa
55qE6KmV6KuW5ZKML+aIluWVj+mhjO+8m+WwjemWi+eZvOS6uuWToeS+huiqquaHieWwjemAmeS6
m+WVj+mhjOS4puino+axug0KPiA+ICAgIOWHuuePvueahOS7u+S9leWVj+mhjOS7jeW+iOmHjeim
geOAgg0KPiBbLi4uXQ0KPiA+DQo+ID4gIFN0YWdpbmcg5qi5DQo+ID4gIC0tLS0tLS0tLS0NCj4g
Pg0KPiA+IC3lhafmoLjmupDku6PnorzmqLnljIXlkKtkcml2ZXJzL3N0YWdpbmcv55uu6YyE77yM
5YW25Lit5pyJ6Kix5aSa6amF5YuV56iL5bqP5oiW5paH5Lu257O757Wx55qE5a2Q55uu6YyEDQo+
ID4gLeato+WcqOiiq+a3u+WKoOWIsOWFp+aguOaoueS4reOAguWug+WAkeWcqOS7jeeEtumcgOim
geabtOWkmueahOS/ruato+eahOaZguWAmeWPr+S7peS/neeVmeWcqGRyaXZlci9zdGFnaW5nLw0K
PiA+IC3nm67pjITkuK3vvJvkuIDml6blrozmiJDvvIzlsLHlj6/ku6XlsIflroPlgJHnp7vliLDl
hafmoLjkuK3jgILpgJnmmK/kuIDnqK7ot5/ouaTkuI3nrKblkIhMaW51eOWFp+aguOe3qOeivOaI
lg0KPiA+IC3os6rph4/mqJnmupbnmoTpqYXli5XnqIvluo/nmoTmlrnms5XvvIzkurrlgJHlj6/o
g73luIzmnJvkvb/nlKjlroPlgJHkuKbot5/ouaTplovnmbzjgIINCj4gPiAr5qC45b+D5Y6f5aeL
56iL5byP56K85qi55YyF5ZCrZHJpdmVycy9zdGFnaW5nL+ebrumMhO+8jOWFtuS4reacieioseWk
mumpheWLleeoi+W8j+aIluaqlOahiOezu+e1seeahOWtkOebrumMhA0KPiA+ICvmraPlnKjooqvm
t7vliqDliLDmoLjlv4PmqLnkuK3jgILlroPlgJHlnKjku43nhLbpnIDopoHmm7TlpJrnmoTkv67m
raPnmoTmmYLlgJnlj6/ku6Xkv53nlZnlnKhkcml2ZXIvc3RhZ2luZy8NCj4gPiAr55uu6YyE5Lit
77yb5LiA5pem5a6M5oiQ77yM5bCx5Y+v5Lul5bCH5a6D5YCR56e75Yiw5qC45b+D5Lit44CC6YCZ
5piv5LiA56iu6L+96Lmk5LiN56ym5ZCITGludXjmoLjlv4Pnt6jnorzmiJYNCj4gPiAr5ZOB6LOq
5qiZ5rqW55qE6amF5YuV56iL5byP55qE5pa55rOV77yM5Lq65YCR5Y+v6IO95biM5pyb5L2/55So
5a6D5YCR5Lim6L+96Lmk6ZaL55m844CCDQo+ID4NCj4gPiAtR3JlZyBLcm9haCBIYXJ0bWFuIOeb
ruWJjeiyoOiyrOe2reitt3N0YWdpbmcg5qi544CC5LuN6ZyA6KaB5L+u5q2j55qE6amF5YuV56iL
5bqP5bCH55m86YCB57Wm5LuW77yMDQo+DQo+IDEpIGFkZCBhIDxzcGFjZT4gYmVmb3JlIHN0YWdp
bmcNCj4gMikgcmVtb3ZlIHRoZSA8c3BhY2U+IGFmdGVyIHN0YWdpbmcNCg==
