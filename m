Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52412C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jan 2022 03:23:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344976AbiAGDXo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jan 2022 22:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344897AbiAGDXm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 22:23:42 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED0FC061245
        for <linux-doc@vger.kernel.org>; Thu,  6 Jan 2022 19:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=29ocBvgMlFX1x3WY6Dxywn6hfES/wl7PR/1p7ikMHsw=; b=SFDhzUgKsG7tn+oe7v0pSdAp3n
        uRdOeK8ZaCdl9sDrfPnCv+Cc+qw6KemMGel7mjtNyG0TUBlragtcDD4KXnGEawMScqjsCxQSwJGF7
        JuPmn4cWvjXB+Q1N70KFqUSLI89PW9pBw8oAMwGnDOpxkluO+d66zZWyq5yp0Ka7T7XMrvY2MIzpQ
        blAetmwbstuOjKMSrjIbK1oyaJI3A5iJ5xK7eLZU7LlW4kMpvUxJboWrUetkDvFaVlv+02TvqQemn
        Y3eY035YphnPLOge4XVxr2QrfNWCy03+h1B/5qjVba4vrfrjctev76MxeEoOuQKKN67Zjrnw0co9j
        zOM81mMQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n5fqm-00G16G-Cy; Fri, 07 Jan 2022 03:23:32 +0000
Message-ID: <788e0bf1-ee36-69f3-03ff-3df3d248dc7a@infradead.org>
Date:   Thu, 6 Jan 2022 19:23:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] dm ima: updates to grammar and some details in
 documentation
Content-Language: en-US
To:     Thore Sommer <public@thson.de>, dm-devel@redhat.com,
        agk@redhat.com, snitzer@redhat.com
Cc:     linux-doc@vger.kernel.org, tusharsu@linux.microsoft.com
References: <20220106163731.165391-1-public@thson.de>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220106163731.165391-1-public@thson.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just a few changes below:

On 1/6/22 08:37, Thore Sommer wrote:
> The grammar for the events dm_device_remove, device_resume and
> dm_table_clear did not include the no_data entry when device data
> and hash are missing.
> 
> For the device uuid or name "=" is also escaped with a "\".
> 
> Add a note that dm_table_load might split its target measurements over
> multiple IMA events.
> 
> Signed-off-by: Thore Sommer <public@thson.de>
> ---
>  .../admin-guide/device-mapper/dm-ima.rst      | 26 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-ima.rst b/Documentation/admin-guide/device-mapper/dm-ima.rst
> index a4aa50a828e0..fb6e4148b426 100644
> --- a/Documentation/admin-guide/device-mapper/dm-ima.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-ima.rst
> @@ -100,6 +100,9 @@ When a new table is loaded in a device's inactive table slot,
>  the device information and target specific details from the
>  targets in the table are measured.
>  
> +Note that if there are too many targets to measure at once multiple IMA
> +measurements will be generated.
> +
>  The IMA measurement log has the following format for 'dm_table_load':
>  
>  ::
> @@ -118,9 +121,9 @@ The IMA measurement log has the following format for 'dm_table_load':
>   device_minor := "minor=" <N>
>   minor_count := "minor_count=" <N>
>   num_device_targets := "num_targets=" <N>
> - dm-device-name := Name of the device. If it contains special characters like '\', ',', ';',
> + dm-device-name := Name of the device. If it contains special characters like '\', ',', ';',"=",

                                                                                           ';', '=',

>                     they are prefixed with '\'.
> - dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';',
> + dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';',"=",

                                                                                           ';', '=',

>                     they are prefixed with '\'.
>  
>   table_load_data := <target_data>
> @@ -175,8 +178,9 @@ The IMA measurement log has the following format for 'dm_device_resume':
>  ::
>  
>   EVENT_NAME := "dm_device_resume"
> - EVENT_DATA := <dm_version_str> ";" <device_metadata> ";" <active_table_hash> ";" <current_device_capacity> ";"
> + EVENT_DATA := <dm_version_str> ";" device_data ";" <current_device_capacity> ";"
>  
> + device_data := <device_metadata> ";" <active_table_hash> | device_resume_no_data
>   dm_version_str := As described in the 'Table load' section above.
>   device_metadata := As described in the 'Table load' section above.
>   active_table_hash := "active_table_hash=" <table_hash_alg> ":" <table_hash>
> @@ -189,6 +193,9 @@ The IMA measurement log has the following format for 'dm_device_resume':
>                 events for a given device, the hash is computed combining all the event data
>                 i.e. (<dm_version_str> ";" <device_metadata> ";" <table_load_data> ";")
>                 across all those events.
> + device_resume_no_data := "device_resume=no_data"
> +                           If device metadata and hash for the active table do not exists this value gets measured.

                                                                               do not exist, this value is measured.

> +                           Note: the hash should always exist if the device metadata is present.
>   current_device_capacity := "current_device_capacity=" <N>
>  
>   For instance, if a linear device is resumed with the following command,
> @@ -213,10 +220,10 @@ The IMA measurement log has the following format for 'dm_device_remove':
>  ::
>  
>   EVENT_NAME := "dm_device_remove"
> - EVENT_DATA := <dm_version_str> ";" <device_active_metadata> ";" <device_inactive_metadata> ";"
> -               <active_table_hash> "," <inactive_table_hash> "," <remove_all> ";" <current_device_capacity> ";"
> + EVENT_DATA := <dm_version_str> ";" <device_data> <remove_all> ";" <current_device_capacity> ";"
>  
>   dm_version_str := As described in the 'Table load' section above.
> + device_data := <device_active_metadata> ";" <device_inactive_metadata> ";" <active_table_hash> "," <inactive_table_hash> "," | <device_remove_no_data> ";"
>   device_active_metadata := Device metadata that reflects the currently loaded active table.
>                             The format is same as 'device_metadata' described in the 'Table load' section above.
>   device_inactive_metadata := Device metadata that reflects the inactive table.
> @@ -225,6 +232,9 @@ The IMA measurement log has the following format for 'dm_device_remove':
>                        The format is same as 'active_table_hash' described in the 'Device resume' section above.
>   inactive_table_hash :=  Hash of the inactive table.
>                           The format is same as 'active_table_hash' described in the 'Device resume' section above.
> + device_remove_no_data := "device_remove=no_data"
> +                          If device metadata and hash for the active and inactive table do not exists this value gets measured.

                                                                                                  exist, this value is measured.

> +                          Note: the hash should always exist if the device metadata is present.
>   remove_all := "remove_all=" <yes_no>
>   yes_no := "y" | "n"
>   current_device_capacity := "current_device_capacity=" <N>
> @@ -254,9 +264,13 @@ The IMA measurement log has the following format for 'dm_table_clear':
>  ::
>  
>   EVENT_NAME := "dm_table_clear"
> - EVENT_DATA := <dm_version_str> ";" <device_inactive_metadata> ";" <inactive_table_hash> ";" <current_device_capacity> ";"
> + EVENT_DATA := <dm_version_str> ";" <device_data> ";" <current_device_capacity> ";"
>  
>   dm_version_str := As described in the 'Table load' section above.
> + device_data := <device_inactive_metadata> ";" <inactive_table_hash> | <table_clear_no_data>
> + table_clear_no_data := "table_clear=no_data"
> +                        If device metadata and hash for the inactive table do not exists this value gets measured.

                                                                                     exist, this value is measured.

> +                        Note: the hash should always exist if the device metadata is present.
>   device_inactive_metadata := Device metadata that was captured during the load time inactive table being cleared.
>                               The format is same as 'device_metadata' described in the 'Table load' section above.
>   inactive_table_hash := Hash of the inactive table being cleared from the device.

thanks.
-- 
~Randy
