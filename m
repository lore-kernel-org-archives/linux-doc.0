Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8B5257D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 08:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409380AbfIXIOV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 04:14:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:42120 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406311AbfIXIOV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Sep 2019 04:14:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 55BEFABC7;
        Tue, 24 Sep 2019 08:14:19 +0000 (UTC)
Subject: Re: [PATCH v2 11/12] drm/mgag200: Reserve video memory for cursor
 plane
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        yc_chen@aspeedtech.com, corbet@lwn.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20190923172753.26593-1-tzimmermann@suse.de>
 <20190923172753.26593-12-tzimmermann@suse.de>
 <20190924075538.vvg7q2jrderil653@sirius.home.kraxel.org>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0e32b356-57c5-cd55-3423-50697bae8303@suse.de>
Date:   Tue, 24 Sep 2019 10:14:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190924075538.vvg7q2jrderil653@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi

Am 24.09.19 um 09:55 schrieb Gerd Hoffmann:
>    Hi,
> 
>> +	/*
>> +	 * At the high end of video memory, we reserve space for
>> +	 * buffer objects. The cursor plane uses this memory to store
>> +	 * a double-buffered image of the current cursor. Hence, it's
>> +	 * not available for framebuffers.
>> +	 */
>> +	mdev->vram_fb_available -= 2 * size;
> 
> Hmm, that looks like a leftover from the previous version of the patch
> series ...

This belongs here. For several tests the size of the available 
framebuffer memory needs to be known. It's stored in 
mdev->vram_fb_available. mgag200_mm_init() sets the value of 
mdev->vram_fb_available to the full size of the video RAM. The line 
above subtracts the size of 2 cursor buffers.

Best regards
Thomas

> 
> cheers,
>    Gerd
> 

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
