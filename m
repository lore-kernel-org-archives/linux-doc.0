Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 45E7E7D090
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 04:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbeJBL3A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 07:29:00 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:46545 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbeJBL27 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 07:28:59 -0400
Received: by mail-yb1-f194.google.com with SMTP id o8-v6so263455ybk.13
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 21:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Cpxv9Irzh5aDs0QGpKP7cNXs2u6/amX9TqmHjX6gKyU=;
        b=Q4hUwcKUWLe6OAegh5LekwopNJDP3KItLdEIlUooMI7FhelnmlTg0yAeXderwxn9Ru
         rOas1qDRMp+cjcnuplYzNeWaliK98coqpeWFmaXZDjxrhSbI5nW+lPrVu78OcE9B+pfq
         0EtjiyCbV8Ed5o7kYejZsaDides859g/5NDDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Cpxv9Irzh5aDs0QGpKP7cNXs2u6/amX9TqmHjX6gKyU=;
        b=NVxc8NTF2alnsBGtpGtCdVkPz5kKluK9tjByorTIdxs0S7GzbLnWas4edREmlFqVE/
         XG/ZW7tTeQYxVLX273HYHpLBl8+KEcAdfWvol6n1YAvW0XQTvzXVhp4Zaa421ODGpiXW
         H3c84M1i115Pu7t7Af9ZE6Agwp0v+sNBSPM5IN3kB1Ur+u8i1DSB+XmWnfnd0E471Uhj
         QjaXmilBsi+KHhG9l515HujZzL6hDM0F1JJRHgFoWWZICT4HfnVE7P6+2C+OjYHa2WaO
         ivQn1Ze77l2WGZojLgAUBPx4pkv/qNHTe1wTwGb224/Aj0J50+D8t6RtOb9xC0pPB5zO
         skaA==
X-Gm-Message-State: ABuFfogml+6LRtQ/FD+diVcBtrhzf9PRDNvKKavgqaogxsuLCjYGtavp
        L853TdXD2p/CXfkPTFbjGgX2W9fE7Os=
X-Google-Smtp-Source: ACcGV61LYEmR40NTk83CJHgH99sRgJkoXhtl7s1NWOhYLQtAG1dFd6UoxH9CzY/8A0F/7BFDsi0hgw==
X-Received: by 2002:a25:d302:: with SMTP id e2-v6mr7799420ybf.514.1538455662916;
        Mon, 01 Oct 2018 21:47:42 -0700 (PDT)
Received: from mail-yw1-f47.google.com (mail-yw1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 189-v6sm5626152ywf.4.2018.10.01.21.47.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Oct 2018 21:47:41 -0700 (PDT)
Received: by mail-yw1-f47.google.com with SMTP id q129-v6so263073ywg.8
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 21:47:40 -0700 (PDT)
X-Received: by 2002:a0d:fec6:: with SMTP id o189-v6mr7732638ywf.237.1538455660237;
 Mon, 01 Oct 2018 21:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d116:0:0:0:0:0 with HTTP; Mon, 1 Oct 2018 21:47:39 -0700 (PDT)
In-Reply-To: <0d76adea-93b9-9512-a57b-8605b7928bc2@infradead.org>
References: <20181002005505.6112-1-keescook@chromium.org> <20181002005505.6112-14-keescook@chromium.org>
 <0d76adea-93b9-9512-a57b-8605b7928bc2@infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 1 Oct 2018 21:47:39 -0700
X-Gmail-Original-Message-ID: <CAGXu5j+SwjKEFURa2ijYNkUYNj4jVd15QWj-u6cfpU-jVrjoew@mail.gmail.com>
Message-ID: <CAGXu5j+SwjKEFURa2ijYNkUYNj4jVd15QWj-u6cfpU-jVrjoew@mail.gmail.com>
Subject: Re: [PATCH security-next v4 13/32] LoadPin: Rename "enable" to "enforce"
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     James Morris <jmorris@namei.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 1, 2018 at 6:06 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 10/1/18 5:54 PM, Kees Cook wrote:
>> LoadPin's "enable" setting is really about enforcement, not whether
>> or not the LSM is using LSM hooks. Instead, split this out so that LSM
>> enabling can be logically distinct from whether enforcement is happening
>> (for example, the pinning happens when the LSM is enabled, but the pin
>> is only checked when "enforce" is set). This allows LoadPin to continue
>
> ISTB:             when "enforcing" is set).  ??

Whoops, thanks. And I need to do s/enable/enabled/ in the log. I'll fix this up.

-Kees

>
>> to operate sanely in test environments once LSM enable/disable is
>> centrally handled (i.e. we want LoadPin to be enabled separately from
>> its enforcement).
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
>> Reviewed-by: John Johansen <john.johansen@canonical.com>
>> ---
>>  security/loadpin/Kconfig   |  4 ++--
>>  security/loadpin/loadpin.c | 21 +++++++++++----------
>>  2 files changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/security/loadpin/Kconfig b/security/loadpin/Kconfig
>> index dd01aa91e521..8653608a3693 100644
>> --- a/security/loadpin/Kconfig
>> +++ b/security/loadpin/Kconfig
>> @@ -10,10 +10,10 @@ config SECURITY_LOADPIN
>>         have a root filesystem backed by a read-only device such as
>>         dm-verity or a CDROM.
>>
>> -config SECURITY_LOADPIN_ENABLED
>> +config SECURITY_LOADPIN_ENFORCING
>>       bool "Enforce LoadPin at boot"
>>       depends on SECURITY_LOADPIN
>>       help
>>         If selected, LoadPin will enforce pinning at boot. If not
>>         selected, it can be enabled at boot with the kernel parameter
>> -       "loadpin.enabled=1".
>> +       "loadpin.enforcing=1".
>> diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
>> index 0716af28808a..d8a68a6f6fef 100644
>> --- a/security/loadpin/loadpin.c
>> +++ b/security/loadpin/loadpin.c
>> @@ -44,7 +44,7 @@ static void report_load(const char *origin, struct file *file, char *operation)
>>       kfree(pathname);
>>  }
>>
>> -static int enabled = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENABLED);
>> +static int enforcing = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENFORCING);
>>  static struct super_block *pinned_root;
>>  static DEFINE_SPINLOCK(pinned_root_spinlock);
>>
>> @@ -60,8 +60,8 @@ static struct ctl_path loadpin_sysctl_path[] = {
>>
>>  static struct ctl_table loadpin_sysctl_table[] = {
>>       {
>> -             .procname       = "enabled",
>> -             .data           = &enabled,
>> +             .procname       = "enforcing",
>> +             .data           = &enforcing,
>>               .maxlen         = sizeof(int),
>>               .mode           = 0644,
>>               .proc_handler   = proc_dointvec_minmax,
>> @@ -97,7 +97,7 @@ static void check_pinning_enforcement(struct super_block *mnt_sb)
>>                                          loadpin_sysctl_table))
>>                       pr_notice("sysctl registration failed!\n");
>>               else
>> -                     pr_info("load pinning can be disabled.\n");
>> +                     pr_info("enforcement can be disabled.\n");
>>       } else
>>               pr_info("load pinning engaged.\n");
>>  }
>> @@ -128,7 +128,7 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
>>
>>       /* This handles the older init_module API that has a NULL file. */
>>       if (!file) {
>> -             if (!enabled) {
>> +             if (!enforcing) {
>>                       report_load(origin, NULL, "old-api-pinning-ignored");
>>                       return 0;
>>               }
>> @@ -151,7 +151,7 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
>>                * Unlock now since it's only pinned_root we care about.
>>                * In the worst case, we will (correctly) report pinning
>>                * failures before we have announced that pinning is
>> -              * enabled. This would be purely cosmetic.
>> +              * enforcing. This would be purely cosmetic.
>>                */
>>               spin_unlock(&pinned_root_spinlock);
>>               check_pinning_enforcement(pinned_root);
>> @@ -161,7 +161,7 @@ static int loadpin_read_file(struct file *file, enum kernel_read_file_id id)
>>       }
>>
>>       if (IS_ERR_OR_NULL(pinned_root) || load_root != pinned_root) {
>> -             if (unlikely(!enabled)) {
>> +             if (unlikely(!enforcing)) {
>>                       report_load(origin, file, "pinning-ignored");
>>                       return 0;
>>               }
>> @@ -186,10 +186,11 @@ static struct security_hook_list loadpin_hooks[] __lsm_ro_after_init = {
>>
>>  void __init loadpin_add_hooks(void)
>>  {
>> -     pr_info("ready to pin (currently %sabled)", enabled ? "en" : "dis");
>> +     pr_info("ready to pin (currently %senforcing)\n",
>> +             enforcing ? "" : "not ");
>>       security_add_hooks(loadpin_hooks, ARRAY_SIZE(loadpin_hooks), "loadpin");
>>  }
>>
>>  /* Should not be mutable after boot, so not listed in sysfs (perm == 0). */
>> -module_param(enabled, int, 0);
>> -MODULE_PARM_DESC(enabled, "Pin module/firmware loading (default: true)");
>> +module_param(enforcing, int, 0);
>> +MODULE_PARM_DESC(enforcing, "Enforce module/firmware pinning");
>>
>
>
> --
> ~Randy



-- 
Kees Cook
Pixel Security
