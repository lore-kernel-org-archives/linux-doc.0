Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8A56B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 00:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfJKAeG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 20:34:06 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:47018 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfJKAeG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Oct 2019 20:34:06 -0400
Received: by mail-qt1-f196.google.com with SMTP id u22so11396380qtq.13
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2019 17:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Ir1jRSeCWH2x6xvXc8uL8ybXkWpvILfmaQVgM2wRfvA=;
        b=N/NiHW61NL9pl0vSynqNPKg+47CTftTAZJrCeaKJfjBsZQsGZbA8sq8jZPvlPRspj3
         +y9R41RMgNMVvFxYKy26KTQCe+od85PboWA8bWr0RfnsIQlkyjqx/wGvHDhEMCqamHsU
         9G7vXzxRBYHTZmgJTnxOXLA+plvbFYf/p9ieYG2s/k9OecB/ezF4A96KHhDM8hQxvtbp
         kKWhlMutOrHtnnOgwcfyPDt4hTz8osq0GKXPY+qrRPVY8Cc0t5lRHnNm0T9Axq6qYljB
         RfHHcJvZC1XMehq73B8DwGn8FKLMblhE99UM5nhqImqrx+5YVYUVEUc8Wcw8mRLGPWN7
         a1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Ir1jRSeCWH2x6xvXc8uL8ybXkWpvILfmaQVgM2wRfvA=;
        b=kjAeAnnBCG85q19ZGzWZvIwAg6LSPgvc2TbZhOmoa5zB344utqm1knSz3mcihrQpSZ
         wtrwSjInmtmHJ4NYC/gEEiiSiygwrwIyDs02wit0R6xfTekye5FTcy352PYJ/pg6NfB3
         /6gS/2n4rToJeQ2/uLh6N802IUNzBM8J+JyuD1C9dGliAFPYLYEOVrjTS+AWFz/lU+hP
         MXWCr17z9n6B9/45OJNsr28AEWCb6nkjnZiKTM97Ki5RIJZlj8S9iBMSDv4wVOlEWw1+
         JxGf9nuZFnx113q//o4Bs+boSn3qtJoxx1VHrq+z8/kjUDZzWCw+WbTRnsoWRwmuQYAg
         9CaA==
X-Gm-Message-State: APjAAAVd5x2WASLj+EbE9hiPRx4kR6dubKvpSHqmf1Jjvg8vvJvG0nRO
        4edTldNPGN+MEhYDTEhJA1zFhw==
X-Google-Smtp-Source: APXvYqxLt8bpwBFRHaQ/ptEWq7ZJhKNvIocjzEh92WCjqtn0q+SHst81ezrPpSRnVrvXXCwdTmZgLg==
X-Received: by 2002:ac8:71d7:: with SMTP id i23mr13728484qtp.195.1570754045532;
        Thu, 10 Oct 2019 17:34:05 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id m186sm3151805qkd.119.2019.10.10.17.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 17:34:05 -0700 (PDT)
Date:   Thu, 10 Oct 2019 17:33:48 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        Tal Gilboa <talgi@mellanox.com>,
        David Miller <davem@davemloft.net>, linux-doc@vger.kernel.org,
        Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH] Documentation: networking: add a chapter for the DIM
 library
Message-ID: <20191010173348.1836f23f@cakuba.netronome.com>
In-Reply-To: <c3eab338-f3a9-bff3-4c24-edeb3f80b7cd@infradead.org>
References: <e9345b39-352e-cfc6-7359-9b681cb760e8@infradead.org>
        <20191010162003.4f36a820@cakuba.netronome.com>
        <4c7f5563-2ca1-d37b-7639-f3df99a0219b@infradead.org>
        <20191010165828.0540d18d@cakuba.netronome.com>
        <c3eab338-f3a9-bff3-4c24-edeb3f80b7cd@infradead.org>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Oct 2019 17:01:02 -0700, Randy Dunlap wrote:
> > Will you try to convert and integrate the existing file instead, or do
> > you think the kdoc file should be separate?  
> 
> I'll take a look at doing that.

Thanks!
