Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624825;
	b=nCtIehxI8nRdIicsDWIIsm/sR+TOpqPxZoMVeGz+cWAPQnfQ/VhFWXNuaMGDuAPw31j9
	 BOHWHpWNmCLe4wW6D/Ha1tTIR78lb6JtUqkwtRO2HDkHh/n6pDuaUZKtqdSX3kA94ufUt
	 /e2V/MOT8P6QgU8jaesTt4+tNX+GWKUlTVinecL0Y4/w5QoTgVucxaZTGpNkfc6BOGfYD
	 oA0CFkwRm8EA4xq/M5wFZ2Z82UxL6kJ1p7mhbWpqRlNTfVVMfu/462uu/qevc8gxzcRws
	 ylyr93JTkcefZv1UAm9gZ98f7mgIrd5H1Jeb1Sf88xkqs4i7LOQqHOC5ztlBpup5/rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624825;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2NrVmJtOzk0=;
	b=MdmNRq2GsAMcFZzROa6oEFbjiGX6BCHwRyoKMXwIPq6HNMCMPY4A4WQ4mCflIviFL0Jw
	 io6r6QPipnmnnRqhSRkDhRTXtUKn6JW4WMhd0J/q/CA7XJRIBzU3ogankA/fNz+t/ppBS
	 c/tJF2v8KJHUrAEuiKyRwlZUCUMvJmR2/0+dMpM1N0VJ0mPZwhKBDmhZdIkKGE1OCYkXw
	 7YZLsV6mUb5n6Vx40MhND7QAzA5BzHN1tuCzkodeZt6aFDh9+vVkvzW78EXKizFEBwNt1
	 DSF6PDdBNSO6BiktBcHGKPY3kySDBKuIaZUOf4YCL4BAyK/1HBjib32lBl8dlidOVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bLFxljkf;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3yATzR9k;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A85F606A33C
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A85F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=bLFxljkf;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3yATzR9k
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CF6F77A02FC
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 11:40:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 25 Nov 2026 11:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795624820; x=
	1795711220; bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2NrVmJtOzk0=; b=b
	LFxljkf8085SNZFqKfvwrHAtqBoWplskS4EhTwcIOygIXlMpueYzouSuFbldC+sP
	uIsVUp5qryri8PYOAkXTiIofqD+z7hcVXLM6foT03VpU6o216TmvQvhwWEsRMeBk
	vpgbY/BxXgj0NfhvAXm5WGFf6O51stvBstlDJJryy2UvELQeENzebFaGcM7ULfJt
	/j/g7LTh3jnC8y2mshporPnkNlWpwxe7sp/qy7kjq20L4EfPujxKLjye1wAt1Pwn
	x1bXMevQWust2/xNGvbVvzlIx1EuyUm5u53M+ABMrVlgvFViIfMi+uRNEKqgR+IW
	HJ52SX+3wLjv0bLjTM4Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795624820; x=1795711220; bh=kt6tgv5UI7YQxebVkamxE0GgtDlTk5lb2Nr
	VmJtOzk0=; b=3yATzR9kKoed0T8n2E4dRzPtrHf/ieP926YExKWer2F3SHLsc6Q
	pt+aTSxrDYiVcXV3AyRMwN9EDVRID12bCcvXcEaQ+TgV9GzrXfNi/PrUiq2gTh6B
	xu2O7qegtF8oyUBb2e+qAwvx11PvSMUuGIqqsxahZoAXssmg4pbOo4pJ/QW/XXF5
	qHBTYoCgwrJ1/5bAFyD43wqMgelFjrj8FNROs+lxsnWDdOfMwtN05VzZjqjLlkGe
	KSxXzvfp6GOJ6RZbwutHio2Y/0Kox5YZZ4oOPJfE4DxX0r9LVQnDJlB8Zlg0f0Nb
	6dY1iGyyZ79tHNfDXrUVc9byIwvUPSbYahw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795624820; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:EY1wAwGil5tEXA0X8ycq5Ygn03RiT/72WfiNvr7hN0a1LAI
	/DbX6jV9YIi+5d5mj7PdoQQdzq3O4asA1wR7dYDTUiOYQWH/FUWyqZX2DWLjdELj
	AFEdzYMvJUkyVGR2Fq7h5oUUnlDC2lIJCsTPNk6fFJ3sSdF818MlhUT4Lwtvtrhv
	ZSfEDoF0le+OwO93y7R51atFzI2ERZ8L0llq2NROGdkwscD4vntcoFdGEprkcYjz
	i0wFkajJUgP6XhKC/7v5FlKJy1pM7+AYMacxh+06viVOxGoa4WbdAJnpJjof3Z+m
	rrwE/eiG7ykJRSkkbl9QGW7zt+0TS90cMeiKWaQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VzbQwFow4I5mRyZL14MErE8FiLGvx6AWvz4eEeOhShY=:YHstVPHYNyvX4vpDklnY2CZmSxeOHydrehDj1hnjaY0=;
X-ME-Sender: <xms:dA8Ha6tSp93tD8jvM5G0qJTMnepTAo6f1pAjC7Yp1JSi512NImkJ_g>
    <xme:dA8Ha98SrhOq8nep0rEnZMXo53cHYdk5A8Y--PwT07Vcq-Fsu_7uCCh94X7OZW41l
    63D1H9MT7cHhu_TEJgTjYBpA0hKpOALC7eP8ZFySlBcZ_IfFZUE7Clh>
X-ME-Received: <xmr:dA8Ha8l-ogOVA0EZTJQ4E8rw3SNPJEh8bwv7KgSkNCHYhN7SKrYyK9-m334>
X-ME-Proxy-Cause: dmFkZTEkqydggF2VGN09a7SrKmgF7tz60VqDezGtPw/dRKooC7tyMsvMNLlCXGAviBqhDU
    93cLkBtcTF/ucCBSar36wkl3kd33JvHYspVdYeyipUmqt/l60Mse+Gn+BTfLSEw9fQzJCl
    yc7P8ea1mUpj5FldO3/aAmMN86Pwjz0uDh17n6Ww+tHCXnDH8anNJewq9AHIh8nXBSQH9Z
    NiV5XIMnehotIcMXVnD9pelppKHC5sYdrWwLE+Ye5A3bbtPEmFnwyOEZWbArkJNG04fNaB
    Db9QfGSYpAbQHWjYavuTzy0ax5RCEaY5cx8EBsnpJaoiUhT9FfKmmDN1TKMN8fKzwr2CLz
    vhm6Ft83kwzkesm1UcSf06EM+1IQaqji53VKv96ManUWeW99JSgoZG06nLHJs4zbru7r42
    cJnAMx9i12DJKeVeEhIZRtnRp1/ASlDe6thOSFfV0mNlTC9sGqOjoc1qE4LFV06Zg6Sd0W
    dXCaUVEsbiLRi8rvAwT9kThBXqIQa2AXWJ079Tk8y6n5EYoH15BZfLde0ga+L+0MXS/Z5T
    r0YRiMhFD+piPTcm2oP9XLqwsH2+ccusawVN2GJRnIP4AlgMUPt4u6Td6tJXfsaD64tBAq
    WpSoO9KOQZXDahQexVB7pwmv3/3A8uZDFTIebqWNt2br4QIAZcWX3KLHeOPg
X-ME-Proxy: <xmx:dA8Ha1PdyooxCku436jFU77-C4URK2gN2pMC6p4x8wYfUdobLXPWUA>
    <xmx:dA8HazIMvC3g0mfBxNeiKTuPQC6it0t6GaMQVIDaQGRtSqtO2YlV4Q>
    <xmx:dA8Ha4GbVkIe3gILDtnjNUZm_KCAwUYw0tK0luxoj_1Bq96MGfWqWw>
    <xmx:dA8Ha8AhLyZTomI_2pyw10xnx1OaeryX9UlK4oGIacs2CMc99ivcVw>
    <xmx:dA8Ha7fZaUimu3PLLh1tMaFCuDqVE2-pgwYmBKtbXcxgVcIOkX9AGJum>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 11:40:20 -0500 (EST)
Date: Wed, 25 Nov 2026 17:40:18 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Felipe Pereira Stival <v0idpwn@gmail.com>
Subject: Re: [PATCH net 2/2] selftests: tls: add a poll test for a queued
 KeyUpdate
Message-ID: <awcPcsS705o0Qacv@krikkit>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-2-8e25101e7be6@gmail.com>

2026-11-18, 17:35:49 -0300, Felipe Pereira Stival via B4 Relay wrote:
> From: Felipe Pereira Stival <v0idpwn@gmail.com>
> 
> Check that poll() reports a read event when a recv() for data has
> decrypted and queued a KeyUpdate. Once the KeyUpdate has been read,
> check that poll() doesn't report a record sent with the new key.
> 
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
> ---
>  tools/testing/selftests/net/tls.c | 40 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
