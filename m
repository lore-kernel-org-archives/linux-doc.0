Return-Path: <SRS0=OhIE=27=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47572C33CA4
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jan 2020 20:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D8932072E
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jan 2020 20:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="IRN7kK8/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgAJUQC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Jan 2020 15:16:02 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34821 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgAJUQC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jan 2020 15:16:02 -0500
Received: by mail-lj1-f193.google.com with SMTP id j1so3411696lja.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2020 12:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Y7VJYKufPHT51+LcE+o9ZubMKXtNPxL8Bk6TxqnxtA=;
        b=IRN7kK8/aR6m62cttmriRBSHWi4TnL7TMmZIZVy8WDR7tGiWLU7Vmt0nSJxJlB1cmO
         B9/898e4cb+ibhnAVaNq7C+XZq2Hukl1zkDSnmuldteBHI6Ts5V6cHIRLeaUxb+YEB05
         EROkxTOc7Oqa8Gr4HY7P2LWNamxk1cdTMzAqtMuVMrmIJyAvCAV1tmMXCaO5FE5i6Nzj
         LaOHIBAhcwjLPvUkpQe7QaCvdqrw2949Iblf0rA/YaibbtdMOtwNIYFomMRY0B6mZdf4
         ZhXAyti1o+pjP7DShR61QzaUvHP6E06G9r2dzef4w00mYtlkXQ8mqgGbivitK2fx51Nr
         xHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Y7VJYKufPHT51+LcE+o9ZubMKXtNPxL8Bk6TxqnxtA=;
        b=GZPC0HLOV0WcbrbTLna4hMeIYUfpVNLKLfKaoIf03RgM+YL6gDeZTWl2WcIaGXDzEy
         qAj318gWkYZsomFccW+ezDIw6Jvr/7A37wZbWFjPTUlEsgTI6y0AD9iZj+dlbICoHWWf
         HB/vUQLHK1UEt2iCFew+bOzKXvQQaRwnTw3JL+ghpQgg1YGY5nYm6kQRjawIV7+5w06D
         lfBcjzvNbqPyEaNrwo/C/gT65BCrgJnCIsJNUnL4+OjNFlnDL851Z1mMENZSv8gYOMs4
         MlQ0hIcdw1ZkWyPJZOf1/1otyeZClTtENxug7e9uT5WCa/ny9bWz/U8btJPQsrKtjgfg
         HVfg==
X-Gm-Message-State: APjAAAVes54OPHBUEgtqsnGeJuyc5oihNJbjSwIFduN1+ZTuT8zJNJIc
        8ryFerYYX5QOQyqyU8kANkNZGygrCNgSc405+T0p
X-Google-Smtp-Source: APXvYqz8N3ePo6USK9ErxBZ4MBadND0+Iln350LVgGwH2jSn5sjKgOWNFGrJfAIp2lZf4ACsrZ9J0sHZMgCbmbr7T9Q=
X-Received: by 2002:a2e:8152:: with SMTP id t18mr3597586ljg.255.1578687359033;
 Fri, 10 Jan 2020 12:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20200108162447.3347-1-sds@tycho.nsa.gov>
In-Reply-To: <20200108162447.3347-1-sds@tycho.nsa.gov>
From:   Paul Moore <paul@paul-moore.com>
Date:   Fri, 10 Jan 2020 15:15:48 -0500
Message-ID: <CAHC9VhQFQypUnRExSr62aaeW3hQ1iaAdwguwu67v_Lc84h=5rQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation,selinux: deprecate setting checkreqprot to 1
To:     Stephen Smalley <sds@tycho.nsa.gov>
Cc:     selinux@vger.kernel.org, omosnace@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 8, 2020 at 11:24 AM Stephen Smalley <sds@tycho.nsa.gov> wrote:
> Deprecate setting the SELinux checkreqprot tunable to 1 via kernel
> parameter or /sys/fs/selinux/checkreqprot.  Setting it to 0 is left
> intact for compatibility since Android and some Linux distributions
> do so for security and treat an inability to set it as a fatal error.
> Eventually setting it to 0 will become a no-op and the kernel will
> stop using checkreqprot's value internally altogether.
>
> checkreqprot was originally introduced as a compatibility mechanism
> for legacy userspace and the READ_IMPLIES_EXEC personality flag.
> However, if set to 1, it weakens security by allowing mappings to be
> made executable without authorization by policy.  The default value
> for the SECURITY_SELINUX_CHECKREQPROT_VALUE config option was changed
> from 1 to 0 in commit 2a35d196c160e3 ("selinux: change
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE default") and both Android
> and Linux distributions began explicitly setting
> /sys/fs/selinux/checkreqprot to 0 some time ago.
>
> Signed-off-by: Stephen Smalley <sds@tycho.nsa.gov>
> ---
>  .../ABI/obsolete/sysfs-selinux-checkreqprot   | 23 +++++++++++++++++++
>  .../admin-guide/kernel-parameters.txt         |  1 +
>  MAINTAINERS                                   |  1 +
>  security/selinux/Kconfig                      |  3 +++
>  security/selinux/hooks.c                      |  5 +++-
>  security/selinux/selinuxfs.c                  |  8 +++++++
>  6 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-selinux-checkreqprot

I think this looks fine, but considering this week was the first time
we really discussed this, let's hold off until after the next merge
window so we get a full cycle in linux-next for folks to complain :)

-- 
paul moore
www.paul-moore.com
