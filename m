Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28722C46467
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 00:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjATAIQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 19:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjATAIP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 19:08:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8EAA25A2;
        Thu, 19 Jan 2023 16:08:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 279AA61DB0;
        Fri, 20 Jan 2023 00:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69338C433EF;
        Fri, 20 Jan 2023 00:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674173293;
        bh=III/0sjQrzrS4NQKMahAScOIBtkhrFs+yTBwBhtKMaY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b085J57EAcpQFI9HrGOzSzf/HndjUKFq1yVqpD3D7dSqpd5+8+7UW2zsEALkoOFAW
         tv1b+NNVBf5K6C1GCm/h5bAZW2oDn7VkRhirXXb2Nt24eO1CCnazH6wifMzMuf6X4r
         82gK5nfUaYweq7tpKz706M9RvDkGy/B86PeUDFwIJzKYGVL0tCBNqV0KErZFwLDHEr
         GQG1UHD3VGivkRDpMDUFlHsdU/KHzqkAIk8+3mXgS6kyG3zyiCnGhWNzVfb6tl41XT
         dIby0F5XiD6DjWyqb2bK5BP0+JrTPwzI+dwhS7cj2dvScE3HeaX8sRHFLUZF3Diq7x
         03rsQIe/cH0Fg==
Date:   Thu, 19 Jan 2023 16:08:12 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/8] netlink: add schemas for YAML specs
Message-ID: <20230119160812.6ea60396@kernel.org>
In-Reply-To: <CAL_JsqKk5RT6PmRSrq=YK7AvzCbcVkxasykJqe1df=3g-=kD7A@mail.gmail.com>
References: <20230119003613.111778-1-kuba@kernel.org>
        <20230119003613.111778-3-kuba@kernel.org>
        <CAL_JsqKk5RT6PmRSrq=YK7AvzCbcVkxasykJqe1df=3g-=kD7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Jan 2023 08:07:31 -0600 Rob Herring wrote:
> > +$id: "http://kernel.org/schemas/netlink/genetlink-c.yaml#"
> > +$schema: "http://kernel.org/meta-schemas/netlink/core.yaml#"  
> 
> There's no core.yaml. If you don't have a custom meta-schema, then
> just set this to the schema for the json-schema version you are using.
> Then the tools can validate the schemas without your own validator
> class.

$schema: https://json-schema.org/draft/2020-12/schema

or

$schema: https://json-schema.org/draft-09/schema

? 

It seems like the documentation suggests the former but the latter 
appears widespread.
