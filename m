Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AC79CF
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 04:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759378600; cv=none; b=Pe+RpvNOURMD8kLiBDnE67OrveOR0rjfDLZb/n/vIvWHy7noSGaqhBh5lY9jURCyr55IG/TwfQyUxem9ybxej9kW/vzoopHLUEJH+fUsb9kW1858OcTXyrjF5ervg3Q8iOhWD7spdToRkmMTH7IIlUdZXK09IRjA8XpS1w9+PVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759378600; c=relaxed/simple;
	bh=Pe/8ObN7qiufMm5HcULWtvwd8amkLJqnuUZAkQd5yZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+T+pytrWRp1XOYSIG2A9WYTkWA/h3FU6TDi7LHX5j0TvYdsHHhuZWRWMvXguNpxINFecbhW2nWk7V+rNpVN37w4sdtlhvUvwsNdVnF6iZMiLj7tCppr/8SybspcTWd7EkMDia0+DkiWJ92pH10a/l8L2TNhWdHEibVd/6RXnDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvTCnw9B; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvTCnw9B"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso208254241.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Oct 2025 21:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759378598; x=1759983398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=742HG6xqM5gMQxuQiisxFgtNoK/rJ5FGQXtW9bHZBh0=;
        b=KvTCnw9BeQLDaJkg5CnA8SX5A/qzT4hTrjrZ5f87Jqk1IoZpLi7e7R0qb+2Ab5RL8X
         dn+vnNelik8LzIoITsgDnK4XYkqmk8sGyKSouzRFLtHJw+fCpBGVPeMtenhKMAyHmYvp
         qB3HyKCplP6X74sZITYkR4Hdb1usj8Mm88AY8GfjXGbmIjvOmKKwtzw1020xMARwQzXG
         vBFpH5VX6ZiguxKWdMxLpaDyet93uHRWR9zoFGH2SqYFc1RJ4mUKSGPh5Q6USIkkpbL3
         D/Bf4cYoYG4uoT8suc5FlCi16WE28v3E9MQ3C1rLoTD34x3ALYlhHshzq+eoYI6elMrk
         dg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759378598; x=1759983398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=742HG6xqM5gMQxuQiisxFgtNoK/rJ5FGQXtW9bHZBh0=;
        b=iCFukGBL08dRd0inQ1SNbKiDcuT+PGdEsPr/b9bPfjo5ftYkCT/ZKpcWiSROGOfHDP
         p08a+KVjOyKNVs7D6BwPyODZKbRbk6Wi9bk2ImADWZVdTlf5x2zSVMiNwvRB+PRTlYkF
         0uSeheDrQOsm/mkUa2Bl/Jfr353AT18GWsBNP+h3ZF6apuIhdV5gBCURZLb35G0xmQe/
         Fiiq2bRuBvzZb+uT+Z5fUMVXGeXujBxtQ3gNik1ASsqR610RcSAQgtA3IoRUsYaFavcc
         IO/HyS4dB5xOkxusReF3xeUlyQvsAj+NH657GC5CzBDOoCNd6og8oZRP21OeVXIl2ER0
         KXWQ==
X-Gm-Message-State: AOJu0Yw56MwDtRpGU1jbxGH2HTALoaXZy5XMI3DgLTzX7zZIrvTY2+CQ
	RvvXphla6fIHZSIbx+/hChv1z9Pk7MvfG4j+GHTuEhlnMBVFcyzHiF/4+AYTqUkMfUWepE6+0Hp
	TAHmAUYTZ7gE9IKMvPZpt00t49loosoVXb+dCguk=
X-Gm-Gg: ASbGncsJQt/h1ajMILqCJicL6m6xSzeemqc4olCxHA4PF1wXI9VfWqCDrWgux8rCofL
	/l92zFJwXEeUc8ljpnKwtV0OCTACNxYaSBpky3nbgFnGT6KzRab2LpuDSXc13Ac8x2T9hkr7nbA
	3b2zjV6H95sEPc5gXb5aw7OHhe+fmLa31IjPjIRYuI4ynHAh26jc5nkaVg3EtL8qxAckV8p/nu1
	kMXgJtN1N42YQ/HPVi9Tmn7sJdZLRc=
X-Google-Smtp-Source: AGHT+IFqhSErIdP+4rr/KGFNAJeJmZ1qcF9ilHwBddi3N4IfemVoMGcwaU6b34lpAgrfoL8248OggHqQOYTF2igdxgI=
X-Received: by 2002:a05:6102:cc6:b0:54e:76ce:8fb5 with SMTP id
 ada2fe7eead31-5d3fe53587emr2201153137.9.1759378597772; Wed, 01 Oct 2025
 21:16:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
 <aN3RjymBjn_VfcLe@casper.infradead.org>
In-Reply-To: <aN3RjymBjn_VfcLe@casper.infradead.org>
From: Mr Tourist <zakiuddin321@gmail.com>
Date: Thu, 2 Oct 2025 09:46:26 +0530
X-Gm-Features: AS18NWAGAb9muAeCBX5jVLB8cnxydKkAdN3Im2j-Sn2IIfbYLjPE3XL-Kc5P4jM
Message-ID: <CAOXP31FT7cZ79gAH-yOb+E8UX5sNnztL_rwjn_x-aLHdefjk9Q@mail.gmail.com>
Subject: Re: [PATCH] docs: reorganize kernel documentation overview for clarity
To: Matthew Wilcox <willy@infradead.org>, rdunlap@infradead.org
Cc: linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000058a7010640254026"

--00000000000058a7010640254026
Content-Type: multipart/alternative; boundary="00000000000058a7000640254024"

--00000000000058a7000640254024
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review and comments provided Matthew and Randy,

I have addressed the comments shared and have attached the updated patch
over the email.

Message-ID: <20251002041325.6406-1-zakiuddin321@gmail.com>

On Thu, Oct 2, 2025 at 6:42=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:

> On Wed, Oct 01, 2025 at 04:50:52PM +0530, Mr Tourist wrote:
>
> ... you screwed up sending this, so I can't reply to it properly.
>
> But in general, Linux uses reStructuredText, not Markdown.
>

--00000000000058a7000640254024
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review and comments provided Matthew and Ra=
ndy,<div><br></div><div>I have addressed the comments shared and have attac=
hed the updated patch over the email.</div><div><br></div><div>Message-ID: =
&lt;<a href=3D"mailto:20251002041325.6406-1-zakiuddin321@gmail.com">2025100=
2041325.6406-1-zakiuddin321@gmail.com</a>&gt;</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Oct 2, 2025 at 6:42=E2=80=AFAM Matthew Wilcox &lt;<a href=3D"mailto:w=
illy@infradead.org">willy@infradead.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Wed, Oct 01, 2025 at 04:50:52PM +=
0530, Mr Tourist wrote:<br>
<br>
... you screwed up sending this, so I can&#39;t reply to it properly.<br>
<br>
But in general, Linux uses reStructuredText, not Markdown.<br>
</blockquote></div>

--00000000000058a7000640254024--
--00000000000058a7010640254026
Content-Type: application/octet-stream; 
	name="0001-docs-rename-README-to-README.rst-and-improve-structu.patch"
Content-Disposition: attachment; 
	filename="0001-docs-rename-README-to-README.rst-and-improve-structu.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mg8wkip70>
X-Attachment-Id: f_mg8wkip70

RnJvbSBmZDdkNDhjZmM4OWE3M2Y5NzIxYzhhMmY2OWI1MDljNGRlZDI5ZmFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNb2hhbW1lZCBaYWtpdWRkaW4gPHpha2l1ZGRpbjMyMUBnbWFp
bC5jb20+CkRhdGU6IFRodSwgMiBPY3QgMjAyNSAwNDowNzowNSArMDAwMApTdWJqZWN0OiBbUEFU
Q0hdIGRvY3M6IHJlbmFtZSBSRUFETUUgdG8gUkVBRE1FLnJzdCBhbmQgaW1wcm92ZSBzdHJ1Y3R1
cmUKClJlbmFtZWQgUkVBRE1FIHRvIFJFQURNRS5yc3QgdG8gZXhwbGljaXRseSBpbmRpY2F0ZSBp
dHMgcmVTdHJ1dHVyZWRUZXh0CmZvcm1hdCBhbmQgaW1wcm92ZSBpdHMgc3RydWN0dXJlLiBUaGlz
IGlzIGRvbmUgdG8gZm9sbG93IHRoZSBzYW1lIGZvcm1hdAphcyBwdXQgaW4gdGhlIGRvY3VtZW50
YXRpb24gZm9yIG90aGVyIHRoaW5ncy4KCkJlbG93IGFyZSB0aGUgY2hhbmdlcyBtYWRlOgotIFJl
bmFtZXMgUkVBRE1FIHRvIFJFQURNRS5yc3QgdG8gbWF0Y2ggdGhlIGFjdHVhbCBmb3JtYXQKLSBN
YWtlcyB0aGUgZmlsZSBmb3JtYXQgY2xlYXIgdG8gcmVhZGVycyBhbmQgZWRpdG9ycwotIEFsaWdu
cyB3aXRoIGRvY3VtZW50YXRpb24gc3RhbmRhcmRzIHdoZXJlIC5yc3QgZXh0ZW5zaW9uIGlzIHVz
ZWQgZm9yCiAgcmVTdHJ1Y3R1cmVkVGV4dCBmaWxlcyB0aHJvdWdob3V0IHRoZSBrZXJuZWwKLSBJ
bXByb3Z2ZXMgc3RydWN0dXJlIHdpdGggY2xlYXIgaGllcmFyY2hpY2FsIHNlY3Rpb25zCi0gT3Jn
YW5pemVzIGNvbnRlbnQgaW50byBsb2dpY2FsIGdyb3VwaW5ncwoKVGhlIC5yc3QgZXh0ZW5zaW9u
IGhlbHBzIHRvb2xzIGFuZCBlZGl0b3JzIHByb3ZpZGUgcHJvcGVyIHN5bnRheApoaWdobGlnaHRp
bmcgYW5kIGZvcm1hdHRpbmcgc3VwcG9ydCwgbWFraW5nIGl0IGVhc2llciB0byBwcmV2aWV3IHRo
ZQpjaGFuZ2VzLgoKU2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgWmFraXVkZGluIDx6YWtpdWRkaW4z
MjFAZ21haWwuY29tPgotLS0KIFJFQURNRS5tZCAgfCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBSRUFETUUucnN0IHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBSRUFETUUubWQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBSRUFETUUucnN0Cgpk
aWZmIC0tZ2l0IGEvUkVBRE1FLm1kIGIvUkVBRE1FLm1kCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCBhMmM5YjY5YjY3ZmQuLjAwMDAwMDAwMDAwMAotLS0gYS9SRUFETUUubWQKKysrIC9k
ZXYvbnVsbApAQCAtMSwyOCArMCwwIEBACi0jIExpbnV4IGtlcm5lbAotCi0jIyBEb2N1bWVudGF0
aW9uIE92ZXJ2aWV3Ci1UaGUgTGludXgga2VybmVsIGRvY3VtZW50YXRpb24gaXMgYXZhaWxhYmxl
IGluIG11bHRpcGxlIGZvcm1hdHMoSFRNTCwgUERGKSBhbmQgY29udGFpbnMgZXNzZW50YWlsIGd1
aWRlcyBmb3IgYm90aCBkZXZlbG9wZXJzIGFuZCB1c2Vycy4KLQotIyMgS2V5IERvY3VtZW50YXRp
b24KLQotIyMjIFByaW1hcnkgU3RhcnRpbmcgUG9pbnQKLS0gRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9SRUFETUUucnN0Ci0KLSMjIyBCdWlsZGluZyBEb2N1bWVudGF0aW9uCi0tIEZvciBIVE1M
OiBgbWFrZSBodG1sZG9jc2AKLS0gRm9yIFBERjogYG1ha2UgcGRmZG9jc2AKLQotIyMjIE9ubGlu
ZSBBY2Nlc3MKLS0gT2ZmaWNpYWwgZG9jdW1lbnRhdGlvbjogaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvCi0KLSMjIEltcG9ydGFudCBOb3RlcwotLSBEb2N1bWVudGF0aW9u
IGlzIHByaW1hcmlseSBsb2NhdGVkIGluIHRoZSBEb2N1bWVudGFpb24vIGRpcmVjdG9yeQotLSBN
YW51eSBmaWxlcyB1c2UgcmVTdHJ1Y3R1cmVkVGV4dCBmb3JtYXQKLS0gQmVmb3JlIGtlcm5lbCB1
cGdyYWRlcyBvciBidWlsZHMsIHJldmlldyBEb2N1bWVudGF0aW9uIC9wcm9jZXNzL2NoYW5nZXMu
cnN0IGZvcgotICAgICogQnVpbGQgUmVxdWlyZW1lbnRzCi0gICAgKiBSdW50aW1lIHJlcXVpcmVt
ZW50cwotICAgICogUG90ZW50aWFsIHVwZ3JhZGUgaXNzdWVzIGFuZCBzb2x1dGlvbnMgCi1UaGVy
ZSBhcmUgc2V2ZXJhbCBndWlkZXMgZm9yIGtlcm5lbCBkZXZlbG9wZXJzIGFuZCB1c2Vycy4gVGhl
c2UgZ3VpZGVzIGNhbgotYmUgcmVuZGVyZWQgaW4gYSBudW1iZXIgb2YgZm9ybWF0cywgbGlrZSBI
VE1MIGFuZCBQREYuIFBsZWFzZSByZWFkCi1Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL1JFQURN
RS5yc3QgZmlyc3QuCi0KZGlmZiAtLWdpdCBhL1JFQURNRS5yc3QgYi9SRUFETUUucnN0Cm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uN2NjNTk0ZDEzMzQ3Ci0tLSAvZGV2
L251bGwKKysrIGIvUkVBRE1FLnJzdApAQCAtMCwwICsxLDMxIEBACitMaW51eCBLZXJuZWwKKz09
PT09PT09PT09CisKK0RvY3VtZW50YXRpb24gT3ZlcnZpZXcKKy0tLS0tLS0tLS0tLS0tLS0tLS0t
CitUaGUgTGludXgga2VybmVsIGRvY3VtZW50YXRpb24gaXMgYXZhaWxhYmxlIGluIG11bHRpcGxl
IGZvcm1hdHMgKEhUTUwsIFBERikgYW5kIGNvbnRhaW5zIGVzc2VudGlhbCBndWlkZXMgZm9yIGJv
dGggZGV2ZWxvcGVycyBhbmQgdXNlcnMuCisKK0tleSBEb2N1bWVudGF0aW9uCistLS0tLS0tLS0t
LS0tLS0KKworUHJpbWFyeSBTdGFydGluZyBQb2ludAorfn5+fn5+fn5+fn5+fn5+fn5+fn4KKyog
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9SRUFETUUucnN0CisKK0J1aWxkaW5nIERvY3VtZW50
YXRpb24KK35+fn5+fn5+fn5+fn5+fn5+fn5+CisqIEZvciBIVE1MOiBgYG1ha2UgaHRtbGRvY3Ng
YAorKiBGb3IgUERGOiBgYG1ha2UgcGRmZG9jc2BgCisKK09ubGluZSBBY2Nlc3MKK35+fn5+fn5+
fn5+fgorKiBPZmZpY2lhbCBkb2N1bWVudGF0aW9uOiBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC8KKworSW1wb3J0YW50IE5vdGVzCistLS0tLS0tLS0tLS0tCisqIERvY3Vt
ZW50YXRpb24gaXMgcHJpbWFyaWx5IGxvY2F0ZWQgaW4gdGhlIERvY3VtZW50YXRpb24vIGRpcmVj
dG9yeQorKiBGaWxlcyB1c2UgcmVTdHJ1Y3R1cmVkVGV4dCBmb3JtYXQKKyogQmVmb3JlIGtlcm5l
bCB1cGdyYWRlcyBvciBidWlsZHMsIHJldmlldyBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY2hhbmdl
cy5yc3QgZm9yOgorICAgIC0gQnVpbGQgcmVxdWlyZW1lbnRzCisgICAgLSBSdW50aW1lIHJlcXVp
cmVtZW50cworICAgIC0gUG90ZW50aWFsIHVwZ3JhZGUgaXNzdWVzIGFuZCBzb2x1dGlvbnMKXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCi0tIAoyLjUwLjEKCg==
--00000000000058a7010640254026--
