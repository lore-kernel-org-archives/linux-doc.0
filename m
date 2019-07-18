Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 445857D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 18 Jul 2019 22:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfGRWA5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 18:00:57 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46713 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfGRWA5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jul 2019 18:00:57 -0400
Received: by mail-pg1-f193.google.com with SMTP id i8so13474987pgm.13
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2019 15:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8xR8jl+9vgMnbRgGnFx+VtGRpj/KzIWKtjg0q2reL/k=;
        b=fvjXH2nbjQoatTbzrPNj3OZ46b6cJ+8n6SnDBNxFLsZs+Ehs5Nb2/vKueM3hgJyOJK
         driQhgj5ndG2WvD3hJDb/eqBOZJjflB58QRW/rS+Ul8xcwNxLk/NouJA0iGnkoyDGFRk
         eBOQekrr6gV7U/V3SAiqCidSranhnIz6b24Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8xR8jl+9vgMnbRgGnFx+VtGRpj/KzIWKtjg0q2reL/k=;
        b=ViwIQd8iudJXlC2ujTATXbje1t8GEfdmk72dOoM+cDeK0j7kMh3V78rn+elD3PwEGS
         5Zu/d1W5F4rSdGky1RQPn5KBqUBA5hx3399m5ENm1sxBcy8E4whV2Fp8IQ6kA587lrSZ
         vBK1XgzxsurxqJFLdqxV/9seMgMoUl5g499ZXsnogGnQyn3Q6h9lhH56WUIxFgEbPAFE
         LxD7h0G+SB7WWGfrj+oTgO6reCEDYMzIp8qTPdo5TyzgCFz7EI2ODoHtCKQ49lNHyXEb
         S4Y6qOPMNhABgrtK7iwjAeZXL3uFGFAKfEZUR2pvgRh3tfj0T1QfdvG4KITP6hzMzTS+
         d3Ww==
X-Gm-Message-State: APjAAAXSYV2Hn9IKBTSXasj1mQpzQAZS8Z4Gs6VdiT4dsKwfflJN0uBG
        kgowzatNv32UQRaaCwsRIbGOQg==
X-Google-Smtp-Source: APXvYqwHrAAKS7n0aYl9H4nAYcLxIe5S0CqR2dUHEXjXNNZYBdVXXjPs1QuIMv19nVjZhcPF43F+OQ==
X-Received: by 2002:a63:3203:: with SMTP id y3mr50691914pgy.191.1563487256758;
        Thu, 18 Jul 2019 15:00:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 124sm30444223pfw.142.2019.07.18.15.00.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2019 15:00:56 -0700 (PDT)
Date:   Thu, 18 Jul 2019 15:00:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     corbet@lwn.net, solar@openwall.com, will@kernel.org,
        peterz@infradead.org, gregkh@linuxfoundation.org,
        tyhicks@canonical.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/security-bugs: provide more information
 about linux-distros
Message-ID: <201907181457.D61AC061C@keescook>
References: <20190717231103.13949-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717231103.13949-1-sashal@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 17, 2019 at 07:11:03PM -0400, Sasha Levin wrote:
> Provide more information about how to interact with the linux-distros
> mailing list for disclosing security bugs.
> 
> Reference the linux-distros list policy and clarify that the reporter
> must read and understand those policies as they differ from
> security@kernel.org's policy.
> 
> Suggested-by: Solar Designer <solar@openwall.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sorry, but NACK, see below...

> ---
> 
> Changes in v2:
>  - Focus more on pointing to the linux-distros wiki and policies.

I think this is already happening in the text. What specifically do you
want described differently?

>  - Remove explicit linux-distros email.

I don't like this because we had past trouble with notifications going
to the distros@ list and leaking Linux-only flaws to the BSDs. As there
isn't a separate linux-distros wiki, the clarification of WHICH list is
needed.

>  - Remove various explanations of linux-distros policies.

I don't think there's value in removing the Tue-Thu comment, nor
providing context for why distros need time. This has been a regular
thing we've had to explain to researchers that aren't familiar with
update procedures and publication timing.

-Kees

> 
>  Documentation/admin-guide/security-bugs.rst | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/security-bugs.rst b/Documentation/admin-guide/security-bugs.rst
> index dcd6c93c7aac..380d44fd618d 100644
> --- a/Documentation/admin-guide/security-bugs.rst
> +++ b/Documentation/admin-guide/security-bugs.rst
> @@ -60,16 +60,15 @@ Coordination
>  ------------
>  
>  Fixes for sensitive bugs, such as those that might lead to privilege
> -escalations, may need to be coordinated with the private
> -<linux-distros@vs.openwall.org> mailing list so that distribution vendors
> -are well prepared to issue a fixed kernel upon public disclosure of the
> -upstream fix. Distros will need some time to test the proposed patch and
> -will generally request at least a few days of embargo, and vendor update
> -publication prefers to happen Tuesday through Thursday. When appropriate,
> -the security team can assist with this coordination, or the reporter can
> -include linux-distros from the start. In this case, remember to prefix
> -the email Subject line with "[vs]" as described in the linux-distros wiki:
> -<http://oss-security.openwall.org/wiki/mailing-lists/distros#how-to-use-the-lists>
> +escalations, may need to be coordinated with the private linux-distros mailing
> +list so that distribution vendors are well prepared to issue a fixed kernel
> +upon public disclosure of the upstream fix. Please read and follow the policies
> +of linux-distros as specified in the linux-distros wiki page before reporting:
> +<https://oss-security.openwall.org/wiki/mailing-lists/distros>. When
> +appropriate, the security team can assist with this coordination, or the
> +reporter can include linux-distros from the start. In this case, remember to
> +prefix the email Subject line with "[vs]" as described in the linux-distros
> +wiki.
>  
>  CVE assignment
>  --------------
> -- 
> 2.20.1
> 

-- 
Kees Cook
