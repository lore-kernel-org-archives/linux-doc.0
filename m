Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ECB097D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 23:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfE2XHI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 19:07:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36408 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfE2XHI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 19:07:08 -0400
Received: by mail-pl1-f195.google.com with SMTP id d21so1704764plr.3
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 16:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cHc2YTBvQPZwfTjTz43ky1S888tNMPBORRZD8lnR7YM=;
        b=X5qiSpfFhOhnN5GDVn1McWzB0dQzD5Qt2zEfLg5mazfaZ2rg9g4iTATjHySrV3yMhU
         GWQpD69Ef7loobz/h9NMEpLZgCf8MArR4F1Es7v7A2wheL3E1ZWNFP6xnkhXDlZ0ypCW
         6cRCmx2Zd2xEBox7PrtQJqzZYow9OkorDhbLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cHc2YTBvQPZwfTjTz43ky1S888tNMPBORRZD8lnR7YM=;
        b=eJHIv0kXa1V7l1nROM6eKkO9Hb62R4L5sAnZ12jW1E7McTVBxXE+SppCZxaLIgjCqt
         NW4syBfnlfBIBPkXQYWeBVj9N/OY5fIP3dkr3e6oMQXWNUECqG/DMUtU8DKD5ieCKJ2t
         uzTwmh5a/xHCHSHb5jEqEZ1zPzG6tG1Hfy8UpvZBqjXoqpm+laQFysmeZUklbwb9x/vn
         2n8Ylif0i4mlSu19/+TkiUMWM6P7edl1J9WzRHWbrSXXQr1hnw0NU08GfByDKux9MudW
         BpdQDrxDuix1r529+03UUQpiTzoySoygv2o52mN5mGgZY0GLD+c7OcYA25vqptdvcLMt
         XqJQ==
X-Gm-Message-State: APjAAAWuqCQ6ZZ4oyeKu4Szf732m439QUSmmeYcgZapPdxeJ7Msq0mOX
        SR0iKgLZC55mkUzWdIs366WmWw==
X-Google-Smtp-Source: APXvYqzpHemm5im64Z9RDUqEyfWlkHU/x2ydoNw5npFZRLwyAQPfRTCJd5MXKewYwSKw28FFh3MbGQ==
X-Received: by 2002:a17:902:6bcb:: with SMTP id m11mr503243plt.318.1559171227361;
        Wed, 29 May 2019 16:07:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p63sm735617pfb.70.2019.05.29.16.07.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 16:07:06 -0700 (PDT)
Date:   Wed, 29 May 2019 16:07:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Ke Wu <mikewu@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] Allow to exclude specific file types in LoadPin
Message-ID: <201905291602.D303FCD@keescook>
References: <20190529224350.6460-1-mikewu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529224350.6460-1-mikewu@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 29, 2019 at 03:43:50PM -0700, Ke Wu wrote:
> Linux kernel already provide MODULE_SIG and KEXEC_VERIFY_SIG to
> make sure loaded kernel module and kernel image are trusted. This
> patch adds a kernel command line option "loadpin.exclude" which
> allows to exclude specific file types from LoadPin. This is useful
> when people want to use different mechanisms to verify module and
> kernel image while still use LoadPin to protect the integrity of
> other files kernel loads.

Cool; I like this. A few thoughts below...

> 
> Signed-off-by: Ke Wu <mikewu@google.com>
> ---
>  Documentation/admin-guide/LSM/LoadPin.rst | 10 ++++++
>  security/loadpin/loadpin.c                | 37 +++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/Documentation/admin-guide/LSM/LoadPin.rst b/Documentation/admin-guide/LSM/LoadPin.rst
> index 32070762d24c..716ad9b23c9a 100644
> --- a/Documentation/admin-guide/LSM/LoadPin.rst
> +++ b/Documentation/admin-guide/LSM/LoadPin.rst
> @@ -19,3 +19,13 @@ block device backing the filesystem is not read-only, a sysctl is
>  created to toggle pinning: ``/proc/sys/kernel/loadpin/enabled``. (Having
>  a mutable filesystem means pinning is mutable too, but having the
>  sysctl allows for easy testing on systems with a mutable filesystem.)
> +
> +It's also possible to exclude specific file types from LoadPin using kernel
> +command line option "``loadpin.exclude``". By default, all files are
> +included, but they can be excluded using kernel command line option such
> +as "``loadpin.exclude=kernel-module,kexec-image``". This allows to use
> +different mechanisms such as ``CONFIG_MODULE_SIG`` and
> +``CONFIG_KEXEC_VERIFY_SIG`` to verify kernel module and kernel image while
> +still use LoadPin to protect the integrity of other files kernel loads. The
> +full list of valid file types can be found in ``kernel_read_file_str``
> +defined in ``include/linux/fs.h``.
> diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
> index 055fb0a64169..8ee0c58fea40 100644
> --- a/security/loadpin/loadpin.c
> +++ b/security/loadpin/loadpin.c
> @@ -45,6 +45,8 @@ static void report_load(const char *origin, struct file *file, char *operation)
>  }
>  
>  static int enforce = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENFORCE);
> +static char *exclude_read_files[READING_MAX_ID];
> +static int ignore_read_file_id[READING_MAX_ID];

Since this is set up at init, let's mark ignore_read_file_id with
__ro_after_init.

>  static struct super_block *pinned_root;
>  static DEFINE_SPINLOCK(pinned_root_spinlock);
>  
> @@ -129,6 +131,12 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
>  	struct super_block *load_root;
>  	const char *origin = kernel_read_file_id_str(id);
>  
> +	/* If the file id is excluded, ignore the pinning. */
> +	if ((unsigned int)id < READING_MAX_ID && ignore_read_file_id[id]) {

Can you use ARRAY_SIZE(ignore_read_file_id) here instead of
READING_MAX_ID?

> +		report_load(origin, file, "pinning-excluded");
> +		return 0;
> +	}
> +
>  	/* This handles the older init_module API that has a NULL file. */
>  	if (!file) {
>  		if (!enforce) {
> @@ -187,10 +195,37 @@ static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
>  	LSM_HOOK_INIT(kernel_load_data, loadpin_load_data),
>  };
>  
> +static void parse_exclude(void)

Please mark this __init (since it's called from another __init
function).

> +{
> +	int i, j;
> +	char *cur;
> +
> +	for (i = 0; i < ARRAY_SIZE(exclude_read_files); i++) {
> +		cur = exclude_read_files[i];
> +		if (!cur)
> +			break;
> +		if (*cur == '\0')
> +			continue;
> +
> +		for (j = 0; j < ARRAY_SIZE(kernel_read_file_str); j++) {
> +			if (strcmp(cur, kernel_read_file_str[j]) == 0) {
> +				pr_info("excluding: %s\n",
> +					kernel_read_file_str[j]);
> +				ignore_read_file_id[j] = 1;
> +				/*
> +				 * Can not break, because one read_file_str
> +				 * may map to more than on read_file_id.
> +				 */
> +			}
> +		}
> +	}
> +}
> +
>  static int __init loadpin_init(void)
>  {
>  	pr_info("ready to pin (currently %senforcing)\n",
>  		enforce ? "" : "not ");
> +	parse_exclude();
>  	security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
>  	return 0;
>  }
> @@ -203,3 +238,5 @@ DEFINE_LSM(loadpin) = {
>  /* Should not be mutable after boot, so not listed in sysfs (perm == 0). */
>  module_param(enforce, int, 0);
>  MODULE_PARM_DESC(enforce, "Enforce module/firmware pinning");
> +module_param_array_named(exclude, exclude_read_files, charp, NULL, 0);
> +MODULE_PARM_DESC(exclude, "Exclude pinning specific read file types");
> -- 
> 2.22.0.rc1.257.g3120a18244-goog
> 

Everything else looks good; thanks!

-- 
Kees Cook
