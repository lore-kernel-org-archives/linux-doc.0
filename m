Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55C2C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jan 2022 16:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355198AbiALQaR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 11:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240059AbiALQaQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 11:30:16 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206B8C06173F
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=DjyuBgNZ6ZS0VNqBLDAcuaTkMu0N9okdZ/4lvwch7z8=; b=IXx0HOZfgl00yI5LJVdPLqyrCq
        0WaeGuGiHkiCkCR0JoIViWL0bH6+7DoywVSR8Vva/rEhpJgnp5OUfcuCmMxtpSH+5ldZBK7nZknl4
        z+ZcyOqMXZyPdwxJpbZII/MhJkpgFCogkIWOq0mxM/6wO4NSna1xsFmuc1OXFXqGEC+80BVfWyK+l
        Lg+3T+SWYvs8byxvTa6Yj4wKQHKNFtTFrOapGc4vVFgmb4CYLosOI+ZK3x8I9euL0fFeDUSNN2FHQ
        uHNFHiUD76KYnodMjy/VPqL9V4VvsSOS52xlyODQ5xgSmTw3qP2Txh9KYvrOdB80P3GeEPAOT2ddu
        G2P0jOhg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n7gVi-000pWI-Rq; Wed, 12 Jan 2022 16:30:07 +0000
Message-ID: <a2fa0ba9-8b93-eb00-9b7f-a5280f304c64@infradead.org>
Date:   Wed, 12 Jan 2022 08:30:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2] dm ima: updates to grammar and some details in
 documentation
Content-Language: en-US
To:     Thore Sommer <public@thson.de>, dm-devel@redhat.com,
        agk@redhat.com, snitzer@redhat.com
Cc:     linux-doc@vger.kernel.org, tusharsu@linux.microsoft.com
References: <20220112144230.1978290-1-public@thson.de>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220112144230.1978290-1-public@thson.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi--

On 1/12/22 06:42, Thore Sommer wrote:
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
> v2:
> - include also device name and uuid in grammar for no_data
> - fixed spelling mistakes
> 
>  .../admin-guide/device-mapper/dm-ima.rst      | 32 +++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-ima.rst b/Documentation/admin-guide/device-mapper/dm-ima.rst
> index a4aa50a828e0..ef386a71e015 100644
> --- a/Documentation/admin-guide/device-mapper/dm-ima.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-ima.rst

> @@ -118,9 +121,9 @@ The IMA measurement log has the following format for 'dm_table_load':
>   device_minor := "minor=" <N>
>   minor_count := "minor_count=" <N>
>   num_device_targets := "num_targets=" <N>

These 2 changes still need a space before the '=',

> - dm-device-name := Name of the device. If it contains special characters like '\', ',', ';',
> + dm-device-name := Name of the device. If it contains special characters like '\', ',', ';','=',
>                     they are prefixed with '\'.
> - dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';',
> + dm-device-uuid := UUID of the device. If it contains special characters like '\', ',', ';','=',
>                     they are prefixed with '\'.
>  
>   table_load_data := <target_data>


-- 
~Randy
