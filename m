Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F5BC433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 12:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E636613CA
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 12:32:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344012AbhDFMcO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243177AbhDFMcN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 08:32:13 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB05C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 05:32:06 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id a8so14872423oic.11
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 05:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mOGYTloogX7Yy/qlD5Wx++js30ffTWh/96k1TeD3NDI=;
        b=U8QdFcZYCVqvdu3cWbGjh+mmGTTK3ZgoixxAlHl589sSrlTYc2auaiPUffXsfOW35c
         LN6PyTSTORbwTxGFi4T9/jlDeIsKKx0Bm+xuv2Hv/JOXNDhbdipCmfLOXJNnk6WLrzJw
         x1vTnVWekUHZHszzrlZxRtjD+sAr8Md3ieY/o8C5LzoPRqV4uPme+hAZFFAvR8CgI2FD
         wYQ9cYG7HgxTHJaPKbC82fvylB7++2puvpsMtRgsrCemtLqTJHYIKg0q0z0YLXUhrXCO
         TlzZGr2v4pm8fn/6WVHe5wthzU9b9USN6M8xpdX+Hd38FQQ9DsQdyLlbZry56w2m7HJe
         EiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mOGYTloogX7Yy/qlD5Wx++js30ffTWh/96k1TeD3NDI=;
        b=oV6SqJNWJTxt9Qq5FeSy8R9nTFXhL6yrbsoDj7BAhcHRJkl3CRRAczkpz9YpiBkUSK
         aMqWnKEhc3ClbSH4qMEZDIxlWKS0ZrriNwMTAnK8n07h9OUKxojFgjtUekt+89BGY5qi
         NjPGg/9FrPxGao8jQopQ+4lrOfCRcR7cNLrHHCxQufs05RgffCZqDnJcsKNwI1rYorpR
         5G7k/vEHt27y555dv2YyfX4CrYXW2NcX0pvC4tnJNDI23knD6452qciGRHYzTWNzlxNZ
         zwlkChPguum0oJMUV8NA2vrZsFDiE4QsC9G3neNt4L6EZgZ7PG5ZmwlRh9Eujz6Ug/Pn
         WBAA==
X-Gm-Message-State: AOAM533/cGdGw/UJFDcaJiWQC0WAcoFFquP4/MXFTc+gI3Nw+fuJ1oxr
        icHzvPTG9S3gG4sw+yoyJBr5+fgCMbUJuyocBa+GO3KXEfI=
X-Google-Smtp-Source: ABdhPJz6mT2L7jR6KUrOaYxO7Qkl+E8gQg+Qb5li+w9c6yMJSGfBW0A5pljJHr6E8MhYZqH9r6tbg89VYzWDhhMEkzA=
X-Received: by 2002:a54:4507:: with SMTP id l7mr3018654oil.165.1617712325776;
 Tue, 06 Apr 2021 05:32:05 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?St=C3=A9phane_Blondon?= <stephane.blondon@gmail.com>
Date:   Tue, 6 Apr 2021 14:31:50 +0200
Message-ID: <CAOy+up7EdTf4ouh5onVy_ZzXFWGBEP+P6CPqY-=E+1UFwCeq8w@mail.gmail.com>
Subject: Minor spellcheck in spi documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000087217705bf4d0092"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--00000000000087217705bf4d0092
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I attached a patch fixing the wrong spelling ('ciruit' to 'circuit').

I temporarily subscribed to the linux-doc mailing list if replies are neede=
d.

Regards,
--=20
St=C3=A9phane

--00000000000087217705bf4d0092
Content-Type: text/x-diff; charset="UTF-8"; name="spellcheck_spi_documentation.patch"
Content-Disposition: attachment; 
	filename="spellcheck_spi_documentation.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kn601wuj0>
X-Attachment-Id: f_kn601wuj0

RnJvbSAyMzNlMDBjMzQ3OTcwOWNjNTI0NDhiNTQxZDA3M2E1ZTRjODU2OGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/U3Q9QzM9QTlwaGFuZT0yMEJsb25kb24/PSA8
c3RlcGhhbmUuYmxvbmRvbkBnbWFpbC5jb20+CkRhdGU6IFR1ZSwgNiBBcHIgMjAyMSAxNDoxMjoy
MiArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIEZpeDogc3BlbGxjaGVjayAnY2lydWl0JyB0byAnY2ly
Y3VpdCcKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0
PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKClNpZ25lZC1vZmYtYnk6IFN0
w6lwaGFuZSBCbG9uZG9uIDxzdGVwaGFuZS5ibG9uZG9uQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVu
dGF0aW9uL3NwaS9idXR0ZXJmbHkucnN0IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9zcGkvYnV0
dGVyZmx5LnJzdCBiL0RvY3VtZW50YXRpb24vc3BpL2J1dHRlcmZseS5yc3QKaW5kZXggZTYxNGE1
ODk1NDdjLi41NjA4OGZiMDkwYzcgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vc3BpL2J1dHRl
cmZseS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9zcGkvYnV0dGVyZmx5LnJzdApAQCAtMTEsNyAr
MTEsNyBAQCBkZXZlbG9wIGZpcm13YXJlIGZvciB0aGlzLCBhbmQgZmxhc2ggaXQgdXNpbmcgdGhp
cyBhZGFwdGVyIGNhYmxlLgogCiBZb3UgY2FuIG1ha2UgdGhpcyBhZGFwdGVyIGZyb20gYW4gb2xk
IHByaW50ZXIgY2FibGUgYW5kIHNvbGRlciB0aGluZ3MKIGRpcmVjdGx5IHRvIHRoZSBCdXR0ZXJm
bHkuICBPciAoaWYgeW91IGhhdmUgdGhlIHBhcnRzIGFuZCBza2lsbHMpIHlvdQotY2FuIGNvbWUg
dXAgd2l0aCBzb21ldGhpbmcgZmFuY2llciwgcHJvdmlkaW5nIGNpcnVpdCBwcm90ZWN0aW9uIHRv
IHRoZQorY2FuIGNvbWUgdXAgd2l0aCBzb21ldGhpbmcgZmFuY2llciwgcHJvdmlkaW5nIGNpcmN1
aXQgcHJvdGVjdGlvbiB0byB0aGUKIEJ1dHRlcmZseSBhbmQgdGhlIHByaW50ZXIgcG9ydCwgb3Ig
d2l0aCBhIGJldHRlciBwb3dlciBzdXBwbHkgdGhhbiB0d28KIHNpZ25hbCBwaW5zIGZyb20gdGhl
IHByaW50ZXIgcG9ydC4gIE9yIGZvciB0aGF0IG1hdHRlciwgeW91IGNhbiB1c2UKIHNpbWlsYXIg
Y2FibGVzIHRvIHRhbGsgdG8gbWFueSBBVlIgYm9hcmRzLCBldmVuIGEgYnJlYWRib2FyZC4KLS0g
CjIuMjAuMQoK
--00000000000087217705bf4d0092--
