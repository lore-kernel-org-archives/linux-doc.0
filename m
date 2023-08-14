Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE99C04A94
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 22:31:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232781AbjHNWbF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 18:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbjHNWao (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 18:30:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E15199B;
        Mon, 14 Aug 2023 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=f6Od+nROclrydhFNKKC4y7J24uEmtyay1uyUpf7kRbQ=; b=OLSvh5zvCZLXX1bheJwx2AWxCN
        JGz51FNSsU67yQO2YbWkDpjKczxA8Zq+LffmAAZAtCRTqYRTAA4X6rcGSNbyl18YMeDMthEwOAMXj
        8xzDNRfRwuBQs2ibphvaLXSql0LtQ/JkO9qKaxZ2MA+UjQIRBU/dR4LQfE+aOSqwGK64TgES4XEGw
        esUygLyJm6TfeCz1q3xAsVRkBj/qMER2PfGski5UPFIqNQfAlCO3UFIAkzSMjhzotCbu7mBrKfQHi
        q1ulFJuMcYWyGn9EXnp781f2YeneYZz2bGHP8zEnwpfDuxs9554NOvuMu8PxpOF+B4R6gfQ1W29B2
        W2XVcVMg==;
Received: from [2601:1c2:980:9ec0::577]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qVg4c-004ZSc-Kc; Mon, 14 Aug 2023 22:30:07 +0000
Message-ID: <046757e4-7b61-6035-5672-0c654df5339a@infradead.org>
Date:   Mon, 14 Aug 2023 15:30:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] Documentation/ABI: Fix typos
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
References: <20230814212822.193684-1-helgaas@kernel.org>
 <20230814212822.193684-2-helgaas@kernel.org>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230814212822.193684-2-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/14/23 14:28, Bjorn Helgaas wrote:
> From: Bjorn Helgaas<bhelgaas@google.com>
> 
> Fix typos in Documentation/ABI.  The changes are in descriptions or
> comments where they shouldn't affect use of the ABIs.
> 
> Signed-off-by: Bjorn Helgaas<bhelgaas@google.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
