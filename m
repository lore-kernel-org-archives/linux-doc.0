Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4BF07D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 12:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753299AbeCTMhg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 08:37:36 -0400
Received: from merlin.infradead.org ([205.233.59.134]:35370 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753248AbeCTMha (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 08:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1fHsE1nmcgWwly8CDahs/GNTh68IaNBKHRdRUm6rBaE=; b=vWgAAm3XJK28k0VUuqTFsldwe
        BARezZg/CK148m23Z50hOJRZ3UoSdl3ALfA7c1RAtvziyTWFIuWYglzt8NAxLuuWoBwgxeZaUvPe2
        j8M+t8h5Ed8i2+rfsnDIhft7G+A0B/zLgegoYXwcTJEZimwUP0JjHMEowedE96NfKuXDSSQpig1TN
        4ET9TVMmXiT9jkVRSDk8HlpY/Fv8NWcXsW4t0myuoc4LE2trR29hszw2YijwKzBkqbHNDHHVvkfcw
        K9e2CaMGEF0t8r+A/VZWY2fXmypRY808+YCpn77q22uFSwJyP2P9KJI8GRueXdruEnim//eMkIr5Q
        R0NV0cB0A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1eyGVv-0005zb-7N; Tue, 20 Mar 2018 12:37:15 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C0D80202A2A01; Tue, 20 Mar 2018 13:37:12 +0100 (CET)
Date:   Tue, 20 Mar 2018 13:37:12 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dou Liyang <douly.fnst@cn.fujitsu.com>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, corbet@lwn.net,
        rjw@rjwysocki.net, lenb@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 1/5] x86/smpboot: Add the missing description of
 possible_cpus
Message-ID: <20180320123712.GR4043@hirez.programming.kicks-ass.net>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
 <20180320110432.28127-2-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180320110432.28127-2-douly.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 20, 2018 at 07:04:28PM +0800, Dou Liyang wrote:

> +	possible_cpus=	[s390,x86_64] Use this to set hotpluggable cpus.
> +			This option sets possible_cpus bits in cpu_possible_map.
> +			Thus keeping the numbers of bits set constant even if
> +			the machine gets rebooted.

That description, esp. the last sentence, doesn't make any kind of sense
to me. What?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
