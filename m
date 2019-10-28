Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 073977D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 17:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731915AbfJ1R0Y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 13:26:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40010 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731902AbfJ1R0Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 13:26:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id o28so10774021wro.7
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsxDBESrwWHwyM1DCATrB1UFDRDfNhtm7Mjrlgu4k7M=;
        b=jqLCX2XbQZcjGdp44fzhRkfZ8j64gc3PbrSeddnCwY5DTfFITJRz1j1M+ZBPlyUA+u
         k341/Eso+RKdt2Ag9s03kJwXUjGoaU4ZMcVtarl6VbEvvF7HfZFS4ZdbG/3RpJxVjVrW
         HvFwRAqDCu6zcTwvahmPB89Qzyc6pBZ+dFfa/F5Ikn/wQtqQUxoqWUmHxpgcgP8mTcsf
         IznNKUzXUVwiy8GJtEGDQ5AjhcsB3+BRtdgRcK8fez7hN85MU9CJ25XSIo4nw1hoiTTm
         KOrlL9VfyGRmxi3odu/xd+LdHCfJvMlFj+tQ/50PoW+Dwek610BiOrsA/s7msnqkXYAN
         OQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsxDBESrwWHwyM1DCATrB1UFDRDfNhtm7Mjrlgu4k7M=;
        b=FAMswqiRUeAvjN7wWs+PKT693UWyWZGI0axRXcqCQDaNgFsmyroUa1+5BaXJLFq8HF
         9cZ6NGw4T3C28AMZ+/Anq2mv0QET/zGbu+fZjBAhq15QLaPbwETXcV7wo9qk98GJmlwI
         M5jFBHFToW7GYuC3Sf29HL8ZKwZqRV3yflpnM6PzstAZTY3RFMCPQ2Ys3hVpghTOKxEj
         tyCjr7TkXKAydIe83i3/o4QXKhvVvYQpTvTKrzk5m9ifGnz3QnBYun2i7sz3wm2HriUk
         FhQabsBZJwpAUtPwzMyK1t7bgMgIl3YCZhCkbh7JEA5JX12GK5GfGv6CqOkYKw/atBl5
         Cs1g==
X-Gm-Message-State: APjAAAUL+4AdQ0IBZ7meZOo0xzfgv6rp4RUsCmfiJfmNcxj2Vl1IumEv
        V5+GTd861JbJ320wK9QMgZSGiZ7R05ZoEx3atkoejWzi
X-Google-Smtp-Source: APXvYqzTX2FQ05PWF54+JFdIZSpNQOePU0aZ3NHBjzPzhKIWkWrTRt0NWeFDg0ngiRxe/VYKAzyYgVBQ5DHked/EefE=
X-Received: by 2002:adf:f746:: with SMTP id z6mr15264958wrp.238.1572283580779;
 Mon, 28 Oct 2019 10:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAODfWeEohxJYW1w9g5u8G7RV+OKDqycWw0uEEqRoTQCVvfvKjw@mail.gmail.com>
In-Reply-To: <CAODfWeEohxJYW1w9g5u8G7RV+OKDqycWw0uEEqRoTQCVvfvKjw@mail.gmail.com>
From:   =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= 
        <hector.oron@gmail.com>
Date:   Mon, 28 Oct 2019 18:26:09 +0100
Message-ID: <CAODfWeH67_ZfO7yrrQ+EcFgXd8stA23y6hUtimhzEbXvWmjhbw@mail.gmail.com>
Subject: Re: [PATCH] doc: fix warnings for unused files in toctree
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Content-Type: multipart/mixed; boundary="00000000000051b3730595fbcc5f"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--00000000000051b3730595fbcc5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

  I was planning to add more fixes in separated commit, but while
working on it, apparently it could be part of the previous commit.
  Apologies, find updated patch.

Missatge de H=C3=A9ctor Or=C3=B3n Mart=C3=ADnez <hector.oron@gmail.com> del=
 dia dl.,
28 d=E2=80=99oct. 2019 a les 18:12:
>
> Hello,
>
>   Find patch attached to fix some warnings about unused files in
> toctree and unexistent files, listed in toctrees.
>
> Regards
> --
>  H=C3=A9ctor Or=C3=B3n  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. =
. .-.



--=20
 H=C3=A9ctor Or=C3=B3n  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. . =
.-.

--00000000000051b3730595fbcc5f
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-doc-fix-warnings-for-unused-files-in-toctree.patch"
Content-Disposition: attachment; 
	filename="0001-doc-fix-warnings-for-unused-files-in-toctree.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2ap1gtm0>
X-Attachment-Id: f_k2ap1gtm0

RnJvbSA0YzEwZjI1NzRmZTEwZmQxOTc0OTFkMjRhNjQ5NDg0M2ViMTM2YzkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/SD1DMz1BOWN0b3I9MjBPcj1DMz1CM249MjBN
YXJ0PUMzPUFEbmV6Pz0KIDxoZWN0b3Iub3JvbkBnbWFpbC5jb20+CkRhdGU6IE1vbiwgMjggT2N0
IDIwMTkgMTc6NDk6MjEgKzAxMDAKU3ViamVjdDogW1BBVENIXSBkb2M6IGZpeCB3YXJuaW5ncyBm
b3IgdW51c2VkIGZpbGVzIGluIHRvY3RyZWUKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKClRoZXJlIGFyZSBhIGJ1bmNoIG9mIHdhcm5pbmdzIGZvciBtaXNzaW5nIGZpbGVzIGluIHRo
ZSB0b2N0cmVlLAphbmQgdGhlcmUgYXJlIGZpbGVzIHRoYXQgaGF2ZSBiZWVuIHJlbW92ZWQuCgpU
aGUgZm9sbG93aW5nIGNoYW5nZSBmaXggdGhvc2Ugd2FybmluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBI
w6ljdG9yIE9yw7NuIE1hcnTDrW5leiA8aGVjdG9yLm9yb25AZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9pbmRleC5yc3QgfCAgMSArCiBEb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYvaW5kZXgucnN0ICAgICAgICAgIHwgIDEgKwogRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0ICAgICAgICAgICAgICB8IDEyIC0tLS0t
LS0tLS0tLQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2luZGV4LnJzdCAgICAgICAgICAgICAg
ICB8ICAxIC0KIERvY3VtZW50YXRpb24vZ3B1L2k5MTUucnN0ICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgOSAtLS0tLS0tLS0KIERvY3VtZW50YXRpb24vbWlzYy1kZXZpY2VzL2luZGV4LnJzdCAg
ICAgICAgICAgICAgfCAgMSAtCiBEb2N1bWVudGF0aW9uL3VzYi9pbmRleC5yc3QgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgLS0KIERvY3VtZW50YXRpb24vdXNiL3RleHRfZmlsZXMucnN0ICAg
ICAgICAgICAgICAgICAgfCAgNiAtLS0tLS0KIDggZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAzMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2RldmljZS1tYXBwZXIvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9k
ZXZpY2UtbWFwcGVyL2luZGV4LnJzdAppbmRleCBjNzdjNThiOGY2N2IuLjNmZjU2OGQ2MDc1OSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyL2luZGV4
LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvaW5kZXgu
cnN0CkBAIC0xOSw2ICsxOSw3IEBAIERldmljZSBNYXBwZXIKICAgICBkbS1zZXJ2aWNlLXRpbWUK
ICAgICBkbS11ZXZlbnQKICAgICBkbS16b25lZAorICAgIGRtLWNsb25lCiAgICAgZXJhCiAgICAg
a2NvcHlkCiAgICAgbGluZWFyCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L3BlcmYvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9wZXJmL2luZGV4LnJz
dAppbmRleCBlZTRiZmQyYTc0MGYuLjBmNDUwYTFmNjRjOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9wZXJmL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL3BlcmYvaW5kZXgucnN0CkBAIC0xNCwzICsxNCw0IEBAIFBlcmZvcm1hbmNlIG1vbml0
b3Igc3VwcG9ydAogICAgeGdlbmUtcG11CiAgICBhcm1fZHN1X3BtdQogICAgdGh1bmRlcngyLXBt
dQorICAgaW14LWRkcgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1i
dWYucnN0IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0CmluZGV4IGI1NDFl
OTdjN2FiMS4uZDJmM2M5NWVhOWVkIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1h
cGkvZG1hLWJ1Zi5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RtYS1idWYucnN0
CkBAIC0xMTUsMTggKzExNSw2IEBAIEtlcm5lbCBGdW5jdGlvbnMgYW5kIFN0cnVjdHVyZXMgUmVm
ZXJlbmNlCiAuLiBrZXJuZWwtZG9jOjogaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKICAgIDppbnRl
cm5hbDoKIAotUmVzZXJ2YXRpb24gT2JqZWN0cwotLS0tLS0tLS0tLS0tLS0tLS0tLQotCi0uLiBr
ZXJuZWwtZG9jOjogZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKLSAgIDpkb2M6IFJlc2Vy
dmF0aW9uIE9iamVjdCBPdmVydmlldwotCi0uLiBrZXJuZWwtZG9jOjogZHJpdmVycy9kbWEtYnVm
L3Jlc2VydmF0aW9uLmMKLSAgIDpleHBvcnQ6Ci0KLS4uIGtlcm5lbC1kb2M6OiBpbmNsdWRlL2xp
bnV4L3Jlc2VydmF0aW9uLmgKLSAgIDppbnRlcm5hbDoKLQogRE1BIEZlbmNlcwogLS0tLS0tLS0t
LQogCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaW5kZXgucnN0IGIvRG9j
dW1lbnRhdGlvbi9kcml2ZXItYXBpL2luZGV4LnJzdAppbmRleCAzOGU2MzhhYmUzZWIuLjZkNDZj
ZWViNjJjNCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2luZGV4LnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvaW5kZXgucnN0CkBAIC05Myw3ICs5Myw2IEBA
IGF2YWlsYWJsZSBzdWJzZWN0aW9ucyBjYW4gYmUgc2VlbiBiZWxvdy4KICAgIHB3bQogICAgcmZr
aWxsCiAgICBzZXJpYWwvaW5kZXgKLSAgIHNnaS1pb2M0CiAgICBzbTUwMQogICAgc21zY19lY2Ux
MDk5CiAgICBzd2l0Y2h0ZWMKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2k5MTUucnN0
IGIvRG9jdW1lbnRhdGlvbi9ncHUvaTkxNS5yc3QKaW5kZXggMzQxNTI1NWFkM2RjLi43ZDFmNjU2
MTI4NTYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2k5MTUucnN0CisrKyBiL0RvY3Vt
ZW50YXRpb24vZ3B1L2k5MTUucnN0CkBAIC0zNTgsMTUgKzM1OCw2IEBAIEJhdGNoYnVmZmVyIFBh
cnNpbmcKIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2NtZF9wYXJz
ZXIuYwogICAgOmludGVybmFsOgogCi1CYXRjaGJ1ZmZlciBQb29scwotLS0tLS0tLS0tLS0tLS0t
LS0KLQotLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2JhdGNo
X3Bvb2wuYwotICAgOmRvYzogYmF0Y2ggcG9vbAotCi0uLiBrZXJuZWwtZG9jOjogZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9nZW1fYmF0Y2hfcG9vbC5jCi0gICA6aW50ZXJuYWw6Ci0KIFVzZXIg
QmF0Y2hidWZmZXIgRXhlY3V0aW9uCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL21pc2MtZGV2aWNlcy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0
aW9uL21pc2MtZGV2aWNlcy9pbmRleC5yc3QKaW5kZXggZjExYzVkYWVhZGE1Li5hNTdmOTJkZmU0
OWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vbWlzYy1kZXZpY2VzL2luZGV4LnJzdAorKysg
Yi9Eb2N1bWVudGF0aW9uL21pc2MtZGV2aWNlcy9pbmRleC5yc3QKQEAgLTIwLDQgKzIwLDMgQEAg
Zml0IGludG8gb3RoZXIgY2F0ZWdvcmllcy4KICAgIGlzbDI5MDAzCiAgICBsaXMzbHYwMmQKICAg
IG1heDY4NzUKLSAgIHhpbGlueF9zZGZlYwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Iv
aW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi91c2IvaW5kZXgucnN0CmluZGV4IGU1NTM4NmE0YWJm
Yi4uMzZiNmViZDlhOWQ5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3VzYi9pbmRleC5yc3QK
KysrIGIvRG9jdW1lbnRhdGlvbi91c2IvaW5kZXgucnN0CkBAIC0yMiwxMSArMjIsOSBAQCBVU0Ig
c3VwcG9ydAogICAgIG1pc2NfdXNic2V2c2VnCiAgICAgbXRvdWNodXNiCiAgICAgb2hjaQotICAg
IHJpbwogICAgIHVzYmlwX3Byb3RvY29sCiAgICAgdXNibW9uCiAgICAgdXNiLXNlcmlhbAotICAg
IHd1c2ItZGVzaWduLW92ZXJ2aWV3CiAKICAgICB1c2ItaGVscAogICAgIHRleHRfZmlsZXMKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdXNiL3RleHRfZmlsZXMucnN0IGIvRG9jdW1lbnRhdGlv
bi91c2IvdGV4dF9maWxlcy5yc3QKaW5kZXggNmE4ZDNmY2Y2NGI2Li4xYzE4YzA1YzM5MjAgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdXNiL3RleHRfZmlsZXMucnN0CisrKyBiL0RvY3VtZW50
YXRpb24vdXNiL3RleHRfZmlsZXMucnN0CkBAIC0xNiwxMiArMTYsNiBAQCBVU0IgZGV2ZnMgZHJv
cCBwZXJtaXNzaW9ucyBzb3VyY2UKIC4uIGxpdGVyYWxpbmNsdWRlOjogdXNiZGV2ZnMtZHJvcC1w
ZXJtaXNzaW9ucy5jCiAgICAgOmxhbmd1YWdlOiBjCiAKLVdVU0IgY29tbWFuZCBsaW5lIHNjcmlw
dCB0byBtYW5pcHVsYXRlIGF1dGggY3JlZGVudGlhbHMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLQotLi4gbGl0ZXJhbGluY2x1ZGU6OiB3
dXNiLWNiYWYKLSAgIDpsYW5ndWFnZTogc2hlbGwKLQogQ3JlZGl0cwogLS0tLS0tLQogCi0tIAoy
LjIwLjEKCg==
--00000000000051b3730595fbcc5f--
