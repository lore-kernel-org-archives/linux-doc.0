Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C10C001DE
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 03:08:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236400AbjHRDHg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Aug 2023 23:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343839AbjHRDH3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 23:07:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AA62D56
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 20:07:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E38946311D
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 03:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD10FC433C7;
        Fri, 18 Aug 2023 03:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692328047;
        bh=XtpCOzAGlGBG+ijzXnOGop7l8rBn+bP0MyROKMkYCTs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sg1oQ0phrq1PXOVattZ1mHbzAIz4baJGjMVdSWwziu9meTuQ5b2nkDHiMSYvHQJKN
         BSljlziJ96r/PNP9IsHqJjmrCS0L9jeMN5cbf/zZVXpfNMSRtgZ34VLOqwqRGwU+lW
         ePL3brJp8uHJcBoGOQyIFr/ZMcUxYzx9DMMMUlA1G54IG0zTjOqPVIn2baCVDjjaMi
         wUXwQLbMDttcl8HoFUdap6fC/KgmoEjKJBJWEISymIoO9s5PhusRVzxaNKwhYvBIHJ
         H+UvZq67vQZ/GE4fsWcG8WQQYvPavgPs9XTNTqk9PE34dGuZ6RwEmiiqa0h+j9A+X9
         Nuo+H7fENei0A==
Date:   Thu, 17 Aug 2023 20:07:25 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Dima Chumak <dchumak@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH net-next v3 0/8] devlink: Add port function attributes
Message-ID: <20230817200725.20589529@kernel.org>
In-Reply-To: <cover.1692262560.git.leonro@nvidia.com>
References: <cover.1692262560.git.leonro@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Aug 2023 12:11:22 +0300 Leon Romanovsky wrote:
> Introduce hypervisor-level control knobs to set the functionality of PCI
> VF devices passed through to guests. The administrator of a hypervisor
> host may choose to change the settings of a port function from the
> defaults configured by the device firmware.
> 
> The software stack has two types of IPsec offload - crypto and packet.
> Specifically, the ip xfrm command has sub-commands for "state" and
> "policy" that have an "offload" parameter. With ip xfrm state, both
> crypto and packet offload types are supported, while ip xfrm policy can
> only be offloaded in packet mode.
> 
> The series introduces two new boolean attributes of a port function:
> ipsec_crypto and ipsec_packet. The goal is to provide a similar level of
> granularity for controlling VF IPsec offload capabilities, which would
> be aligned with the software model. This will allow users to decide if
> they want both types of offload enabled for a VF, just one of them, or
> none at all (which is the default).
> 
> At a high level, the difference between the two knobs is that with
> ipsec_crypto, only XFRM state can be offloaded. Specifically, only the
> crypto operation (Encrypt/Decrypt) is offloaded. With ipsec_packet, both
> XFRM state and policy can be offloaded. Furthermore, in addition to
> crypto operation offload, IPsec encapsulation is also offloaded. For
> XFRM state, choosing between crypto and packet offload types is
> possible. From the HW perspective, different resources may be required
> for each offload type.

What's going on with all the outstanding nVidia patches?!
The expectation is 1 series per vendor / driver. Let's say
2 if there are core changes. You had 5 outstanding today.

I'm tossing this out.
-- 
pw-bot: defer
