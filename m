Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DBE87E686
	for <lwn-linux-doc@archive.lwn.net>; Sun, 11 Mar 2018 03:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751224AbeCKDHW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 10 Mar 2018 22:07:22 -0500
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:30572 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbeCKDHU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Mar 2018 22:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5802; q=dns/txt; s=iport;
  t=1520737640; x=1521947240;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YISdkcMBaBiTyDrigL70tCJt4SqCT9dKnaR/7HnVB2k=;
  b=LNjvqbhuzp0erFHYRX0/tn5lSOebYvRnnqwz7Ks3g9QZTRbRldEIctZQ
   SK+Iyw4ny/V8ZhPavs98OCknvn1K2nMfwUn+KMbNp0MnLDjrQczWVVQOh
   ChYngJwxciwtSW6mh955OknJ78p3vDIOnGloCvYjZJ9Hvv+O//XvZ38oJ
   0=;
X-IronPort-AV: E=Sophos;i="5.47,453,1515456000"; 
   d="scan'208";a="359191866"
Received: from alln-core-3.cisco.com ([173.36.13.136])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2018 03:07:19 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
        by alln-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w2B37IYN017829
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sun, 11 Mar 2018 03:07:18 GMT
Date:   Sat, 10 Mar 2018 19:07:18 -0800 (PST)
From:   Victor Kamensky <kamensky@cisco.com>
To:     Stephen Smalley <sds@tycho.nsa.gov>
cc:     Taras Kondratiuk <takondra@cisco.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James McMechan <james.w.mcmechan@gmail.com>,
        initramfs@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, xe-linux-external@cisco.com,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>
Subject: Re: [PATCH v3 14/15] selinux: allow setxattr on rootfs so initramfs
 code can set them
In-Reply-To: <1519153284.14218.18.camel@tycho.nsa.gov>
Message-ID: <alpine.LRH.2.00.1803101848580.24419@sjc-ads-6991.cisco.com>
References: <1518813234-5874-1-git-send-email-takondra@cisco.com>  <1518813234-5874-17-git-send-email-takondra@cisco.com> <1519153284.14218.18.camel@tycho.nsa.gov>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
X-Auto-Response-Suppress: DR, OOF, AutoReply
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Tue, 20 Feb 2018, Stephen Smalley wrote:

> On Fri, 2018-02-16 at 20:33 +0000, Taras Kondratiuk wrote:
>> From: Victor Kamensky <kamensky@cisco.com>
>>
>> initramfs code supporting extended cpio format have ability to
>> fill extended attributes from cpio archive, but if SELinux enabled
>> and security server is not initialized yet, selinux callback would
>> refuse setxattr made by initramfs code.
>>
>> Solution enable SBLABEL_MNT on rootfs even if secrurity server is
>> not initialized yet.
>
> What if we were to instead skip the SBLABEL_MNT check in
> selinux_inode_setxattr() if !ss_initialized?  Not dependent on
> filesystem type.

Stephen, thank you for looking into this. Sorry, for dealyed reponse -
I needed to find time to require context about these changes.

As you suggested I've tried this and it works:

>From 6bf35bd055fdb12e94f3d5188eccfdbaa30dbcf4 Mon Sep 17 00:00:00 2001
From: Victor Kamensky <kamensky@cisco.com>
Date: Fri, 9 Mar 2018 23:01:20 -0800
Subject: [PATCH 1/2] selinux: allow setxattr on file systems if policy is not
  loaded

initramfs code supporting extended cpio format have ability to
fill extended attributes from cpio archive, but if SELinux enabled
and security server is not initialized yet, selinux callback would
refuse setxattr made by initramfs code because file system is not
yet marked as one that support labeling (SBLABEL_MNT flag).

Solution do not refuse setxattr even if SBLABEL_MNT is not set
for file systems when policy is not loaded yet.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
  security/selinux/hooks.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 819fd68..31303ed 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3120,7 +3120,7 @@ static int selinux_inode_setxattr(struct dentry *dentry, const char *name,
  		return selinux_inode_setotherxattr(dentry, name);

  	sbsec = inode->i_sb->s_security;
-	if (!(sbsec->flags & SBLABEL_MNT))
+	if (!(sbsec->flags & SBLABEL_MNT) && ss_initialized)
  		return -EOPNOTSUPP;

  	if (!inode_owner_or_capable(inode))
-- 
2.7.4

But with this change it would mean for that filesystem types, that
never are supposed to get SBLABEL_MNT flag, code may go through
if !ss_initialized. I have hard time evaluating impication of this,
but it is not existing case or not a big deal.

Generally I agree with your concern that the issue is not "rootfs"
specific. Other thought that it could be solved with use of
selinux_is_sblabel_mnt instead of "rootfs" specific check inside
of selinux_set_mnt_opts, in addition to similar code
in sb_finish_set_opts function. I.e something like this:

>From a94548b5ecde43ccc9c2b02b29becc086b4343a3 Mon Sep 17 00:00:00 2001
From: Victor Kamensky <kamensky@cisco.com>
Date: Fri, 9 Mar 2018 23:01:20 -0800
Subject: [PATCH 1/2] selinux: allow setxattr on rootfs so initramfs code can
  set them

initramfs code supporting extended cpio format have ability to
fill extended attributes from cpio archive, but if SELinux enabled
and security server is not initialized yet, selinux callback would
refuse setxattr made by initramfs code.

Solution enable set SBLABEL_MNT on file systems for which we can
figure out that they support securit labels even if secrurity
server is not initialized yet.

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
  security/selinux/hooks.c | 12 ++++++++++++
  1 file changed, 12 insertions(+)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 819fd68..326aca9 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -701,6 +701,18 @@ static int selinux_set_mnt_opts(struct super_block *sb,

  	if (!ss_initialized) {
  		if (!num_opts) {
+                        /*
+                         * For some of file systems we can mark them as
+                         * supporting security labels even before policy
+                         * loaded. It may be used by code that may want
+                         * to do setxatts before polict load.
+                         *
+                         * Note after policy loaded this check and marking
+                         * happens again.
+                         */
+                        if (selinux_is_sblabel_mnt(sb))
+                                sbsec->flags |= SBLABEL_MNT;
+
  			/* Defer initialization until selinux_complete_init,
  			   after the initial policy is loaded and the security
  			   server is ready to handle calls. */
-- 
2.7.4

Thanks,
Victor

>>
>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>> ---
>>  security/selinux/hooks.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
>> index 8644d864e3c1..f3fe65589f02 100644
>> --- a/security/selinux/hooks.c
>> +++ b/security/selinux/hooks.c
>> @@ -706,6 +706,18 @@ static int selinux_set_mnt_opts(struct
>> super_block *sb,
>>
>>  	if (!ss_initialized) {
>>  		if (!num_opts) {
>> +			/*
>> +			 * Special handling for rootfs. Is genfs but
>> supports
>> +			 * setting SELinux context on in-core
>> inodes.
>> +			 *
>> +			 * Chicken and egg problem: policy may
>> reside in rootfs
>> +			 * but for initramfs code to fill in
>> attributes, it
>> +			 * needs selinux to allow that.
>> +			 */
>> +			if (!strncmp(sb->s_type->name, "rootfs",
>> +				     sizeof("rootfs")))
>> +				sbsec->flags |= SBLABEL_MNT;
>> +
>>  			/* Defer initialization until
>> selinux_complete_init,
>>  			   after the initial policy is loaded and
>> the security
>>  			   server is ready to handle calls. */
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
