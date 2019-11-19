Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42F587D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Nov 2019 18:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfKSSsO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Nov 2019 13:48:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38326 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfKSSsN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 13:48:13 -0500
Received: by mail-pf1-f195.google.com with SMTP id c13so12632248pfp.5
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 10:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=36jpGIQcZ4lU6TqRvBSPN3Oc7gVUnBFQ0lBJ+9WKKcg=;
        b=kCduduS8sUz7ZMjCUdC5gY5VD/uZm5eD+8jxwwMRL6DFz4MIafJkNv4XkD0U2xp20S
         ixo4VwHZtd76EFCFueeKOEIVmlVl5As75mVIQLGELq4LCap/sRuvvfgW2YYrLk9UArvI
         9OdAQgnqi5kYsmFXVB2E6b6NZU6KCSBNtzLNw5D+/rEkgOzgDQ7OefR+PCPXQVBDN3rp
         jVHpMuoRusV1L2X4KhI1ANNExs/nJG8rpdqMNI4wPDUywevajs1M4wQ+P+bxfiPggP/y
         eyVtu7WJHbSxbS09MX8/DvcOf2I51yTSrmKEhgGzN3mpKe4qjtUREEzdGFBDLV0iX5X0
         hktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=36jpGIQcZ4lU6TqRvBSPN3Oc7gVUnBFQ0lBJ+9WKKcg=;
        b=ihePmIogY6x1NhXvOeupCe/BL516/56NXVzM9Di4o8528qVdUGlZz+NZQ/LUSGMIuj
         iVDMMXHybKlSC3yVAIMK5Xu9Ui2wtqa1TUxQdsuQMWbyEl55mWV8uA0uSivERH1OdctY
         Og+TIt5OQWxUiKSCjyMgtaXyRUH/WC2WYjCyORVTkXaXl5l58vjpGpVPOconmjmPLtBd
         nej3CG2irh2xXoWTcFcRINMLCq3gmNgePI3LWfj70OgU1IoBgYSoLaaiintP08pJAab/
         Zdqc8+dYLw/OiuZeD4PRSeWWBHrtmPQm46Tnznn0FUDvqnAsuxnmocZrWKmVwgLCbgrW
         lAVA==
X-Gm-Message-State: APjAAAWgyMuYWNTKloo12A/XDDM+UAKwaptmoMoiInhSIfWWSVF9BQEX
        0oX2aaYsmS3RrcJy1L7trq6vFRgmGOCEgPALeg3QqA==
X-Google-Smtp-Source: APXvYqyO0WMb0y6EdLj/2mxu5pbnY05u1W4YT8PJ6G6+TwoxewCaTUmBLujPNM+Ngg6p0Nx1tBw0sbvWbk6Wp2rW+CA=
X-Received: by 2002:a63:712:: with SMTP id 18mr1286147pgh.384.1574189292526;
 Tue, 19 Nov 2019 10:48:12 -0800 (PST)
MIME-Version: 1.0
References: <1573812972-10529-1-git-send-email-alan.maguire@oracle.com> <1573812972-10529-3-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1573812972-10529-3-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 19 Nov 2019 10:48:01 -0800
Message-ID: <CAFd5g47f3-k+VxNRAJgfZ=Xr_bMD8huEkKj42U7ybMtb18pbSw@mail.gmail.com>
Subject: Re: [PATCH v4 linux-kselftest-test 2/6] kunit: hide unexported
 try-catch interface in try-catch-impl.h
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, schowdary@nvidia.com,
        urezki@gmail.com, andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>, adilger.kernel@dilger.ca,
        Luis Chamberlain <mcgrof@kernel.org>, changbin.du@intel.com,
        linux-ext4@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 15, 2019 at 2:17 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> Define function as static inline in try-catch-impl.h to allow it to
> be used in kunit itself and tests.  Also remove unused
> kunit_generic_try_catch
>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>

Aside from Stephen's comment, this looks good to me.
