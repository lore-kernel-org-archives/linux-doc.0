Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8C9C47089
	for <linux-doc@archiver.kernel.org>; Tue,  6 Dec 2022 00:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbiLFAQd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Dec 2022 19:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiLFAQb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Dec 2022 19:16:31 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDB01BE92;
        Mon,  5 Dec 2022 16:16:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 557D3CE16A1;
        Tue,  6 Dec 2022 00:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34E6C433D6;
        Tue,  6 Dec 2022 00:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670285787;
        bh=wUq3BeoLoaITAfE64KunVIjHQPEjL/jsg2nBIhtKxfg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dCYTyAXDjP0Y1wQnuAxqLoxAMy2jGwugcum/KFMSsuH5/Jf1AmfMRq2flojgISRmw
         3Tufh3NMS1EVxJzGSJMw4JrgYVyUv2mdA98Z1JbrpjAuj9AfJSyvtCPfGPEcROz16v
         u7FsHL7hOpJ2sa8GrlcATulnO5scrMK5d2+kFkqaWn3WdO6UOe2fltA3UoL9ynGHc7
         IGLHAU1LvmGFhYNZp95bkw7H+5PEFLtsau+QSZ3yQA3UB0AF5QC816bXZb80vllgWz
         C6wLlxLPPzVsf/cG3OjUfQjyu1h8pZnZ25EodTaNQgV7F1d/DTnTzgooBnEWLrbndT
         IHEWJBYkiIHsw==
Date:   Mon, 5 Dec 2022 16:16:26 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     Veerasenareddy Burru <vburru@marvell.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Liron Himi <lironh@marvell.com>,
        Abhijit Ayarekar <aayarekar@marvell.com>,
        Sathesh B Edara <sedara@marvell.com>,
        Satananda Burla <sburla@marvell.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH net-next v2 2/9] octeon_ep: poll for control
 messages
Message-ID: <20221205161626.088e383f@kernel.org>
In-Reply-To: <Y42nerLmNeAIn5w9@unreal>
References: <20221129130933.25231-1-vburru@marvell.com>
        <20221129130933.25231-3-vburru@marvell.com>
        <Y4cirWdJipOxmNaT@unreal>
        <BYAPR18MB242397C352B0086140106A46CC159@BYAPR18MB2423.namprd18.prod.outlook.com>
        <Y4hhpFVsENaM45Ho@unreal>
        <BYAPR18MB2423229A66D1C98C6C744EE1CC189@BYAPR18MB2423.namprd18.prod.outlook.com>
        <Y42nerLmNeAIn5w9@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 5 Dec 2022 10:10:34 +0200 Leon Romanovsky wrote:
> > These messages include periodic keep alive (heartbeat) messages
> > from FW and control messages from VFs. Every PF will be listening
> > for its own control messages.  
> 
> @netdev, as I said, I don't know if it is valid behaviour in netdev.
> Can you please comment?

Polling for control messages every 100ms?  Sure.

You say "valid in netdev" so perhaps you can educate us where/why it
would not be?
