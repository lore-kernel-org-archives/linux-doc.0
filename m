Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7CEC04AA5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 06:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiHYGti (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 02:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbiHYGth (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 02:49:37 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A47DA0261;
        Wed, 24 Aug 2022 23:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
        Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
        Resent-Cc:Resent-Message-ID; bh=24hpcucyamml6m8NyNEu+3X+fzHuCVs+SB/I0KY36kc=;
        t=1661410177; x=1662619777; b=hyATOmoPVNbJJg6PefBiNT5gOA+H2AqLSVE0jtaNA81CmdD
        0sR7yInoG5IavIZtqbHckgayV5f6T4SPPSuZ3W2/XCp3+6a+b5dJ3uX0xIcuRbKugwuXX7thffzQm
        MCdt3+GxR4yZR6HG/ygtiw2FMBV02jccwHbgXDykJWo3QpbMnwJfaStunLatD9mWg7S5JYf84YWBj
        DnYqsJt9vA7rdM+j5TsiY4+3eS+2OY8uTdvuZwjrObOpNYr/uaKW0T4p7ZuvSL9/wrvyexcNhuwYH
        kcRsc+DaLdx4cCbgq97G736RaS32ya1O0GsKieMuYwkZ0ZqCAvN9yzbGt8Pni0kA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.96)
        (envelope-from <johannes@sipsolutions.net>)
        id 1oR6g6-00Gw3e-2M;
        Thu, 25 Aug 2022 08:49:22 +0200
Message-ID: <3950b10724620f23e3e84ec2686e5e6ac6fa5e0f.camel@sipsolutions.net>
Subject: Re: [PATCH net-next v2 2/6] netlink: add support for ext_ack
 missing attributes
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        mkubecek@suse.cz, corbet@lwn.net, jacob.e.keller@intel.com,
        fw@strlen.de, razor@blackwall.org, linux-doc@vger.kernel.org
Date:   Thu, 25 Aug 2022 08:49:21 +0200
In-Reply-To: <20220825024122.1998968-3-kuba@kernel.org>
References: <20220825024122.1998968-1-kuba@kernel.org>
         <20220825024122.1998968-3-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2022-08-24 at 19:41 -0700, Jakub Kicinski wrote:
>=20
> + * @miss_type: attribute type which was missing
> + * @miss_nest: nest missing an attribute (NULL if missing top level attr=
)

nit: maybe use %NULL for appropriate formatting in generated
documentation

>  	const char *_msg;
>  	const struct nlattr *bad_attr;
>  	const struct nla_policy *policy;
> +	const void *miss_nest;

Can be 'const struct nlattr *' now, no? No longer points to a random
header.

johannes
