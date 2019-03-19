Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D33F17D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Mar 2019 15:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfCSPB1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Mar 2019 11:01:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:12389 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727196AbfCSPB1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Mar 2019 11:01:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Mar 2019 08:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,498,1544515200"; 
   d="scan'208";a="156366722"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.172])
  by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2019 08:01:15 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Tobin C. Harding" <me@tobin.cc>, linux-doc@vger.kernel.org
Subject: Re: Documenting struct function pointers (methods)
In-Reply-To: <20190319022514.GA3622@eros.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190319022514.GA3622@eros.localdomain>
Date:   Tue, 19 Mar 2019 17:02:57 +0200
Message-ID: <87lg1agb4u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 19 Mar 2019, "Tobin C. Harding" <me@tobin.cc> wrote:
> Hi,
>
> Is documenting 'methods' i.e. function pointers in structs like 'struct
> file_operations' something that we do anywhere?  Is this handled by RST?
> Is it something that has been discussed already?
>
> I'm in the process of trying to grok the dcache and update the docs.
> For each function pointer I'm reading various implementations and trying
> to work out what the method is supposed to do.  Surely this is a good
> candidate for improving kernel documentation in order to help devs come
> up to speed more quickly?
>
> An example from include/linux/fs.h (adding docstring comments to struct
> file_system_type).  This is _not_ handled correctly by Sphinx, is there
> a way to do this?  Or are hard-core hackers going to scream that this is
> too much documentation :)

We use a lot of function pointer members like that the drm subsystem,
and we'd also like to document them similar to functions. Alas, this is
not so much about RST or Sphinx as it is about scripts/kernel-doc that
parses the documentation comments into RST. Would be nice to have this
fixed, but it's not for the faint of heart.

BR,
Jani.


>
>
> /**
>  * struct file_system_type
>  * @name: Name of the filesystem type, such as "ext2", "iso9660",
>  *        "msdos" and so on.
>  * @fs_flags: Various flags (i.e. FS_REQUIRES_DEV, FS_NO_DCACHE, etc.).
>  * ...
>  */
> struct file_system_type {
>        [snip]
> 	const struct fs_parameter_description *parameters;
> 	/**
> 	 * @mount: The method to call when a new instance of this
> 	 *         filesystem should be mounted.
> 	 *
> 	 * The mount() method has the following arguments:
> 	 * @fs_type: Describes the filesystem, partly initialized by the
> 	 *           specific filesystem code.
> 	 * @flags: Mount flags.
> 	 * @dev_name: The device name we are mounting.
> 	 * @data: Arbitrary mount options, usually comes as an ASCII
> 	 *        string (see "Mount Options" section).
> 	 */
> 	struct dentry *(*mount) (struct file_system_type *fs_type, int flags,
> 				 const char *dev_name, void *data);
> 	void (*kill_sb) (struct super_block *);
>
>
> thanks,
> Tobin.

-- 
Jani Nikula, Intel Open Source Graphics Center
