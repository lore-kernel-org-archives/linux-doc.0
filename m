Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com [209.85.219.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A77CF03
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710850327; cv=none; b=Wxxkg8VSH9r0toWOgmbiQotfEi5wwpa9ANmekYt9BPeICQsRTap2hYPZEXPlgt11wSFcSYWkIHT6GuDA5spUrZ3ncplBKPgLbnUTWNiLGhlvooOxuS/Ga5yQpHCC3ICJMJvmsvmAcIfdEWswHejukMhYosO+XJ+WYeCy3F0iqpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710850327; c=relaxed/simple;
	bh=enoeM7wUY4dUK7VBh+IE4adS3Ns6ITTrSDN/UGl/dq0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZR1spotDBQun2iKHXvD6gjJy8xGk3gzDuXirjmXlhAaDrOBGBYaWfK3B1/WrIIXlVxZvKTmiUqr+57SSpgtJJQL5iBJ6z3CO2BOB8Qjiyn3zmsT0VBfHEgB31DjRgItMInyl03lQeYtz8vwaLJTxNeQALWCt2Mgj5klmOMr48k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ai6+qquJ; arc=none smtp.client-ip=209.85.219.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ai6+qquJ"
Received: by mail-yb1-f195.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5935684276.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710850325; x=1711455125; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mYWGnkrAuyj0XnqczZxylxTr4sJJDZYJs3UhpEvTAN8=;
        b=ai6+qquJz3zOdsYlTI07cNy6jHiBgAbSUcAaj88iM9XzxvTAg+zgHrFIhCOb8l8e+S
         At59L10ELuwFlrnyXjeOupHNaVJzjil056cUoV1lMRFZak1g6GMIXB4TnKx464soxZF7
         wSt42xl2fJoD2/LuO2Zo3JYuQ7hYJ6I7XG1pi4nEbi5vNOY2z1MrOCM/cKSDnT8Ku8tK
         297DWM27X1BTmS7HbXx7zN+to2U0N9ric0g1KctKIdAX26epaNxnUlpn1vwH4pfScBCA
         KRG/wxgDoo17PoZWtpWS/gX6xDqNZLjpLlsrDKSw0FYJCLRwRzE1vdfPnXBQVl6c8C9x
         pEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710850325; x=1711455125;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mYWGnkrAuyj0XnqczZxylxTr4sJJDZYJs3UhpEvTAN8=;
        b=AFXmiDo6M1z/CSVSYuyWA9Z/vlate9OcRp/4TSRBRFn6nuoN9J6ru/uGHRxYzhR7r4
         fu9WnmA7FyyI4N9vvt45Kry4uQ0eMM3/Xi6aRYGOUzatuhKEyS1R7VnmJhmaWZU3iw+/
         xOoin/wSq0mPWuwlq7qRblDf9pZ2WdmVELGobmhguln4/e2edbBYGJS3mhvRPgt7wmqQ
         fvDJGd/tOpdGcd7oLGZ2fZTeivY82ZQHW3SrK2LzhLe178jEXBE29dphj5h+UdGPb8dB
         syTZY0nY09t6AlKRYfz4IEkn7QbvhU3ycvhm7ZvIydrmMbdzFa1J+BdRPx2RNAhvTmNq
         p4WA==
X-Gm-Message-State: AOJu0Yzv8FCD6O9E6PDuDWq0HlZwrv3EZzjaqyplzuZvDz1kKqe+D1mc
	a/ju5TsavZIVKF7+kcLRZIgA8QDFMhgRP6nkxTL+q29t2mw90IYMQPfuHwkG8LiWUS/ECZGCzav
	MRPpUPbdRPzdlshIsqJFj8RYrGqnLdkPJT7T5zQ==
X-Google-Smtp-Source: AGHT+IGMVVCWHOo4OKPN609xKPyDGH82DCY6HAwr5AfkVVibk6QBW1pAy0xITyvQ7zID3iF35yHq/X6RdCpgkDVlnjU=
X-Received: by 2002:a05:6902:27c7:b0:dc6:ca3a:31da with SMTP id
 ec7-20020a05690227c700b00dc6ca3a31damr1370553ybb.16.1710850325192; Tue, 19
 Mar 2024 05:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linem Davton <linemdavton@gmail.com>
Date: Tue, 19 Mar 2024 13:11:54 +0100
Message-ID: <CAHAQYrN7_0+gi2p=fYPpHHMdOk2jwx9cX+nbovynphU8zSAZ5Q@mail.gmail.com>
Subject: Document Patch
To: linux-doc@vger.kernel.org
Cc: trivial@kernel.org
Content-Type: multipart/mixed; boundary="000000000000e5e489061402612c"

--000000000000e5e489061402612c
Content-Type: multipart/alternative; boundary="000000000000e5e486061402612a"

--000000000000e5e486061402612a
Content-Type: text/plain; charset="UTF-8"

Added mailing list link - https://subspace.kernel.org/lists.linux.dev.html

2. Process.rst lists - http://vger.kernel.org/vger-lists.html, but
the subscribe button on this uses older system i.e Majordomo.

Chapter 2 of "A guide to the Kernel Development Process" now has the
susbspace link mentioned above and users are encouraged to subscribe via
this link.

Utkarsh Raj
University Siegen

--000000000000e5e486061402612a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Added mailing list link -=C2=A0<a href=3D"https://sub=
space.kernel.org/lists.linux.dev.html">https://subspace.kernel.org/lists.li=
nux.dev.html</a></div><div>=C2=A0</div>2. Process.rst lists - <a href=3D"ht=
tp://vger.kernel.org/vger-lists.html">http://vger.kernel.org/vger-lists.htm=
l</a>, but the=C2=A0subscribe button on this uses older system i.e=C2=A0<sp=
an style=3D"color:rgb(206,200,188)">Majordomo.</span><div><span style=3D"co=
lor:rgb(206,200,188)"><br></span></div><div><font color=3D"#bcb5aa" style=
=3D"--darkreader-inline-color: #b8b2a6;">Chapter 2 of &quot;A guide to the =
Kernel Development Process&quot; now has the susbspace=C2=A0link mentioned =
above and users are encouraged to subscribe=C2=A0via this link.=C2=A0</font=
></div><div><font color=3D"#bcb5aa" style=3D"--darkreader-inline-color: #b8=
b2a6;"><br></font></div><div><font color=3D"#bcb5aa" style=3D"--darkreader-=
inline-color: #b8b2a6;">Utkarsh Raj</font></div><div><font color=3D"#bcb5aa=
" style=3D"--darkreader-inline-color: #b8b2a6;">University Siegen</font></d=
iv></div>

--000000000000e5e486061402612a--
--000000000000e5e489061402612c
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Added-the-the-suspace.kernel.org-link-to-join-mailin.patch"
Content-Disposition: attachment; 
	filename="0001-Added-the-the-suspace.kernel.org-link-to-join-mailin.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ltybsl1i0>
X-Attachment-Id: f_ltybsl1i0

RnJvbSBiY2Q3MzdmYzJiZjFkNjc4NTRhZDZjMjFhYTJhYzAxN2E1NDliYWM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW5lbSBEYXZ0b24gPGxpbmVtZGF2dG9uQGdtYWlsLmNvbT4K
RGF0ZTogVHVlLCAxOSBNYXIgMjAyNCAxMjo1MzowOSArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIEFk
ZGVkIHRoZSB0aGUgc3VzcGFjZS5rZXJuZWwub3JnIGxpbmsgdG8gam9pbiBtYWlsaW5nIGxpc3Qs
CiBvbGQgb25lIGRvZXMgbm90IGFsbG93IHRvIGpvaW4gbWFpbGluZyBsaXN0cyBhcyBpdCB1c2Vz
IE1ham9yZG9tbwoKU2lnbmVkLW9mZi1ieTogTGluZW0gRGF2dG9uIDxsaW5lbWRhdnRvbkBnbWFp
bC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9wcm9jZXNzLzIuUHJvY2Vzcy5yc3QgfCA1ICsrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9wcm9jZXNzLzIuUHJvY2Vzcy5yc3QgYi9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvMi5Qcm9j
ZXNzLnJzdAppbmRleCA2MTNhMDFkYTQ3MTcuLjhkOGZmZjgyNTU5MCAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9wcm9jZXNzLzIuUHJvY2Vzcy5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9wcm9j
ZXNzLzIuUHJvY2Vzcy5yc3QKQEAgLTM5Nyw2ICszOTcsMTEgQEAgYmUgZm91bmQgYXQ6CiAKIAlo
dHRwOi8vdmdlci5rZXJuZWwub3JnL3ZnZXItbGlzdHMuaHRtbAogCitUbyBzdWJzY3JpYmUgb3Ig
dW5zdWJzY3JpYmUgdG8gbGlzdHMsIHBsZWFzZSB2aXNpdDoKKworICBodHRwczovL3N1YnNwYWNl
Lmtlcm5lbC5vcmcvdmdlci5rZXJuZWwub3JnLmh0bWwKKworYW5kIHVzZSB0aGUgInN1Yi91bnN1
YiIgbGlua3MgbmV4dCB0byB0aGUgbGlzdCB5b3Ugd2FudC4KIFRoZXJlIGFyZSBsaXN0cyBob3N0
ZWQgZWxzZXdoZXJlLCB0aG91Z2g7IGEgbnVtYmVyIG9mIHRoZW0gYXJlIGF0CiByZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8uCiAKLS0gCjIuNDAuMQoK
--000000000000e5e489061402612c--
