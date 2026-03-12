Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413B39768D;
	Thu, 12 Mar 2026 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349159; cv=none; b=XKInuClo1umTiisMQ68bTlCn2sn0nPSGeeX/+8glkmZgBMYYmr09CyZa9HPrBs4skMQbfDtlvWhUOKzO/8zrldblexTpsXWy209/ybPaojmQwSN+S2fQkDzvrCPj3rScJSGQWdoaO7kC4qzgjAksjGvGqhuC4iNeYpJgFIRM1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349159; c=relaxed/simple;
	bh=MdO/M2VR1g5VhqgUcseeVwckdzuozfC7P59lnIa9Sx0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BKmy6imES2j/Ua7JCqz8zMi3zchyky3glSIlw51vC/SGOHZpvsYI+xFRse+B4qHque3rziM4LyBcv9eyVyuy8lByU+2uxUObunu7vVYuFYi9dSPNSujmPZknpNPQcqDkCNep9U8+ycYUZ6XstTSbQD57AA8EkKXPrPp7S6XpQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 0599F1A03AD;
	Thu, 12 Mar 2026 20:59:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf16.hostedemail.com (Postfix) with ESMTPA id 3F86E20013;
	Thu, 12 Mar 2026 20:59:07 +0000 (UTC)
Message-ID: <9c72e4b081931e0656caa54c577cecd5ac1f7304.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: add support for Assisted-by tag
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Bart Van Assche <bvanassche@acm.org>, Jonathan
 Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Date: Thu, 12 Mar 2026 13:59:04 -0700
In-Reply-To: <20260311215818.518930-1-sashal@kernel.org>
References: <65ad15f96429d87225867e982cd1aab2@perches.com>
	 <20260311215818.518930-1-sashal@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 3F86E20013
X-Stat-Signature: 1siw5oshuca61ho8aeosmhsbo4t73b4g
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Cqad4kdsS/wFB+z3N7bKKVuzrBRLMK0o=
X-HE-Tag: 1773349147-387614
X-HE-Meta: U2FsdGVkX19vg8NopOZ8hbqybz/mR3TAm1tcRW1U4Q65uH2m2FkI6AHgfrkDMChZN3qrNSGSowyyYXaimBw8RxPHbaHafe7bW3ZEfI8iPeIyR0S/TW7bPuq7AyQxAg2z3tiBJ8CDAoLHly0dxZ3ChadAABrlPXxNABezqPHXPdEgEFxeu0Axy/1U1mEh1u3xNhLaE767BLFxRuqCBN92mYeBhLu7jJK8O2tUoLYe45XLMsn90Eccj7edIBq6ESOeMExtEE9QYu10Q44+4K29oaNdXbZ/qP/GUB0AJ6ZgnJzqlOBRITrAkmFyErRRLFuaFuC0kBtk3h55rqaPdoAt3Tdax09O9xiRlgXLT2/yckAveWNmGqMTMsAPs3ENicqA

On Wed, 2026-03-11 at 17:58 -0400, Sasha Levin wrote:
> The Assisted-by tag was introduced in
> Documentation/process/coding-assistants.rst for attributing AI tool
> contributions to kernel patches. However, checkpatch.pl did not
> recognize this tag, causing two issues:
>=20
>   WARNING: Non-standard signature: Assisted-by:
>   ERROR: Unrecognized email address: 'AGENT_NAME:MODEL_VERSION'

Acked-by: Joe Perches <joe@perches.com>

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -641,6 +641,7 @@ our $signature_tags =3D qr{(?xi:
>  	Reviewed-by:|
>  	Reported-by:|
>  	Suggested-by:|
> +	Assisted-by:|
>  	To:|
>  	Cc:
>  )};
> @@ -3105,6 +3106,15 @@ sub process {
>  				}
>  			}
> =20
> +			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
> +			if ($sign_off =3D~ /^Assisted-by:/i) {
> +				if ($email !~ /^\S+:\S+/) {
> +					WARN("BAD_SIGN_OFF",
> +					     "Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]=
' format\n" . $herecurr);
> +				}
> +				next;
> +			}
> +
>  			my ($email_name, $name_comment, $email_address, $comment) =3D parse_e=
mail($email);
>  			my $suggested_email =3D format_email(($email_name, $name_comment, $em=
ail_address, $comment));
>  			if ($suggested_email eq "") {
>=20
