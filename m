Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA929BDBF
	for <linux-doc@vger.kernel.org>; Wed,  1 Oct 2025 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759317667; cv=none; b=Eon1tISwckpDXCmB2VlA3lwkLX5+7xUfJbJYIhu67CmC3YJ7Cca4WaAiHzVmAbm7BWnVCHs7h+nkih7vuwiWHn7b4+o4n21SZDWuPrwSCngttKccGrkfcHRjrnk9/a2u9sDNGrg3GkGSeW9Ntak3fFDkfvj+9XLwkCm3cWsGR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759317667; c=relaxed/simple;
	bh=iDPAOHqTnPX2mxejTCD1O7zpb4EkZSoVRII/NCHvvcQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QfpEZj25aL7i8vhIWanvfIbKjKtXsJp/hnypNkjLkxqWzFq1acwCM/5mzg28AxgbVjANSnn4HuMn06GJd1MbWJFJh/nuFgOvZzOXtp7qrVCey7OvSrZ/UFT33sRMBIZ+vcvsb3wyPgrkB55mkoeB+TA/UNLn7loaujc6ajMfxMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZuU/6hE; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZuU/6hE"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9231a251c01so1650407241.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 04:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759317664; x=1759922464; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xR37YqUgKGGTRsY6kdNttuPPRZR7ErW4iWvRqpUWWlM=;
        b=bZuU/6hE9o+Yjw6GV/QJHjq0SH1S8SulcQa34+TYi0WA65qMRPSCWTBwujimJMvRws
         QsJpUcqViSoIj/v7hiCe1LP/xAtrZ3olggHymBrgHVxWcxog9kpW+RLoY0x2DES36pqz
         5BdcCKQOAbejh/yXMUpbqyu6hfaDkN5PtcaT7PwAzL2oOCZyApCPBN/WmDoAaLcOeMCr
         5kdCjiXE1vcZyOmzbUM1Piiv9TJD+moFGRONBLb6CMph79l+ctUaH29NwE353FGfX2iT
         3OIzzJbtLCfVujmTL8uofFnoOPjZ5YjFohSVh3f/MIL8ZDF7ih53ZVINphHTu5eQpf7f
         dGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759317664; x=1759922464;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xR37YqUgKGGTRsY6kdNttuPPRZR7ErW4iWvRqpUWWlM=;
        b=Ob36Mq4h57Hbikh3y7OuPD4s1IyzwWxiDB4++jJytAAUUrrv+TnLs37AvvfK47s/PS
         /VkhaYnHgZMmFmvD4WK4OBauh2GDobwnZQxxeNl/hnuwbGpADTmkgw9Ic58I5snWaoMb
         +16WHzIHHrglVYzYPqJwHg7chzJZ9GM3ZK0Nv/BACFeDFLHZXHgfgMR1viDl1OiVbmw3
         S9g52egHR0qpSpAedcebOiBTbP5XrSdHoQLxr363SxN1p+Vw9vdyO9JEucj1ttXBU9sk
         d+b0aH5toR36nSp13qXT+cYWpU3AE4XEMTUwqaV7x8SY1Z3h9bRNEV7bLqxdQwSo/nHx
         8LdA==
X-Gm-Message-State: AOJu0YxKLhzTc87cGTqzmXi/DbLmmosyZRIOeBle01Sh7viRgC239kGM
	g7ZZ8zWw+gZgTHqfvNFQEaJdWRYIbifvPbcZP6OZxsVNOPhItDjzsbBlYWoATs1jvfMnxIGeVgD
	Q3G50dEoM4WNARDYDqcTQeuAShUKjjkG0/ZHIHls=
X-Gm-Gg: ASbGncvLH8Vzi5cHU2x2st/iVfWB7RudtuCLspQMBX1eBl79QnwqY3aUmipi7DOv4Lu
	+8haCsGSI36mieIBOrWZYv3ywW71UjP0WNuneK4SmuGzjeSX87h3wtBejbYlW0G+MJYMnxR4f0a
	ZCzohAMSlaMgoflJmcrggRTt8tA7rdLZMIPYfVMDD+Af6WDu+7FVBX/I/BKx/RSY2wjBLtbSnoy
	jdExmp6iWoMXhqHg/YumwhBZUJCCsM=
X-Google-Smtp-Source: AGHT+IE3OOcRCgFcEkSa8qBiUCg07s8CZpVsZCIoj/KRk/vPi2rLn76pnfnBj+oYmvB9En5ihIdohg+xca7kIpyTndI=
X-Received: by 2002:a05:6122:1309:b0:54b:bf2f:bcd7 with SMTP id
 71dfb90a1353d-5522d36af40mr1013365e0c.11.1759317664537; Wed, 01 Oct 2025
 04:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mr Tourist <zakiuddin321@gmail.com>
Date: Wed, 1 Oct 2025 16:50:52 +0530
X-Gm-Features: AS18NWBdVOgc-ZAtjTWohuyaTHDcE4cJpBQeC3nNAQV1y2jK0C27Jo6SLVNTGew
Message-ID: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
Subject: [PATCH] docs: reorganize kernel documentation overview for clarity
To: linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000071446806401710df"

--00000000000071446806401710df
Content-Type: multipart/alternative; boundary="00000000000071446706401710dd"

--00000000000071446706401710dd
Content-Type: text/plain; charset="UTF-8"

Date: Wed,  1 Oct 2025 11:18:07 +0000
Message-ID: <20251001111807.7900-1-zakiuddin321@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    The Cc list above has been expanded by additional
    addresses found in the patch commit message. By default
    send-email prompts before sending whenever this occurs.
    This behavior is controlled by the sendemail.confirm
    configuration setting.

    For additional information, run 'git send-email --help'.
    To retain the current behavior, but squelch this message,
    run 'git config --global sendemail.confirm auto'.

--00000000000071446706401710dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Date: Wed, =C2=A01 Oct 2025 11:18:07 +0000<br>Message-ID: =
&lt;<a href=3D"mailto:20251001111807.7900-1-zakiuddin321@gmail.com">2025100=
1111807.7900-1-zakiuddin321@gmail.com</a>&gt;<br>X-Mailer: git-send-email 2=
.50.1<br>MIME-Version: 1.0<br>Content-Transfer-Encoding: 8bit<br><br>=C2=A0=
 =C2=A0 The Cc list above has been expanded by additional<br>=C2=A0 =C2=A0 =
addresses found in the patch commit message. By default<br>=C2=A0 =C2=A0 se=
nd-email prompts before sending whenever this occurs.<br>=C2=A0 =C2=A0 This=
 behavior is controlled by the sendemail.confirm<br>=C2=A0 =C2=A0 configura=
tion setting.<br><br>=C2=A0 =C2=A0 For additional information, run &#39;git=
 send-email --help&#39;.<br>=C2=A0 =C2=A0 To retain the current behavior, b=
ut squelch this message,<br>=C2=A0 =C2=A0 run &#39;git config --global send=
email.confirm auto&#39;.</div>

--00000000000071446706401710dd--
--00000000000071446806401710df
Content-Type: application/octet-stream; 
	name="0001-docs-reorganize-kernel-documentation-overview-for-cl.patch"
Content-Disposition: attachment; 
	filename="0001-docs-reorganize-kernel-documentation-overview-for-cl.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mg7waqji0>
X-Attachment-Id: f_mg7waqji0

RnJvbSBhM2QxYWIzM2NjMzE2NjAwNmZjNTUzYTFkYTMyZTFlOWNiNjVhMmU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb2hhbW1lZCBaYWtpdWRkaW4gPHpha2l1ZGRpbjMyMUBnbWFp
bC5jb20+CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMTowOToxNCArMDAwMApTdWJqZWN0OiBbUEFU
Q0hdIGRvY3M6IHJlb3JnYW5pemUga2VybmVsIGRvY3VtZW50YXRpb24gb3ZlcnZpZXcgZm9yIGNs
YXJpdHkKClJlc3RydWN0dXJlIHRoZSBrZXJuZWwgZG9jdW1lbnRhdGlvbiBvdmVydmlldyB0byBp
bXByb3ZlIHJlYWRhYmlsaXR5IGFuZAphY2Nlc3NpYmlsaXR5LiBDaGFuZ2VzIGluY2x1ZGU6Cgot
IEFkZCBjbGVhciBoaWVyYXJjaGljYWwgc2VjdGlvbnMgd2l0aCBkZXNjcmlwdGl2ZSBoZWFkZXJz
Ci0gT3JnYW5pemVkIGNvbnRlbnQgaW50byBsb2dpY2FsIGdyb3VwaW5ncwotIEltcHJvdmUgZm9y
bWF0dGluZyBmb3IgYmV0dGVyIHZpc3VhbCBzY2FubmluZwotIE1haW50YWluIGFsbCBleGlzdGlu
ZyBpbmZvcm1hdGlvbiB3aGlsZSBwcmVzZW50aW5nIGl0IG1vcmUKICBzeXN0ZW1hdGljYWxseQoK
VGhlIHJldmlzZWQgc3RydWN0dXJlIGhlbHBzIG5ldyB1c2VycyBhbmQgZGV2ZWxvcGVycyB0byBu
YXZpZ2F0ZSB0aGUKa2VybmVsIGRvY3VtZW50YXRpb24gc3lzdGVtIGluIGEgYmV0dGVyIHdheQoK
U2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgWmFraXVkZGluIDx6YWtpdWRkaW4zMjFAZ21haWwuY29t
PgotLS0KIFJFQURNRSAgICB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQogUkVBRE1FLm1kIHwgMjgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspLCAxOCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBSRUFETUUKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBSRUFETUUubWQKCmRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGZkOTAzNjQ1ZTZkZS4uMDAwMDAwMDAwMDAwCi0t
LSBhL1JFQURNRQorKysgL2Rldi9udWxsCkBAIC0xLDE4ICswLDAgQEAKLUxpbnV4IGtlcm5lbAot
PT09PT09PT09PT09Ci0KLVRoZXJlIGFyZSBzZXZlcmFsIGd1aWRlcyBmb3Iga2VybmVsIGRldmVs
b3BlcnMgYW5kIHVzZXJzLiBUaGVzZSBndWlkZXMgY2FuCi1iZSByZW5kZXJlZCBpbiBhIG51bWJl
ciBvZiBmb3JtYXRzLCBsaWtlIEhUTUwgYW5kIFBERi4gUGxlYXNlIHJlYWQKLURvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUvUkVBRE1FLnJzdCBmaXJzdC4KLQotSW4gb3JkZXIgdG8gYnVpbGQgdGhl
IGRvY3VtZW50YXRpb24sIHVzZSBgYG1ha2UgaHRtbGRvY3NgYCBvcgotYGBtYWtlIHBkZmRvY3Ng
YC4gIFRoZSBmb3JtYXR0ZWQgZG9jdW1lbnRhdGlvbiBjYW4gYWxzbyBiZSByZWFkIG9ubGluZSBh
dDoKLQotICAgIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0LwotCi1UaGVy
ZSBhcmUgdmFyaW91cyB0ZXh0IGZpbGVzIGluIHRoZSBEb2N1bWVudGF0aW9uLyBzdWJkaXJlY3Rv
cnksCi1zZXZlcmFsIG9mIHRoZW0gdXNpbmcgdGhlIHJlU3RydWN0dXJlZFRleHQgbWFya3VwIG5v
dGF0aW9uLgotCi1QbGVhc2UgcmVhZCB0aGUgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NoYW5nZXMu
cnN0IGZpbGUsIGFzIGl0IGNvbnRhaW5zIHRoZQotcmVxdWlyZW1lbnRzIGZvciBidWlsZGluZyBh
bmQgcnVubmluZyB0aGUga2VybmVsLCBhbmQgaW5mb3JtYXRpb24gYWJvdXQKLXRoZSBwcm9ibGVt
cyB3aGljaCBtYXkgcmVzdWx0IGJ5IHVwZ3JhZGluZyB5b3VyIGtlcm5lbC4KZGlmZiAtLWdpdCBh
L1JFQURNRS5tZCBiL1JFQURNRS5tZApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLmEyYzliNjliNjdmZAotLS0gL2Rldi9udWxsCisrKyBiL1JFQURNRS5tZApAQCAtMCww
ICsxLDI4IEBACisjIExpbnV4IGtlcm5lbAorCisjIyBEb2N1bWVudGF0aW9uIE92ZXJ2aWV3CitU
aGUgTGludXgga2VybmVsIGRvY3VtZW50YXRpb24gaXMgYXZhaWxhYmxlIGluIG11bHRpcGxlIGZv
cm1hdHMoSFRNTCwgUERGKSBhbmQgY29udGFpbnMgZXNzZW50YWlsIGd1aWRlcyBmb3IgYm90aCBk
ZXZlbG9wZXJzIGFuZCB1c2Vycy4KKworIyMgS2V5IERvY3VtZW50YXRpb24KKworIyMjIFByaW1h
cnkgU3RhcnRpbmcgUG9pbnQKKy0gRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9SRUFETUUucnN0
CisKKyMjIyBCdWlsZGluZyBEb2N1bWVudGF0aW9uCistIEZvciBIVE1MOiBgbWFrZSBodG1sZG9j
c2AKKy0gRm9yIFBERjogYG1ha2UgcGRmZG9jc2AKKworIyMjIE9ubGluZSBBY2Nlc3MKKy0gT2Zm
aWNpYWwgZG9jdW1lbnRhdGlvbjogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvCisKKyMjIEltcG9ydGFudCBOb3RlcworLSBEb2N1bWVudGF0aW9uIGlzIHByaW1hcmlseSBs
b2NhdGVkIGluIHRoZSBEb2N1bWVudGFpb24vIGRpcmVjdG9yeQorLSBNYW51eSBmaWxlcyB1c2Ug
cmVTdHJ1Y3R1cmVkVGV4dCBmb3JtYXQKKy0gQmVmb3JlIGtlcm5lbCB1cGdyYWRlcyBvciBidWls
ZHMsIHJldmlldyBEb2N1bWVudGF0aW9uIC9wcm9jZXNzL2NoYW5nZXMucnN0IGZvcgorICAgICog
QnVpbGQgUmVxdWlyZW1lbnRzCisgICAgKiBSdW50aW1lIHJlcXVpcmVtZW50cworICAgICogUG90
ZW50aWFsIHVwZ3JhZGUgaXNzdWVzIGFuZCBzb2x1dGlvbnMgCitUaGVyZSBhcmUgc2V2ZXJhbCBn
dWlkZXMgZm9yIGtlcm5lbCBkZXZlbG9wZXJzIGFuZCB1c2Vycy4gVGhlc2UgZ3VpZGVzIGNhbgor
YmUgcmVuZGVyZWQgaW4gYSBudW1iZXIgb2YgZm9ybWF0cywgbGlrZSBIVE1MIGFuZCBQREYuIFBs
ZWFzZSByZWFkCitEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL1JFQURNRS5yc3QgZmlyc3QuCisK
LS0gCjIuNTAuMQoK
--00000000000071446806401710df--
