Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15924CA0FFE
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 16:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348991AbjIEQY4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354898AbjIEPj1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 11:39:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC84AC;
        Tue,  5 Sep 2023 08:39:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE9D8B81218;
        Tue,  5 Sep 2023 15:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2168EC433C8;
        Tue,  5 Sep 2023 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1693928361;
        bh=IuTYB1prDBGGRSQfQarq/IhVRw5br9ovPsUKvnjcSZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X4Ub3csFSLuOvbcPvtEMyLZRqCkHa6DHUH193SdWA9d0qkRP0W2ykfArYwwxCJLpy
         n233eB2R8FTuUFTaCb9H8ls3I0lXdM4kbq18lOQ3vMpeKRfFKir1EqOkG0lfEjC3we
         C+uIX29aOPcPfYPe+FYj13lBBz87ABqScFvdAlh4=
Date:   Tue, 5 Sep 2023 16:39:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Carlos Bilbao <carlos.bilbao@amd.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ardb@kernel.org, kraxel@redhat.com,
        dovmurik@linux.ibm.com, elena.reshetova@intel.com,
        dave.hansen@linux.intel.com, Dhaval.Giani@amd.com,
        michael.day@amd.com, pavankumar.paluri@amd.com,
        David.Kaplan@amd.com, Reshma.Lal@amd.com, Jeremy.Powell@amd.com,
        sathyanarayanan.kuppuswamy@linux.intel.com,
        alexander.shishkin@linux.intel.com, thomas.lendacky@amd.com,
        tglx@linutronix.de, dgilbert@redhat.com, dinechin@redhat.com,
        linux-coco@lists.linux.dev, berrange@redhat.com, mst@redhat.com,
        tytso@mit.edu, jikos@kernel.org, joro@8bytes.org, leon@kernel.org,
        richard.weinberger@gmail.com, lukas@wunner.de, jejb@linux.ibm.com,
        cdupontd@redhat.com, jasowang@redhat.com, sameo@rivosinc.com,
        bp@alien8.de, seanjc@google.com, security@kernel.org,
        Larry Dewey <larry.dewey@amd.com>
Subject: Re: [PATCH v4] docs: security: Confidential computing intro and
 threat model for x86 virtualization
Message-ID: <2023090555-gossip-neon-9f66@gregkh>
References: <20230905152656.1215119-1-carlos.bilbao@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905152656.1215119-1-carlos.bilbao@amd.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 05, 2023 at 10:26:56AM -0500, Carlos Bilbao wrote:
> +The basic CoCo guest layout includes the host, guest, the interfaces that
> +communicate guest and host, a platform capable of supporting CoCo VMs, and

"communicate between the guest and host" right?

