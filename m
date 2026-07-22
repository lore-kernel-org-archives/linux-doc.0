Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE045345CBC
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727142; cv=pass; b=SFD1lYLZnpn9DnUwksqS85tz5XoNdIg9qDvjSytEa7F0PhDZRmpmyT94DHd5Md1627JcjpsXrg1VGGnOyQbURSiMDa71Q8RT4KZXQwyKiO4hjHKF7HoMAf3x00srz/phNqHsMwkPUSZMPNgwrocZdbHCV8OLVA7gXo8xQLKPsog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727142; c=relaxed/simple;
	bh=bT2vr2pGofjO6HVhs1OsOpxbY7HDW5tNstjVsp6JA8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJuEA/405M7HbTzI34qtn9S/KR79k2/LcPDa0ZcEeLKBkVM1h/ye7JN74thG0OHnySHdQGmJXWECen7EIFkv/ddBPvONCdJywr7Diii60VKlpeGw/92npncDJ2a6cMjYF2vDbsC+H+Xuq1zU9Qrqe6kwtXdgs40G5sPuupjhNz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmcWDnW0; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmcWDnW0"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2960ea2fbso393021e87.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 06:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784727137; cv=none;
        d=google.com; s=arc-20260327;
        b=kYfu2YgwT/UhCaA8dDXKUb6Uar0z95Grdkn7EHbFVKYLl9EIdBbWDAnuaB6TdaQy+p
         epmvprp2IrZM1Ttr+LGt/sXAA2GpbhLDb8O6CIn9OAEgsmtux4ez+nIwT5mSHebxHoBv
         +c7QtqSMvOZ1dSrpb9moVOIWH2YS8AodRr91pZ44LkJaiJjW0tEuo9d4hgyRnhOS6BPK
         knSHN/AUe1EwLRtVY9nvxSxsLcqa+SjhiFM0YMDSkp6eS+AUg8GLN6cBaAsmZa0JSR2m
         ZUOFQ7PMBbp7ncDXysDPQ7RQTMkbc7/uej0QPXWlchLBpYEZ4bU/DWAE+AhSl4aEQ2nH
         165w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bT2vr2pGofjO6HVhs1OsOpxbY7HDW5tNstjVsp6JA8A=;
        fh=HoaiGut7YoD6NG8Y9OT3hOiczqf9wbpkCSFv+WLbNs8=;
        b=auSkM0/gAy4Qs5yt6JxwVC6/xKKPlMGOJXxbvZQGcSy83U+LwD5Rc9a0zfplPpCwyP
         ELf9w7Q/Or4I7qo6TDXjulEp65caIJjX/jrTitCn6N0UElfjYSgaXZxN54Mf4AFvCFW3
         tQbNyLnek8wABxj21KRvY6KmQLsI11cnJswFMLWaaFCNTI14qLORp/3vPcFmOR81ML21
         znUUG6Iw7ieqKGwgn+Zw3TNO/48vi9pz0jG6DvmG/ipzNVtXrvfBH6gJv3f3jHM97u1n
         aCuOJWVRWH3NYcOjdtqwMXNLILmU/qmnG9VxpD61HmawVja+I/s/bzKRspxyJxc8cmpw
         QyFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784727137; x=1785331937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bT2vr2pGofjO6HVhs1OsOpxbY7HDW5tNstjVsp6JA8A=;
        b=pmcWDnW0zfAoUUob7e7TlPkwxwRkRB2d3cH12TBS2DMYNrJN8mldZ8mi5Q0qY5E7T9
         dP51D/6mry8p/dmhGMM9ZZ8vJyXacVbZjKnz/TZJZjmoGJIV3JxMLi1i8HHBVG9vkjkf
         0+GF4VlH4gzBxiBp7+gDx5cTT/CikO7OIEVyGT/cbnUSidVOFwftNtfVpDvfPw/WFEC9
         89hl0+bXrLt4RM3J1raQa7eyVgFExvfu2PCOuNstf1xCCaCRDdvMOM/beQPSNI3/TdTr
         Z9/y+zV5ECQsrJovwUT5hbcy53Y3t/PC6Cxbzh4nqWEX4Lfk0/ddvqt6wJbTlH2cGIMi
         DFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727137; x=1785331937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bT2vr2pGofjO6HVhs1OsOpxbY7HDW5tNstjVsp6JA8A=;
        b=CakjyNnM2LM//MVKUyQJGcfr8KBr+G9MzX/+29k0gX7wQrwF9YWGcYdcO9S3JuJvkh
         Q6/QL/dNPHh1DJY+HUhf3fdYE15I8lZkm2vT2rzg27uHUmVDMyHTR69PW17GXF2npiFN
         wTE2mwBEmuajidD2s5wQb9boA5/Bd47AgfIaHet4qNOSmMgJABLL6TrU6moEtoSpVPEf
         aIufCbswCD/2se4UvUPKVc8IqxzpeZ/QyxG5VtP09aeGR5iESR+lqOA1Cd8NQZL32iML
         x47/cQoGGABmP3zJ+1wW9brNHSokkQmd/pGYkl3vcnBhfNgza/pRf82Q8NMbRev/a/EC
         OMpw==
X-Forwarded-Encrypted: i=1; AHgh+RrRXnheoTYXRwyyZIGZB3LixeaVpG5arj36UYmPys5aYpedpNfDoBGAspaL9gFrzKbnDwX7kkZwPu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3XfdT+pfWCmuL7sbG/M+miIvN/upas9x2Jr2nWYjFFm3WL5w3
	D27veYHfuFb5khHSqSIPZ/bHPqOGDhMqogCMUgnQ7B4frY0R9h7yaY/UYULjQrGvq8HR59ruz+5
	OQ5ZV0cvQKPUemu/ir0UD9yaOpGaSBK4=
X-Gm-Gg: AR+sD13NVibi2DumPfjCedUKWXRbzkqAWuqYccU5nBsgabXWZ3Ftx5evmJ6Lp0bBM77
	KBj0GZvTDF4ESPDcjY8UpYfR+EOUJ3ZghiRaUVT+XsNQGxnUqm1R0PhbOd+pRB9+I27+mZ/mMRi
	UcGJ/nub4/S9mRINjwsHdwVQV06Da7ga7tagFLo9KxgDpIi253ma6B4s/HpZBP9SRCxNfsnqznM
	WJlxaPy5d5eKSmikXDbyrOzSGfbD9Pv8/B0ihXm6SRp5APGzBCFNwxLSg9KC0pOmK+kpUw11aDf
	3/PRcb338UhSbE4KcD2+ZY8gLkZ3cvJzA8ZbS8srxipt
X-Received: by 2002:a05:651c:505:b0:39c:67c4:4eb0 with SMTP id
 38308e7fff4ca-39eeb84d79fmr8806641fa.8.1784727136403; Wed, 22 Jul 2026
 06:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-2-chenyou910331@gmail.com> <amCDyEKqNzkjgu-H@wyuan.org>
In-Reply-To: <amCDyEKqNzkjgu-H@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 22 Jul 2026 21:32:05 +0800
X-Gm-Features: AUfX_mxkBPq7QpIOVp80_QmHYVGjIk44qSHuPZOOr7Eh04Dezo7qQE9pYVP8-tQ
Message-ID: <CAKspUhJH=3jn8LKqB2gNC1ajJ8V4g1avvH6tWewhvu7ojcfjBw@mail.gmail.com>
Subject: Re: [PATCH 01/16] docs/zh_TW: process: localize terminology in 7.AdvancedTopics.rst
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMDE6NTY6NDZQTSArMDgwMCwgV2VpamllIFl1YW4gd3Jv
dGU6DQo+ICLlhY3otLnnmoRCaXRLZWVwZXLmm7/ku6Plk4EiIHNob3VsZCBiZSAi6Ieq55Sx55qE
Qml0S2VlcGVy5pu/5Luj5ZOBIg0KPiBUaGUgdGV4dCBhYm92ZSBpcyBhYm91dCBwcm9wcmlldGFy
eSDkuJPmnInnmoQv5bCI5pyJ55qELCBzbyBoZXJlIHNob3VsZCBiZQ0KPiDoh6rnlLHnmoQuDQoN
Ckdvb2QgY2F0Y2gsIHlvdSBhcmUgcmlnaHQgLS0gdGhlIHNlbnRlbmNlIGNvbnRyYXN0cyB3aXRo
IHRoZQ0KcHJvcHJpZXRhcnkgQml0a2VlcGVyLCBzbyB0aGlzIGlzIGZyZWUtYXMtaW4tZnJlZWRv
bSBhbmQgc2hvdWxkIGJlDQroh6rnlLHnmoQsIG5vdCDlhY3osrvnmoQuIEkgbWFkZSB0aGlzIGNv
cnJlY3Rpb24gaW4gMS5JbnRybyAo5YWN6LS56L2v5Lu2IOKGkg0K6Ieq55Sx6Luf6auUKSBidXQg
bWlzc2VkIHRoaXMgaW5zdGFuY2UgaW4gNy5BZHZhbmNlZFRvcGljcy4gSSB3aWxsIGZpeCBpdA0K
aW4gdjIsIGFuZCBjYW4gc2VuZCBhbiBpbmNyZW1lbnRhbCBwYXRjaCBmb3IgdGhlIHNhbWUgaXNz
dWUgaW4gemhfQ04NCmFmdGVyd2FyZHMgYXMgeW91IHN1Z2dlc3RlZC4NCg0KPiBTaG91bGQgd2Ug
d3JhcCBsaW5lcyBlYXJsaWVyIHRocm91Z2hvdXQgdGhlIHNlcmllcz8NCg0KRmFpciBwb2ludC4g
U29tZSBUYWl3YW5lc2UgdGVybXMgYXJlIG9uZSBjaGFyYWN0ZXIgbG9uZ2VyIHRoYW4gdGhlaXIN
CnpoX0NOIGNvdW50ZXJwYXJ0cyAo56iL5byP56K8IHZzIOS7o+eivCwg5L2/55So6ICFIHZzIOeU
qOaItiksIHNvIGEgZmV3IGxpbmVzDQpncmV3IHBhc3QgYSBjb21mb3J0YWJsZSB3aWR0aCB3aXRo
b3V0IGJlaW5nIHJlZmxvd2VkLiBJIHdpbGwgcmVmbG93IHRoZQ0KYWZmZWN0ZWQgcGFyYWdyYXBo
cyBpbiB2MiBmb2xsb3dpbmcgdGhlIHpoX0NOIGhvdy10byB5b3UgbGlua2VkLCBhbmQNCnRoZSBs
b25nIGxpY2Vuc2UtcnVsZXMgbGluZXMgeW91IHBvaW50ZWQgb3V0IG9uIDA0LzE2IHdpbGwgYmUg
d3JhcHBlZA0KaW4gdGhlIHNhbWUgcGFzcy4NCg0KVG8ga2VlcCB0aGlzIHJldmlld2FibGUsIEkg
cGxhbiB0byBjb2xsZWN0IGV2ZXJ5b25lJ3MgY29tbWVudHMgZmlyc3QNCmFuZCB0aGVuIHNlbmQg
YSBzaW5nbGUgdjIgYWRkcmVzc2luZyB0aGVtIHRvZ2V0aGVyLCByYXRoZXIgdGhhbg0KcmVzcGlu
bmluZyBwZXIgY29tbWVudC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3b3VsZCBwcmVmZXIN
Cm90aGVyd2lzZS4NCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgY2FyZWZ1bCByZXZpZXcuDQoNCkNo
ZW4tWXUNCg0KV2VpamllIFl1YW4gPHd5QHd5dWFuLm9yZz4g5pa8IDIwMjblubQ35pyIMjLml6Xp
gLHkuIkg5LiL5Y2INDo0OOWvq+mBk++8mg0KPg0KPiBPbiBXZWQsIEp1bCAyMiwgMjAyNiBhdCAw
NTo1NToyN0FNICswODAwLCBDaGVuLVl1IFllaCB3cm90ZToNCj4gPiAg5a+p6Zax6KOc5LiBDQo+
ID4gIC0tLS0tLS0tDQo+ID4NCj4gPiAt5LiA5Lqb6K6A6ICF6aGv54S25pyD5Y+N5bCN5bCH5pys
56+A6IiH4oCc6auY57Sa5Li76aGM4oCd5pS+5Zyo5LiA6LW377yM5Zug54iy5Y2z5L2/5piv5Ymb
6ZaL5aeL55qE5YWn5qC46ZaL55m85Lq65ZOhDQo+ID4gLeS5n+aHieipsuWvqemWseijnOS4geOA
gueVtueEtu+8jOaykuacieavlOafpeeci+WFtuS7luS6uueZvOS9iOeahOS7o+eivOabtOWlveea
hOaWueazleS+huWtuOe/kuWmguS9leWcqOWFp+aguOeSsOWigw0KPiA+IC3kuK3nt6jnqIvkuobj
gILmraTlpJbvvIzlr6nplrHogIXmsLjpgaDkvpvkuI3mh4nmsYLvvJvpgJrpgY7lr6nplrHku6Pn
orzvvIzmgqjlj6/ku6XlsI3mlbTlgIvmtYHnqIvlgZrlh7rph43lpKfosqLnjbvjgIINCj4gPiAr
5LiA5Lqb6K6A6ICF6aGv54S25pyD5Y+N5bCN5bCH5pys56+A6IiH4oCc6YCy6ZqO5Li76aGM4oCd
5pS+5Zyo5LiA6LW377yM5Zug54K65Y2z5L2/5piv5Ymb6ZaL5aeL55qE5qC45b+D6ZaL55m85Lq6
5ZOhDQo+ID4gK+S5n+aHieipsuWvqemWseijnOS4geOAgueVtueEtu+8jOaykuacieavlOafpeec
i+WFtuS7luS6uueZvOW4g+eahOeoi+W8j+eivOabtOWlveeahOaWueazleS+huWtuOe/kuWmguS9
leWcqOaguOW/g+eSsOWigw0KPiA+ICvkuK3mkrDlr6vnqIvlvI/kuobjgILmraTlpJbvvIzlr6np
lrHogIXmsLjpgaDkvpvkuI3mh4nmsYLvvJvpgI/pgY7lr6nplrHnqIvlvI/norzvvIzmgqjlj6/k
u6XlsI3mlbTlgIvmtYHnqIvlgZrlh7rph43lpKfosqLnjbvjgIINCj4gPg0KPiA+IC3lr6nmn6Xk
u6Pnorzlj6/og73mmK/kuIDlia/ku6TkurrnlJ/nlY/nmoTlnJbmma/vvIznibnliKXmmK/lsI3k
uIDlgIvmlrDnmoTlhafmoLjplovnmbzkurrlk6HkvoboqqrvvIzku5blgJENCj4gPiAt5Y+v6IO9
5pyD5bCN5YWs6ZaL6Kmi5ZWP5Luj56K85oSf5Yiw57eK5by177yM6ICM6YCZ5Lqb5Luj56K85piv
55Sx6YKj5Lqb5pyJ5pu05aSa57aT6amX55qE5Lq655m85L2I55qE44CC5LiN6YGO77yMDQo+ID4g
LeWNs+S9v+aYr+acgOaciee2k+mpl+eahOmWi+eZvOS6uuWToee3qOWvq+eahOS7o+eivOS5n+WP
r+S7peW+l+WIsOaUuemAsuOAguS5n+ioseWwje+8iOaJgOacie+8ieWvqemWseiAheacgOWlvQ0K
PiA+ICvlr6nmn6XnqIvlvI/norzlj6/og73mmK/kuIDlia/ku6TkurrnlJ/nlY/nmoTlnJbmma/v
vIznibnliKXmmK/lsI3kuIDlgIvmlrDnmoTmoLjlv4Pplovnmbzkurrlk6HkvoboqqrvvIzku5bl
gJENCj4gPiAr5Y+v6IO95pyD5bCN5YWs6ZaL6Kmi5ZWP56iL5byP56K85oSf5Yiw57eK5by177yM
6ICM6YCZ5Lqb56iL5byP56K85piv55Sx6YKj5Lqb5pyJ5pu05aSa57aT6amX55qE5Lq655m85biD
55qE44CC5LiN6YGO77yMDQo+ID4gK+WNs+S9v+aYr+acgOaciee2k+mpl+eahOmWi+eZvOS6uuWT
oee3qOWvq+eahOeoi+W8j+eivOS5n+WPr+S7peW+l+WIsOaUuemAsuOAguS5n+ioseWwje+8iOaJ
gOacie+8ieWvqemWseiAheacgOWlvQ0KPiA+ICDnmoTlu7rorbDmmK/vvJrmiorlr6nplrHoqZXo
q5bnlbbmiJDllY/poYzogIzkuI3mmK/mibnoqZXjgILoqaLllY/igJzlnKjpgJnmop3ot6/lvpHk
uK3lpoLkvZXph4vmlL7pjpbvvJ/igJ0NCj4gPiAt57i95piv5q+U6Kqq4oCc6YCZ6KOP55qE6Y6W
5piv6Yyv6Kqk55qE4oCd5pu05aW944CCDQo+ID4gK+e4veaYr+avlOiqquKAnOmAmeijoeeahOmO
luaYr+mMr+iqpOeahOKAneabtOWlveOAgg0KPiA+DQo+ID4gLeS4jeWQjOeahOmWi+eZvOS6uuWT
oeWwh+W+nuS4jeWQjOeahOinkuW6puWvqeafpeS7o+eivOOAgumDqOWIhuS6uuacg+S4u+imgemX
nOazqOS7o+eivOmiqOagvOS7peWPiuS7o+eivOihjOaYrw0KPiA+IC3lkKbmnInlsL7pmqjnqbrm
oLzjgILlhbbku5bkurrmnIPkuLvopoHpl5zms6joo5zkuIHkvZzniLLkuIDlgIvmlbTpq5Tlr6bn
j77nmoTorormm7TmmK/lkKblsI3lhafmoLjmnInlpb3omZXjgIINCj4gPiAt5ZCM5pmC5Lmf5pyJ
5Lq65pyD5qqi5p+l5piv5ZCm5a2Y5Zyo6Y6W5ZWP6aGM44CB5aCG5qOn5L2/55So6YGO5bqm44CB
5Y+v6IO955qE5a6J5YWo5ZWP6aGM44CB5Zyo5YW25LuW5Zyw5pa5DQo+ID4gLeeZvOePvueahOS7
o+eivOmHjeikh+OAgei2s+WkoOeahOaWh+aqlOOAgeWwjeaAp+iDveeahOS4jeWIqeW9semfv+OA
geeUqOaItuepuumWk0FCSeabtOaUueetieOAguaJgOaciemhnuWeiw0KPiA+IC3nmoTmqqLmn6Xv
vIzlj6ropoHlroPlgJHog73lvJXlsI7mm7Tlpb3nmoTku6PnorzpgLLlhaXlhafmoLjvvIzpg73m
mK/lj5fmraHov47lkozlgLzlvpfnmoTjgIINCj4gPiAr5LiN5ZCM55qE6ZaL55m85Lq65ZOh5bCH
5b6e5LiN5ZCM55qE6KeS5bqm5a+p5p+l56iL5byP56K844CC6YOo5YiG5Lq65pyD5Li76KaB6Zec
5rOo56iL5byP56K86aKo5qC85Lul5Y+K56iL5byP56K86KGM5pivDQo+ID4gK+WQpuacieWwvuma
qOepuuagvOOAguWFtuS7luS6uuacg+S4u+imgemXnOazqOijnOS4geS9nOeCuuS4gOWAi+aVtOmr
lOWvpuS9nOeahOiuiuabtOaYr+WQpuWwjeaguOW/g+acieWlveiZleOAgg0KPiA+ICvlkIzmmYLk
uZ/mnInkurrmnIPmqqLmn6XmmK/lkKblrZjlnKjpjpbllY/poYzjgIHloIbnlorkvb/nlKjpgY7l
uqbjgIHlj6/og73nmoTlronlhajllY/poYzjgIHlnKjlhbbku5blnLDmlrkNCj4gPiAr55m854++
55qE56iL5byP56K86YeN6KSH44CB6Laz5aSg55qE5paH5Lu244CB5bCN5pWI6IO955qE5LiN5Yip
5b2x6Z+/44CB5L2/55So6ICF56m66ZaTQUJJ5pu05pS5562J44CC5omA5pyJ6aGe5Z6LDQo+ID4g
K+eahOaqouafpe+8jOWPquimgeWug+WAkeiDveW8leWwjuabtOWlveeahOeoi+W8j+eivOmAsuWF
peaguOW/g++8jOmDveaYr+WPl+atoei/juWSjOWAvOW+l+eahOOAgg0KPg0KPiBTaG91bGQgd2Ug
d3JhcCBsaW5lcyBlYXJsaWVyIHRocm91Z2hvdXQgdGhlIHNlcmllcz8gQWZ0ZXIgdGhlIGNlcnRh
aW4NCj4gdGVybWlub2xvZ3kgd2FzIGNoYW5nZWQsIG1hbnkgbGluZXMgYmVjYW1lIGxvbmdlciBi
dXQgd2VyZSBub3QgcmVmbG93ZWQuDQo+DQo+IEp1c3QgYSB0aG91Z2h0LiBJJ2FtIGFsc28gZmlu
ZSB3aXRoIGN1cnJlbnQgY2hhbmdlcy4NCj4NCj4gVGhhbmtzLg0KPg0KPiBTZWU6DQo+DQo+ICAg
aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvdHJhbnNsYXRpb25zL3poX0NOL2hvdy10by5odG1sI2lk
OQ0KPiAgIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8u
aHRtbCNpZDEwDQo=
