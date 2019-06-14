Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DE5F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Jun 2019 08:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfFNIQ0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Jun 2019 04:16:26 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:41763 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfFNIQ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jun 2019 04:16:26 -0400
Received: by mail-lf1-f48.google.com with SMTP id 136so1090111lfa.8
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2019 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sz21dcEmUnt78YNFfm6F9rMky982RcdT6miE7Kwy+xQ=;
        b=cgNaSFKwKYmVfImDO2DRLbyekomRK9qHKelIPfrEQAtqGlD1M55ojIBI7PTJXK6ig0
         VlSjky6WaPqSI113zdWaJbUUGusnixgE68yKeX0SUfDFX1Td0a8SkmoodjzeNEkMYBTe
         /iBHx4Smi1pAPuNhZiBPk2XbdRhx/Pp8pYRVXPdOv2IxSK1Xy2yIvxP1ZrJHm5CFjw4q
         ePBGvlF5iluLyr+9Jyu9BuoJDyoyVMZlKvYs/45e1ppUV5/2FZJO/uvy2N4J009is8qu
         BjaIGtSadmPLLgk2zxF/2WNL9qP65CHoWbydut0H7Nrt7w9gWhrmTAUWbaqfRnsQKfk3
         WiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sz21dcEmUnt78YNFfm6F9rMky982RcdT6miE7Kwy+xQ=;
        b=TGaXKZfOWor+RgyHfUGqGAkJgiCQI2V+LAcBouSQ20W9uCpEg07hvvy2yNzoaux0OX
         GqI8EQwCp9F6USGXDl2vzl/jX4LyAxh51qOn/6Pi3ULH75HiJwNCVzAFClO1SCb71J03
         d5HSMzWoEe2OpdNTlzAptCRY7piiKw1KtahPwNKhZ3Lizth99oEMqwUALUKD+qW2RraM
         6f1Mf9SnpHabuivjHN5WFXa3Hr/UDRPXIOiL8lXSyI+mQlKROiohjZxKEudnhFGe/UwP
         QfSiINBEPkw5rKTAT7I/n0dKp2nJeLulg2Sg78Q1MYGhxfP9syzCfoVLxI6KBYbD5VFC
         NaSQ==
X-Gm-Message-State: APjAAAWyvIpJM4bBOMeLV0ji0dLLzNmKqlzS3A/2qm125sXaKpVnWkFY
        08g+C46JXQFZYfgcJACjZ9y7hg==
X-Google-Smtp-Source: APXvYqz2SFwlCts58NJ9uhwjuLDS0BZ40ErMRTVyj9BXE6UW3BuzWyga/5vhM3jc6xoSbw4tyw5ZYA==
X-Received: by 2002:ac2:418f:: with SMTP id z15mr18332522lfh.177.1560500184883;
        Fri, 14 Jun 2019 01:16:24 -0700 (PDT)
Received: from jax.lan (81-236-179-152-no272.tbcn.telia.com. [81.236.179.152])
        by smtp.gmail.com with ESMTPSA id q13sm357761lfk.65.2019.06.14.01.16.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 01:16:24 -0700 (PDT)
Date:   Fri, 14 Jun 2019 10:16:20 +0200
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com,
        jarkko.sakkinen@linux.intel.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com, ard.biesheuvel@linaro.org,
        daniel.thompson@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tee-dev@lists.linaro.org
Subject: Re: [RFC 2/7] tee: enable support to register kernel memory
Message-ID: <20190614081619.GB9347@jax.lan>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-3-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560421833-27414-3-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 13, 2019 at 04:00:28PM +0530, Sumit Garg wrote:
> Enable support to register kernel memory reference with TEE. This change
> will allow TEE bus drivers to register memory references.
> 
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>


Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks,
Jens
