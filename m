Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA6A3717D
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 17:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447EBC1;
	Thu, 26 Oct 2023 10:48:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 9732620147;
	Thu, 26 Oct 2023 19:48:37 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fvJ5epDCmzBL; Thu, 26 Oct 2023 19:48:37 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr [83.192.234.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6B58620145;
	Thu, 26 Oct 2023 19:48:37 +0200 (CEST)
Received: from samy by begin with local (Exim 4.97-RC3)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1qw4TE-0000000CKrn-3w8g;
	Thu, 26 Oct 2023 19:48:36 +0200
Date: Thu, 26 Oct 2023 19:48:36 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: Document USB support
Message-ID: <20231026174836.dak6lnrdnuggqrpe@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20231020181059.7rtj2csi7t6vorrm@begin>
 <87fs1x70cr.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs1x70cr.fsf@meer.lwn.net>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Jonathan Corbet, le jeu. 26 oct. 2023 11:35:48 -0600, a ecrit:
> We *still* really need to fix the license for this document, though...

On that front, I didn't manage to reach the original author, Gene
Collins. I don't actually know whether he is still alive, actually.

Samuel
