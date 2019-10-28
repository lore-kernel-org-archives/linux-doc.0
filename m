Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 74A7E7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 17:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404062AbfJ1RMW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 13:12:22 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:40433 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404040AbfJ1RMV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 13:12:21 -0400
Received: by mail-wm1-f43.google.com with SMTP id w9so9969672wmm.5
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PVf7tLvi5pLlzJNkKC8ltzpnNQQW8fojjp0tRpN8SEM=;
        b=evuMLcwSpHZaFuAFEW9T9wmvrpHi+GEktbD3dTUm10B9Di+RjMNNSP+PuKsprX8xui
         Zq7VbUMhf0g4eNeMsimNR62WUym1RTmzN402HnBA4CZISiziy+tegVpM39Hm7mumiT2E
         y6sCQVzc+qbANFEEkgdmHHazKfxwInJm6kgoQRxK08FHSZy1PHo47Tol1JWvw/qIQUUn
         +pMAAg+9jraCOLjUOOAd328Yuv+F6mcudRN0PKCU39HaU5WVqkKfKCVV9jXJvj8FbeEi
         zeObHB2xfWRgdPPLnKDwlq+IRGRPK0zZ8iyywTQhYcJFjHRN0+jBL8o4Ld6pNefCzdIO
         R8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PVf7tLvi5pLlzJNkKC8ltzpnNQQW8fojjp0tRpN8SEM=;
        b=dJX1jxdYXGoNk42xJmYQeF9y829zIVqx4sYwPKtizTGKYKkn1xOqnJ+WjLg3lv16RM
         DKwgGGW0WBxkmIeCrEcjXlsOFonM7aGx8LwDBYH4OKPD4w1XCZbadtMOj+rVufbaPT17
         W+28MbH7j9kp8fF1RUD2jf7Ub2H9zLrrEA5hV914afhcfYX54PThDrXDU+Ym7zUeterh
         QpVzSVwdRT3vWpqwiC8+KWVUWRiNAwIorjQWBZSHSnyrjGzl7/Ocyuzd6eBAjFNA+GYC
         sLjEx/33xe1drUs5xLBviGHmr+s0FhX7VhKCfEcrB2ejXajqZ4u7q35zLUrpcjW9UisH
         8pMw==
X-Gm-Message-State: APjAAAUTeBQXi0zcYEBZVZ89MmPWU0SNxxiYTd0UqBjd37gst1PU5mQ1
        guc7KpGnUk0mzzIPhoh7zGjTAOcT5tJ5JV+ZvE+lXNZZQ4g=
X-Google-Smtp-Source: APXvYqzaN46um20/mtmYq0idKzUwphjQGtEOaHDXqMqFmfs0vjOwSRBm+U7JkS9OPp5wP3OB1Hs1iJL5ttOzltOTDBU=
X-Received: by 2002:a1c:411:: with SMTP id 17mr292230wme.122.1572282738415;
 Mon, 28 Oct 2019 10:12:18 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= 
        <hector.oron@gmail.com>
Date:   Mon, 28 Oct 2019 18:12:07 +0100
Message-ID: <CAODfWeEohxJYW1w9g5u8G7RV+OKDqycWw0uEEqRoTQCVvfvKjw@mail.gmail.com>
Subject: [PATCH] doc: fix warnings for unused files in toctree
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>
Content-Type: multipart/mixed; boundary="0000000000001c34610595fb9afa"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--0000000000001c34610595fb9afa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

  Find patch attached to fix some warnings about unused files in
toctree and unexistent files, listed in toctrees.

Regards
--=20
 H=C3=A9ctor Or=C3=B3n  -.. . -... .. .- -.   -.. . ...- . .-.. --- .--. . =
.-.

--0000000000001c34610595fb9afa
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-doc-fix-warnings-for-unused-files-in-toctree.patch"
Content-Disposition: attachment; 
	filename="0001-doc-fix-warnings-for-unused-files-in-toctree.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2aojbc20>
X-Attachment-Id: f_k2aojbc20

RnJvbSA5Y2YwMzM4MDMzNjE4M2VhZDY2NTYxMWI2MWY0YTM2YzAxYzRkYzc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/SD1DMz1BOWN0b3I9MjBPcj1DMz1CM249MjBN
YXJ0PUMzPUFEbmV6Pz0KIDxoZWN0b3Iub3JvbkBnbWFpbC5jb20+CkRhdGU6IE1vbiwgMjggT2N0
IDIwMTkgMTc6NDk6MjEgKzAxMDAKU3ViamVjdDogW1BBVENIXSBkb2M6IGZpeCB3YXJuaW5ncyBm
b3IgdW51c2VkIGZpbGVzIGluIHRvY3RyZWUKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBl
OiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKClRoZXJlIGFyZSBhIGJ1bmNoIG9mIHdhcm5pbmdzIGZvciBtaXNzaW5nIGZpbGVzIGluIHRo
ZSB0b2N0cmVlLAphbmQgdGhlcmUgYXJlIGZpbGVzIHRoYXQgaGF2ZSBiZWVuIHJlbW92ZWQuCgpU
aGUgZm9sbG93aW5nIGNoYW5nZSBmaXggdGhvc2Ugd2FybmluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBI
w6ljdG9yIE9yw7NuIE1hcnTDrW5leiA8aGVjdG9yLm9yb25AZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9pbmRleC5yc3QgfCAxICsKIERvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QgICAgICAgICAgfCAxICsKIERvY3Vt
ZW50YXRpb24vbWlzYy1kZXZpY2VzL2luZGV4LnJzdCAgICAgICAgICAgICAgfCAxIC0KIERvY3Vt
ZW50YXRpb24vdXNiL2luZGV4LnJzdCAgICAgICAgICAgICAgICAgICAgICAgfCAyIC0tCiBEb2N1
bWVudGF0aW9uL3VzYi90ZXh0X2ZpbGVzLnJzdCAgICAgICAgICAgICAgICAgIHwgNiAtLS0tLS0K
IDUgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9pbmRleC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvaW5kZXgucnN0CmluZGV4
IGM3N2M1OGI4ZjY3Yi4uM2ZmNTY4ZDYwNzU5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2RldmljZS1tYXBwZXIvaW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYWRt
aW4tZ3VpZGUvZGV2aWNlLW1hcHBlci9pbmRleC5yc3QKQEAgLTE5LDYgKzE5LDcgQEAgRGV2aWNl
IE1hcHBlcgogICAgIGRtLXNlcnZpY2UtdGltZQogICAgIGRtLXVldmVudAogICAgIGRtLXpvbmVk
CisgICAgZG0tY2xvbmUKICAgICBlcmEKICAgICBrY29weWQKICAgICBsaW5lYXIKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3BlcmYvaW5kZXgucnN0CmluZGV4IGVlNGJmZDJhNzQwZi4uMGY0NTBh
MWY2NGM4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYvaW5kZXgu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QKQEAgLTE0
LDMgKzE0LDQgQEAgUGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CiAgICB4Z2VuZS1wbXUKICAg
IGFybV9kc3VfcG11CiAgICB0aHVuZGVyeDItcG11CisgICBpbXgtZGRyCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL21pc2MtZGV2aWNlcy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL21pc2Mt
ZGV2aWNlcy9pbmRleC5yc3QKaW5kZXggZjExYzVkYWVhZGE1Li5hNTdmOTJkZmU0OWEgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vbWlzYy1kZXZpY2VzL2luZGV4LnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL21pc2MtZGV2aWNlcy9pbmRleC5yc3QKQEAgLTIwLDQgKzIwLDMgQEAgZml0IGludG8g
b3RoZXIgY2F0ZWdvcmllcy4KICAgIGlzbDI5MDAzCiAgICBsaXMzbHYwMmQKICAgIG1heDY4NzUK
LSAgIHhpbGlueF9zZGZlYwpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2IvaW5kZXgucnN0
IGIvRG9jdW1lbnRhdGlvbi91c2IvaW5kZXgucnN0CmluZGV4IGU1NTM4NmE0YWJmYi4uMzZiNmVi
ZDlhOWQ5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3VzYi9pbmRleC5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi91c2IvaW5kZXgucnN0CkBAIC0yMiwxMSArMjIsOSBAQCBVU0Igc3VwcG9ydAog
ICAgIG1pc2NfdXNic2V2c2VnCiAgICAgbXRvdWNodXNiCiAgICAgb2hjaQotICAgIHJpbwogICAg
IHVzYmlwX3Byb3RvY29sCiAgICAgdXNibW9uCiAgICAgdXNiLXNlcmlhbAotICAgIHd1c2ItZGVz
aWduLW92ZXJ2aWV3CiAKICAgICB1c2ItaGVscAogICAgIHRleHRfZmlsZXMKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vdXNiL3RleHRfZmlsZXMucnN0IGIvRG9jdW1lbnRhdGlvbi91c2IvdGV4
dF9maWxlcy5yc3QKaW5kZXggNmE4ZDNmY2Y2NGI2Li4xYzE4YzA1YzM5MjAgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vdXNiL3RleHRfZmlsZXMucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdXNi
L3RleHRfZmlsZXMucnN0CkBAIC0xNiwxMiArMTYsNiBAQCBVU0IgZGV2ZnMgZHJvcCBwZXJtaXNz
aW9ucyBzb3VyY2UKIC4uIGxpdGVyYWxpbmNsdWRlOjogdXNiZGV2ZnMtZHJvcC1wZXJtaXNzaW9u
cy5jCiAgICAgOmxhbmd1YWdlOiBjCiAKLVdVU0IgY29tbWFuZCBsaW5lIHNjcmlwdCB0byBtYW5p
cHVsYXRlIGF1dGggY3JlZGVudGlhbHMKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLQotLi4gbGl0ZXJhbGluY2x1ZGU6OiB3dXNiLWNiYWYK
LSAgIDpsYW5ndWFnZTogc2hlbGwKLQogQ3JlZGl0cwogLS0tLS0tLQogCi0tIAoyLjIwLjEKCg==
--0000000000001c34610595fb9afa--
