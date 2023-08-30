Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E324DC83F21
	for <linux-doc@archiver.kernel.org>; Wed, 30 Aug 2023 18:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238409AbjH3Shp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244371AbjH3NGA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Aug 2023 09:06:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C632185
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 06:05:33 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68bed286169so4720603b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Aug 2023 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1693400733; x=1694005533; darn=vger.kernel.org;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AuHbSOFTvqi/OHC2pMXhUQiesWAhfO/K/9P+//bPFUg=;
        b=LhAou4jea0x7J/vj7NCyJvNI4GhK7c3nOds7/dYxsUKo84EXHV/3HKdgz3wjepTaWL
         HK8OYEpLi7xpn3BlbXsXy4xnT0Z8YU+q4VTJqjy1otBtJLkhai1FUtxDKgnFysgViUQ+
         mh1GCaqTpNb3qMbWGGJzy0PciDE2vX/p4iMW/9aHDj0zxXtFOC8ZZKZfYDrUSXFZH6wM
         Iqf64uGy0qjI5I2Epu47fBcjIOQaXLZjSmJVtuWcTuyUWvbtuh1n94JgYPj+oRz/ZPBu
         Y/gjvnJI0866Q32N5JDwdUmOw1QpvXpCOWN5037HLMK90lCx0HoYiAuURshqu+Bvi6Qw
         qwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693400733; x=1694005533;
        h=in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuHbSOFTvqi/OHC2pMXhUQiesWAhfO/K/9P+//bPFUg=;
        b=ETz/DIuXkuHn9nkEYuxY9fzglHrhbhStSje35bpKqMAX7GZrumDRa3tDtoZSZkVxiF
         WpOdyGXYQr4+CXfDr1tZHsa3fZX5NkhpLFNy6w2T/l1hUVrJJ8ufWcYOAwqeC2OzBnJ2
         7XByZe342Dx882XkC2DON/umzeY/SeIb1xePui6CAtYdZ1m3dmscJEdYhvqTQuNO/mES
         I2m3JpYK2dV4CNV3kVicAAuDNOP9LckDLXSqtY+FD2HPsPNm2dLRb3D5YtNf0HTs+Cve
         O0yAOiY3tsj6mv9mst1WMAadqF9yubheW50LkyCN6Hs2Fd+8ljCCXNnZm+6GcvEmWNdW
         0HNg==
X-Gm-Message-State: AOJu0YwyRWtmMbt9uQjooW9LV75KHgTb9WXb8o/x1zljg55orQ6sN67e
        +jGHL3jNB+04KH+U5ONBDHxTog==
X-Google-Smtp-Source: AGHT+IHOlCMheE29etxNdfLTa0p9kkStvYGizf583zwnKOEZy1gdmtrymts1JN6BymfKY+O+N4WM7A==
X-Received: by 2002:a05:6a00:1342:b0:68a:45a1:c0ee with SMTP id k2-20020a056a00134200b0068a45a1c0eemr2497862pfu.15.1693400732856;
        Wed, 30 Aug 2023 06:05:32 -0700 (PDT)
Received: from [10.254.254.90] ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id j22-20020a62b616000000b006889664aa6csm10047615pff.5.2023.08.30.06.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 06:05:30 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------OVtgML5C81J3Y8tXZzsRAyY0"
Message-ID: <25696c65-f8a7-c2e2-81ea-955c280fd478@bytedance.com>
Date:   Wed, 30 Aug 2023 21:05:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 0/6] Introduce __mt_dup() to improve the performance of
 fork()
To:     Liam.Howlett@oracle.com, corbet@lwn.net, akpm@linux-foundation.org,
        willy@infradead.org, brauner@kernel.org, surenb@google.com,
        michael.christie@oracle.com, peterz@infradead.org,
        mathieu.desnoyers@efficios.com, npiggin@gmail.com, avagin@gmail.com
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20230830125654.21257-1-zhangpeng.00@bytedance.com>
From:   Peng Zhang <zhangpeng.00@bytedance.com>
In-Reply-To: <20230830125654.21257-1-zhangpeng.00@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a multi-part message in MIME format.
--------------OVtgML5C81J3Y8tXZzsRAyY0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

See the attachment for the slightly modified benchmark.
--------------OVtgML5C81J3Y8tXZzsRAyY0
Content-Type: text/plain; charset=UTF-8; name="spawn.c"
Content-Disposition: attachment; filename="spawn.c"
Content-Transfer-Encoding: base64

LyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioKICogIFRoZSBCWVRFIFVOSVggQmVuY2htYXJr
cyAtIFJlbGVhc2UgMwogKiAgICAgICAgICBNb2R1bGU6IHNwYXduLmMgICBTSUQ6IDMuMyA1
LzE1LzkxIDE5OjMwOjIwCiAqCiAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAqIEJ1ZyBy
ZXBvcnRzLCBwYXRjaGVzLCBjb21tZW50cywgc3VnZ2VzdGlvbnMgc2hvdWxkIGJlIHNlbnQg
dG86CiAqCiAqCUJlbiBTbWl0aCwgUmljayBHcmVoYW4gb3IgVG9tIFlhZ2VyYXQgQllURSBN
YWdhemluZQogKgliZW5AYnl0ZXBiLmJ5dGUuY29tICAgcmlja19nQGJ5dGVwYi5ieXRlLmNv
bSAgIHR5YWdlckBieXRlcGIuYnl0ZS5jb20KICoKICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioKICogIE1vZGlmaWNhdGlvbiBMb2c6CiAqICAkSGVhZGVyOiBzcGF3bi5jLHYgMy40IDg3
LzA2LzIyIDE0OjMyOjQ4IGtqbWNkb25lbGwgQmV0YSAkCiAqICBBdWd1c3QgMjksIDE5OTAg
LSBNb2RpZmllZCB0aW1pbmcgcm91dGluZXMgKHR5KQogKiAgT2N0b2JlciAyMiwgMTk5NyAt
IGNvZGUgY2xlYW51cCB0byByZW1vdmUgQU5TSSBDIGNvbXBpbGVyIHdhcm5pbmdzCiAqICAg
ICAgICAgICAgICAgICAgICAgQW5keSBLYWhuIDxrYWhuQHprMy5kZWMuY29tPgogKgogKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqLwpjaGFyIFNDQ1NpZFtdID0gIkAoIykgQCgjKXNwYXdu
LmM6My4zIC0tIDUvMTUvOTEgMTk6MzA6MjAiOwovKgogKiAgUHJvY2VzcyBjcmVhdGlvbgog
KgogKi8KCiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRl
IDxzaWduYWwuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8c3lzL3dhaXQuaD4K
I2luY2x1ZGUgPHN5cy9tbWFuLmg+Cgp2b2xhdGlsZSBpbnQgc3RvcDsKdW5zaWduZWQgbG9u
ZyBpdGVyOwoKdm9pZCB3YWtlX21lKGludCBzZWNvbmRzLCB2b2lkICgqZnVuYykoKSkKewoJ
Lyogc2V0IHVwIHRoZSBzaWduYWwgaGFuZGxlciAqLwoJc2lnbmFsKFNJR0FMUk0sIGZ1bmMp
OwoJLyogZ2V0IHRoZSBjbG9jayBydW5uaW5nICovCglhbGFybShzZWNvbmRzKTsKfQoKdm9p
ZCByZXBvcnQoKQp7CglmcHJpbnRmKHN0ZGVyciwiQ09VTlQ6ICVsdVxuIiwgaXRlcik7Cglp
dGVyID0gMDsKCXN0b3AgPSAxOwp9Cgp2b2lkIHNwYXduKCkKewoJaW50IHN0YXR1cywgc2xh
dmU7CgoJd2hpbGUgKCFzdG9wKSB7CgkJaWYgKChzbGF2ZSA9IGZvcmsoKSkgPT0gMCkgewoJ
CQkvKiBzbGF2ZSAuLiBib3JpbmcgKi8KCQkJZXhpdCgwKTsKCQl9IGVsc2UgaWYgKHNsYXZl
IDwgMCkgewoJCQkvKiB3b29wcyAuLi4gKi8KCQkJZnByaW50ZihzdGRlcnIsIkZvcmsgZmFp
bGVkIGF0IGl0ZXJhdGlvbiAlbHVcbiIsIGl0ZXIpOwoJCQlwZXJyb3IoIlJlYXNvbiIpOwoJ
CQlleGl0KDIpOwoJCX0gZWxzZQoJCQkvKiBtYXN0ZXIgKi8KCQkJd2FpdCgmc3RhdHVzKTsK
CQlpZiAoc3RhdHVzICE9IDApIHsKCQkJZnByaW50ZihzdGRlcnIsIkJhZCB3YWl0IHN0YXR1
czogMHgleFxuIiwgc3RhdHVzKTsKCQkJZXhpdCgyKTsKCQl9CgkJaXRlcisrOwoJfQp9Cgpp
bnQgbWFpbihpbnQgYXJnYywgY2hhcgkqYXJndltdKQp7CglpbnQgZHVyYXRpb24sIG5yX3Zt
YXMgPSAwOwoJc2l6ZV90IHNpemU7Cgl2b2lkICphZGRyOwoKCWlmIChhcmdjICE9IDIpIHsK
CQlmcHJpbnRmKHN0ZGVyciwiVXNhZ2U6ICVzIGR1cmF0aW9uIFxuIiwgYXJndlswXSk7CgkJ
ZXhpdCgxKTsKCX0KCWR1cmF0aW9uID0gYXRvaShhcmd2WzFdKTsKCglzaXplID0gMTAgKiBn
ZXRwYWdlc2l6ZSgpOwoJZm9yIChpbnQgaSA9IDA7IGkgPD0gNzAwMDsgKytpKSB7CgkJaWYg
KGkgPT0gbnJfdm1hcykgewoJCQlzdG9wID0gMDsKCQkJZnByaW50ZihzdGRlcnIsIlZNQXM6
ICVkXG4iLCBpKTsKCQkJd2FrZV9tZShkdXJhdGlvbiwgcmVwb3J0KTsKCQkJc3Bhd24oKTsK
CQkJaWYgKG5yX3ZtYXMgPT0gMCkKCQkJCW5yX3ZtYXMgPSAxMDA7CgkJCWVsc2UgbnJfdm1h
cyAqPSAyOwoJCX0KCQlhZGRyID0gbW1hcChOVUxMLCBzaXplLCBpICYgMSA/IFBST1RfUkVB
RCA6IFBST1RfV1JJVEUsCgkJCU1BUF9QUklWQVRFIHwgTUFQX0FOT05ZTU9VUywgLTEsIDAp
OwoKCQlpZiAoYWRkciA9PSBNQVBfRkFJTEVEKSB7CgkJCXBlcnJvcigibW1hcCIpOwoJCQll
eGl0KDIpOwoJCX0KCX0KfQo=

--------------OVtgML5C81J3Y8tXZzsRAyY0--
