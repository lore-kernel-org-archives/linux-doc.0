Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C1ED7D082
	for <lwn-linux-doc@archive.lwn.net>; Sat, 20 Oct 2018 01:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbeJTJNg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 20 Oct 2018 05:13:36 -0400
Received: from merlin.infradead.org ([205.233.59.134]:49028 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbeJTJNg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 20 Oct 2018 05:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Li5Th40Pnb1YbXAUol96aKpnVgMeoFozedmiaAOSVpM=; b=O6/xDaO7nmUwMvLcHgBrKQFJ3u
        iVnD8411xmbej3bOYqf8V28wC7/0pZthFITZ/Qo0qSomyy+FcFHAaeTK/sDrpmuxi3yNE2HZdlnKe
        cIRDXx6mrxkjLpzDCPUE8DPhd75DdxJ5PmjMWI+jyaGCTba7wi3n6YXgYRVwOHQbMbc3A0x28N0zW
        QK1myqTxmPegroMPRAqStQmYSpmJJiQKDn6xIdN81PJKefmaYSrM/p5H+wXM9Fh4yJ3L3v9bLTpCg
        HAWxiiHA776agHuePY0ZA3QqB7GTgLlsMiKu58fpnC+nQCIsQRwn2TFTMRMjNLAcyADEKlcz8LT+g
        QqdKMb0g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gDfhL-0001RI-3r; Sat, 20 Oct 2018 01:04:59 +0000
Subject: Re: [PATCH] Documentation: dynamic-debug: fix wildcard description
To:     Will Korteland <will@korte.land>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        JonathanCorbet <corbet@lwn.net>, Jason Baron <jbaron@akamai.com>,
        linux-doc-owner@vger.kernel.org
References: <74834e33-3876-9eeb-5139-903bd412059a@infradead.org>
 <636555f5a50bed2afa7f79aba41321fc@korte.land>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <25c035d0-6bc7-3a7e-2256-b6632ed480c0@infradead.org>
Date:   Fri, 19 Oct 2018 18:04:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <636555f5a50bed2afa7f79aba41321fc@korte.land>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/19/18 5:20 PM, Will Korteland wrote:
> On 2018-10-20 00:16, Randy Dunlap wrote:
>> -A another way is to use wildcard. The match rule support ``*`` (matches
>> -zero or more characters) and ``?`` (matches exactly one character).For
>> +A another way is to use wildcards. The match rule supports ``*`` (matches
>> +zero or more characters) and ``?`` (matches exactly one character). For
>>  example, you can match all usb drivers::
> 
> "A another" -> "Another"?
> 
> - Will

Yes.  I'll send an update.

thanks,
-- 
~Randy
