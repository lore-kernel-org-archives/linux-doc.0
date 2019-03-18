Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D06A67D91B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 09:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfCRJoR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 05:44:17 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38615 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfCRJoQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 05:44:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id e10so8994262edy.5
        for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2019 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeblueprint-co-uk.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gtJhz+T6yhWz4Q0lswqgloB8spv5P7kk9/nOirIG984=;
        b=SKP7oCf+b68yq935JlZvfVCJs7+A3FntsgYQ3XJ9zwn9mNMk4wLN6F66/PM7D7OwSA
         8pjgRg7vHxdu/9ysWtkNQRT3iwrbiW2f95+K0hUrxOmxW83eTLg33vyZQvOgKtugLmDh
         R3Yf6al9zBQiOqQ6NlZ9Y3c3Vj6A+tntCSqQPpK2eAjAbYFrECway0zffLt+2P5eBneG
         hHgSlfj4djDYIhYOftmJNs8AMNjpj+uHwLVcwFaiLQbDgHMA99SY/vEnt+IwmIwrDQSC
         ZgcmklHb3Vli41SjU5vKBRziZ90x3t85J8g9XNtm4OksbC8Ibw/iqAasDpS3IZ0WXueI
         KzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gtJhz+T6yhWz4Q0lswqgloB8spv5P7kk9/nOirIG984=;
        b=grdDYRM3bQTHx0IJnIzmKlBw/WWa6kXu9fiqomIi9dkMZtsnE0uxyZRlxBfV6HqVx/
         oO4ZoSqjDoN4GyJcZfHgpxjCwsEDRVyrRYrY1N9pD0NckPzjoYBzr8uV2yK3BeCL7Z9t
         lEiKbHkDh6oSpOuPgfSCmr2BjzHUPMv/OLrIYnvdC+YIl8OOYeQw4JD+YhYh4YZVr1im
         keubdOGUOo+w+ueu6CnnRwLfwFWJimEpNMaZmxNd2iPxDolAPQ5NN08YX5B34DeEZEnQ
         +YrTNqQSr9ZwC3L+M2czUMHTugdGD0+LOxD6yNrNhunlPx4XkVrfeBIh8RpDGqnF3pU7
         w8uw==
X-Gm-Message-State: APjAAAX1WGKaoyfJrZU5ss12KRsDSjhom6IPL8V4Cdpoo+OrgnYqRRy1
        C3iUO2f/Yq++nFyxf5w+xLENQQ==
X-Google-Smtp-Source: APXvYqydwhMXX4paajtBtGCGNCX2O5Sjddg4lcCJaFVHmOclBZtqL5+Blm1EaTOPitLzNRYI1Z4W9A==
X-Received: by 2002:a17:906:1c98:: with SMTP id g24mr3913100ejh.178.1552902254440;
        Mon, 18 Mar 2019 02:44:14 -0700 (PDT)
Received: from localhost ([94.1.148.67])
        by smtp.gmail.com with ESMTPSA id w9sm746377edw.41.2019.03.18.02.44.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 02:44:13 -0700 (PDT)
Date:   Mon, 18 Mar 2019 09:44:12 +0000
From:   Matt Fleming <matt@codeblueprint.co.uk>
To:     Juergen Gross <jgross@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        x86@kernel.org, corbet@lwn.net, hpa@zytor.com, bp@alien8.de,
        mingo@redhat.com, tglx@linutronix.de, konrad.wilk@oracle.com,
        mfleming@suse.com, ross.philipson@oracle.com,
        daniel.kiper@oracle.com
Subject: Re: [PATCH] doc: add boot protocol 2.13 description to
 Documentation/x86/boot.txt
Message-ID: <20190318094412.GA18161@codeblueprint.co.uk>
References: <20190308114310.25041-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190308114310.25041-1-jgross@suse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 08 Mar, at 12:43:10PM, Juergen Gross wrote:
> Documentation/x86/boot.txt is missing protocol 2.13 description.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  Documentation/x86/boot.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/x86/boot.txt b/Documentation/x86/boot.txt
> index f4c2a97bfdbd..223e484a1304 100644
> --- a/Documentation/x86/boot.txt
> +++ b/Documentation/x86/boot.txt
> @@ -61,6 +61,10 @@ Protocol 2.12:	(Kernel 3.8) Added the xloadflags field and extension fields
>  		to struct boot_params for loading bzImage and ramdisk
>  		above 4G in 64bit.
>  
> +Protocol 2.13:	(Kernel 3.14) Support 32- and 64-bit flags being set in
> +		xloadflags to support booting a 64-bit kernel from 32-bit
> +		EFI
> +
>  **** MEMORY LAYOUT
>  
>  The traditional memory map for the kernel loader, used for Image or
> -- 
> 2.16.4
 
Not sure if this has already been picked up but...

Reviewed-by: Matt Fleming <matt@codeblueprint.co.uk>
