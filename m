Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AD29439
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="s8s5pySf"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F94C6
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 06:46:12 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso1287349a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1697118370; x=1697723170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WL4o0PnlTALPx2JWXQcQVAR5wsdcklh2Oh9j6J5p78o=;
        b=s8s5pySfVGsOvbqrWvK2k8LuNwRuOVSZz33KIMLX/3ba1xPeA2UmJWZqChehN3e92F
         v04YzDGP7HVwEwYO5OWlA8ULMTru471sNQIbYNZww5xDJ311BvdxnWp1JFavlr9QOQLf
         wC/w7VNQabGsjUdburO0JP/G+GUbeKJJ4uZQrjlnFo0qJh0PJ21z3ZX7+2VlF9Hn7OZL
         Gvz3aGCRnONbfH7npfPypuDvMH4DqykZB0E0Rpx/XH88v8KC+ORzMTLPDWnvINrQxqAb
         v3k/b6+ljnzNqPNLgl5zsOELAweH2VCP9Q+e6yIAbQ/thAECha6Ai1PRSJJPeNa1EG1d
         bx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118370; x=1697723170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL4o0PnlTALPx2JWXQcQVAR5wsdcklh2Oh9j6J5p78o=;
        b=U7T5n8Ms6n7vpZE0VDFSUt5L0PPU9EO6D99g+tQaUy+gGGfT4GYmRIItjulRJvKmnq
         WSTYXZRhG61KFQaE8DAWT4OV/xQz6V/GqgfqN7VSrxeF0k+b+z5LG6i9uT4F18KjYoaI
         u8KJOdprpG4E9WDzl0v85jWANX6kDAAHLPDh/lcUkzzuWvki8pQm8qRbXyWZcpvIA2rT
         xLxzZha53B3aH1ZVpg4Ao+O75GAaKQekhASJ0hGdwHquBMwzsC2Z3aCHM2FFSbO4GwxL
         kNEGQjxxAE4AdvlzFxc/UgAI28TZF17t9G3YFf9gzWQ6gfRWR2WFhlzfbYOLtjU5Br3X
         jOvQ==
X-Gm-Message-State: AOJu0YwZaCNoCrOs1leEWR4/HhQ/NGvEH1gNP68frqqBbC4lZ+qa+pNb
	W6q9FsUzIiDJP25xQh7DZRKrYDTX7DmdUw/dt4Q=
X-Google-Smtp-Source: AGHT+IH59hmoDS+3N9HnCWrAqCjVPZ4ryC0EzwYrla5+l9OzTXH6ATWKCWWbfSW9us9NhxA/rflDvg==
X-Received: by 2002:aa7:d14c:0:b0:533:2327:1eed with SMTP id r12-20020aa7d14c000000b0053323271eedmr23591165edo.24.1697118370561;
        Thu, 12 Oct 2023 06:46:10 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id er24-20020a056402449800b0052febc781bfsm2998183edb.36.2023.10.12.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:46:09 -0700 (PDT)
Date: Thu, 12 Oct 2023 15:46:08 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Netdev <netdev@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wpan@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Rodolfo Zitellini <rwz@xhero.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] appletalk: make localtalk and ppp support
 conditional
Message-ID: <ZSf4oCBXZGi2BfqC@nanopsycho>
References: <20231011140225.253106-1-arnd@kernel.org>
 <ZSa5bIcISlvW3zo5@nanopsycho>
 <82527b7f-4509-4a59-a9cf-2df47e6e1a7c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82527b7f-4509-4a59-a9cf-2df47e6e1a7c@app.fastmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Wed, Oct 11, 2023 at 05:57:38PM CEST, arnd@arndb.de wrote:
>On Wed, Oct 11, 2023, at 17:04, Jiri Pirko wrote:
>> Could you provide a cover letter for the set please?
>
>Subject: [PATCH v2 00/10] remove final .ndo_do_ioctl references
>
>The .ndo_do_ioctl() netdev operation used to be how one communicates
>with a network driver from userspace, but since my previous cleanup [1],
>it is purely internal to the kernel.
>
>Removing the cops appletalk/localtalk driver made me revisit the
>missing pieces from that older series, removing all the unused
>implementations in wireless drivers as well as the two kernel-internal
>callers in the ieee802154 and appletalk stacks.
>
>One ethernet driver was already merged in the meantime that should
>have used .ndo_eth_ioctl instead of .ndo_do_ioctl, so fix that as well.
>With the complete removal, any future drivers making this mistake
>cause build failures that are easier to spot.

Looks fine.


>
>[1] https://lore.kernel.org/netdev/20201106221743.3271965-1-arnd@kernel.org/
>
>----
>Hope that helps, I had commented on the cops removal about sending
>this but of course not everyone here saw that. Let me know if I should
>resend the patches together with the cover letter.

Yes please. Thanks!


>
>    Arnd
