Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511C7107A4
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8E1DE;
	Sun, 22 Oct 2023 09:05:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id CA856200E2;
	Sun, 22 Oct 2023 18:05:40 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DAMYAxkFqZs1; Sun, 22 Oct 2023 18:05:40 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr [83.192.234.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9DD8F200D9;
	Sun, 22 Oct 2023 18:05:40 +0200 (CEST)
Received: from samy by begin with local (Exim 4.97-RC1)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1quaxQ-0000000BZRg-10Rd;
	Sun, 22 Oct 2023 18:05:40 +0200
Date: Sun, 22 Oct 2023 18:05:40 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Osama Muhammad <osmtendev@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mushahid Hussain <mushi.shar@gmail.com>
Subject: Re: [PATCH] Documentation: speakup: Update speakup docs
Message-ID: <20231022160540.ehyx4v6wj3n54rmr@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Osama Muhammad <osmtendev@gmail.com>, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mushahid Hussain <mushi.shar@gmail.com>
References: <20231022155853.16061-1-osmtendev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022155853.16061-1-osmtendev@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Osama Muhammad, le dim. 22 oct. 2023 20:58:53 +0500, a ecrit:
> This patch removes the line which is no longer true speakup
> supports USB connections now.
> 
> Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
> Signed-off-by: Mushahid Hussain <mushi.shar@gmail.com>

I have already submitted a documentation update the other day :)

Samuel

> ---
>  Documentation/admin-guide/spkguide.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/spkguide.txt b/Documentation/admin-guide/spkguide.txt
> index 74ea7f391942..019dc8bc2a05 100644
> --- a/Documentation/admin-guide/spkguide.txt
> +++ b/Documentation/admin-guide/spkguide.txt
> @@ -83,8 +83,7 @@ spkout -- Speak Out
>  txprt -- Transport
>  dummy -- Plain text terminal
>  
> -Note: Speakup does * NOT * support usb connections!  Speakup also does *
> -NOT * support the internal Tripletalk!
> +Note: Speakup does * NOT * support the internal Tripletalk!
>  
>  Speakup does support two other synthesizers, but because they work in
>  conjunction with other software, they must be loaded as modules after
> -- 
> 2.34.1
> 
