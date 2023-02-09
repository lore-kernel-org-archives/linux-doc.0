Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AB7C636D3
	for <linux-doc@archiver.kernel.org>; Thu,  9 Feb 2023 18:48:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjBISs6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 13:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBISs5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 13:48:57 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE358166D5
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 10:48:56 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id n2so2198758pgb.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 10:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+Vl164bAahdCQM/OeioT8QfAfHP3epqU1qWcESFk9M=;
        b=Q9NrtJRbHCDcyldUiFG3MjAJhR7cxlCGHlVMH7LvRC3pxy/zIoIaFcED4GXKwinD1h
         hDTaEFxQ84y9gg+xsxessKJmgKjmsH/ccPU7dLS+9Z1PxHLZ7r8K9cGLpwYaeAUB51f3
         wfUulFWoL5UTgA1wB8HgiEWYzLNcH4jAzX0n+kGnc8VSpjuECmf4SQ3/KsPefV1//uxm
         AR9zbWUlZKiZNP2xoS/HpWucCA9ZDltulecliEK0dcQ/7DtxKL1+XBJ39JZ1HQ0iGCgQ
         2jGKBIAVRzFg4oUu6Ll7tW/5wUdAcTnCQ1bqcXQZdypfOiUTsvlIrJvz0bfy3JIvdtzy
         NYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+Vl164bAahdCQM/OeioT8QfAfHP3epqU1qWcESFk9M=;
        b=Ccgz5+LosKgU4KABROmt5NPtJ5P0uEsnttMSULRlcunl3OENe3GXB+yMwBvGJUWKYN
         8WUaKi2SLfjj8R+bCP2jSAvnvzXEAFrIxJXKpgYsQGQw/pWakd4lHoiSPv1pgI0Z23R/
         IYJmsi0O5dv5sGWBwJqjNSChcJlmVFWmoD3FclYRQOlEVI6Yr0++omCw8fJ/IwtNlG/8
         IImy9V3TniOwSb9Mi7MgI5iSRyhNXBfoxvq01/1VOn21L9skowHmIfcqdk0u7o3hHK5u
         Kzw2CqtSNYkjwzQrUmMO48i3duqhfLFn+hbbAM7JzwurqxkbfG9Kt8dd1z8rGLbiBncV
         UOhQ==
X-Gm-Message-State: AO0yUKVhETJdyYRjwHRuF0wl9m8JfLyCINkKMKgg1xwZZb+iWBE+wbBd
        /fc9kLQpHoJBSYSIskt0Xaxprw==
X-Google-Smtp-Source: AK7set8VK0PujOG9ifS5Vi0bKSC0OilXyKgwdPqjzzZGbTEePN3Ze17cacetI8xUKvyQsqrxCAmTdg==
X-Received: by 2002:a62:5243:0:b0:5a8:5271:5a2e with SMTP id g64-20020a625243000000b005a852715a2emr2519445pfb.0.1675968536010;
        Thu, 09 Feb 2023 10:48:56 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s16-20020a62e710000000b005939fe1719fsm1791104pfh.39.2023.02.09.10.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:48:55 -0800 (PST)
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
References: <20230129235701.2393241-1-conor@kernel.org>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item
 indent
Message-Id: <167596825349.4932.12265010808108160648.b4-ty@rivosinc.com>
Date:   Thu, 09 Feb 2023 10:44:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-ca426
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, kernel test robot <lkp@intel.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Sun, 29 Jan 2023 23:57:01 +0000, Conor Dooley wrote:
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
> 
> 

Applied, thanks!

[1/1] Documentation: riscv: fix insufficient list item indent
      https://git.kernel.org/palmer/c/377804b13d8b

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

