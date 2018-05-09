Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 91BC47DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934553AbeEIMcZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:32:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60342 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934126AbeEIMcX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 08:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PJ+jDccTd7ZHGMbCFLmCQENhVSBHyhvrj8oOlTwWvzw=; b=FGyGxPl9CVw0DUQWWLJiRnHYB
        OlDweZVrdCKtc+mq8O5vya5A7++6YdVpLTlTaWqfRVjXQp0P+rlVUCRwfGIQc+31EP67+Bvd1BlzY
        sZICFvwKBRqbRUaBiyrvwx4SBiW6OW/HCrNSzPPyMt+gHLkTQDa6Z6BX0vRmekseDKQfGw99wgJSi
        N0UXh1qSO/uQRm8Pm/EjvbV/jtb8IK4mVRsYdfd0eXbSaBLloRT1g956/usSOfD/Ll7wGDAIhKjjL
        wk5rgxFmP1fkRM4YxOHFuApVzHwIAJxvkVNiuS7M/vOdHBRpIBn2alLnYW9pOWHn+l8sWGasEaVyu
        fDxNHHoKQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGOGc-000702-0c; Wed, 09 May 2018 12:32:22 +0000
Date:   Wed, 9 May 2018 09:32:18 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Evgeniy Polyakov <zbr@ioremap.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 18/18] w1: w1_io.c: fix a kernel-doc warning
Message-ID: <20180509093218.5e566439@vento.lan>
In-Reply-To: <702861525777419@web22j.yandex.ru>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <cover.1525684985.git.mchehab+samsung@kernel.org>
        <cd5b6e6a8d51820ee158127cdd50e44645c44ee7.1525684985.git.mchehab+samsung@kernel.org>
        <702861525777419@web22j.yandex.ru>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 08 May 2018 14:03:39 +0300
Evgeniy Polyakov <zbr@ioremap.net> escreveu:

> Hi
>=20
> 07.05.2018, 12:36, "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>:
> > Add a blank line to avoid this Sphinx warning:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0./drivers/w1/w1_io.c:19=
7: WARNING: Definition list ends without a blank line; unexpected unindent.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org> =20
>=20
> Looks good to me, thank you!
> What tree should this be forwarded to, or folks from linux doc will pick =
it up?
>=20
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

Jon prefers if this could go via the usual maintainer's tree.

So, could you send it via yours?

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
