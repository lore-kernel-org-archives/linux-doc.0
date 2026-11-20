Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.136.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210120;
	b=4UsU9tTUHqa4xA2NNNNUfSwRrKOvLdOZAktrwTYz/hnuFuSzrz8DHP1YZEtOC+zeTu3V
	 x0UnNVVzE9llm1CqwMNQ8oE7XN5ZP3m0B3R1k+Lm15SJcSlgGjwLd2wYc59e5B3GpaUHw
	 nCjF6NP865KMwsnqu6lVfwlJ3+r40qPtbrSRXhKSxUu5/nVSMKX7maUHym65BH7HfKNau
	 RIWfCXDFx48+D3P9ik9j0zqyxBUtStLuxik11fwjcpGm3IuVuOGiuGSSGP4xuKsRYOyAK
	 NKmdByRfN6VLO8hAEeIw0jIuBuoQWgNfI5jwI9gz6A46sUqQKAEXfH7h+jbVB3OLduQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210120;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=naEaD4YpWe3Shxw4+guWDoGoPtnn7xqfX4oJv7EZIOM=;
	b=dgR02hKtiUh9kt3K7kWTPDsaL3ttNbCiurFhVhzjN1Z+qS9O7WfwB2sy1v5sVppNA8k1
	 fHaddkArDUDYJFMAVKYvy5Cfa5MoIclfHndwf3k1yyV7tJtimy0RLRwEsesOoi/8mLKEQ
	 QjFLoQ87WjDRq8ZObvW6kJ/SI1VliSIBToiOzSlEn1BDkBly/1o64nxDAt3IJovD3wlL5
	 nhxu7LQ3UC4XcERTKfdxa6AnwfVFbAWKyKGYB2iXov8lcexgjWRdPPZl+Tk1qZPzfaolS
	 MrZbRkNtUrEzT6W2dnqTEXtCFWC+1y8hcskF0JzoMpqmPtX5zRx9EBXcTphaSvMpILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unibo.it;
	spf=pass smtp.mailfrom=cs.unibo.it;
	dkim=pass header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=FYumAXpr;
	arc=none smtp.remote-ip=130.136.161.50
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1192F606A684;
	Fri, 20 Nov 2026 21:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1192F606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=FYumAXpr
Received: from cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPSA id 9EAA61C007E;
	Fri, 20 Nov 2026 22:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1795210108;
	bh=x3B2s1APWxBBSLeZ9kG+9z74t/qJot5h+obwq2A0BhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYumAXprYIdO2B295hQWcmjvo6+tlHIGynsCT/3RMw+/P80LvZ5apbZaQB4w+ixCk
	 kQHxPL+v5h8TPqRgVVm4sNPBJKibZ67PawB9aIWD+hrobu66VKOw98veL47Ad76MkI
	 MvFp/R8xG7fnA1PXfINxmBFbTEfE5vFNzMCNje34=
Date: Fri, 20 Nov 2026 22:28:26 +0100
From: Renzo Davoli <renzo@cs.unibo.it>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-um@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: UML: user_mode_linux_howto_v2: Fix bracket
Message-ID: <awC7erLjtqyg2_dx@cs.unibo.it>
References: <20261120175509.1369714-2-manuelebnerli@mailbox.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120175509.1369714-2-manuelebnerli@mailbox.org>

On Fri, Nov 20, 2026 at 06:55:09PM +0100, Manuel Ebner wrote:
> Add missing ')'.
> 
> CC: Renzo Davoli <renzo@cs.unibo.it>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
>  Correct position of closing bracket (Randy Dunlap)
> 
> [v1]
>  https://lore.kernel.org/all/20260909140051.1365758-2-manuelebnerli@mailbox.org/
> ---
>  Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index 9224bea5ee..e4b1cb1092 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -581,7 +581,7 @@ https://github.com/virtualsquare/sshlirp
>  
>  connect to a local area cloud (all the UML nodes using the same
>  multicast address running on hosts in the same multicast domain (LAN)
> -will be automagically connected together to a virtual LAN.
> +will be automagically connected together to a virtual LAN.)
>  
>  ***********
>  Running UML

Acked-By: Renzo Davoli <renzo@cs.unibo.it>
