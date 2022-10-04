Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E03C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 08:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiJDICM convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 04:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJDICL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 04:02:11 -0400
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C265A2D744;
        Tue,  4 Oct 2022 01:02:10 -0700 (PDT)
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay04.hostedemail.com (Postfix) with ESMTP id 16E761A088F;
        Tue,  4 Oct 2022 08:02:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 9A03B20027;
        Tue,  4 Oct 2022 08:01:57 +0000 (UTC)
Message-ID: <30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com>
Subject: Re: [PATCH RESEND v4 1/2] get_maintainer: Print maintainer for S:
 Supported
From:   Joe Perches <joe@perches.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, corbet@lwn.net,
        linux@leemhuis.info, konstantin@linuxfoundation.org,
        krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org,
        akiyks@gmail.com
Cc:     linux-kernel@vger.kernel.org
Date:   Tue, 04 Oct 2022 01:02:04 -0700
In-Reply-To: <20221003162411.431774-2-bryan.odonoghue@linaro.org>
References: <20221003162411.431774-1-bryan.odonoghue@linaro.org>
         <20221003162411.431774-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Stat-Signature: iahy6xeopag81t7j4kqcsxtp9n3x4pga
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 9A03B20027
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18i8hBMokZefW1gOqUeSouxeZWu/m4/JRg=
X-HE-Tag: 1664870517-85405
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2022-10-03 at 17:24 +0100, Bryan O'Donoghue wrote:
> Throughout the documentation we make reference to maintainers as the people
> who ought to be mailed when sending patches.
> 
> Right now get_maintainer.pl returns "supporter" for maintained files which
> are denoted "S: Supported".

As it should.

I think this patch is misguided and do not agree with the concept.

Either do away with the concept of S: Supported or use it.

As is, it merely hides the actual content of the MAINTAINERS file.

A reader of the MAINTAINERS file would still see the actual value.
Using other options of get_maintainer.pl like --sections would show
the actual content.

Other options would still show S:
> 
> Update get_maintainer to output "maintainer" for "S: Supported" the
> differentiation between paid (v) non-paid maintainers doesn't impact who
> needs to be mailed for patch submissions.
[]
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
[]
> @@ -1283,7 +1283,7 @@ sub get_maintainer_role {
>  
>      $role = lc($role);
>      if      ($role eq "supported") {
> -	$role = "supporter";
> +	$role = "maintainer";
>      } elsif ($role eq "maintained") {
>  	$role = "maintainer";
>      } elsif ($role eq "odd fixes") {

