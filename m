Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34558C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 07:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCF9E2078E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 07:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgJFHen (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 03:34:43 -0400
Received: from smtprelay0003.hostedemail.com ([216.40.44.3]:51024 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725912AbgJFHen (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 03:34:43 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 56F99182CED28;
        Tue,  6 Oct 2020 07:34:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: prose72_5d15fb9271c4
X-Filterd-Recvd-Size: 1996
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Tue,  6 Oct 2020 07:34:41 +0000 (UTC)
Message-ID: <1396a58e7155f13b9c24daffabafa29d8d9106a5.camel@perches.com>
Subject: Re: [PATCH] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        linux-kernel@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Date:   Tue, 06 Oct 2020 00:34:39 -0700
In-Reply-To: <20201006084207.125c88d5@coco.lan>
References: <ee1f16453ad40eae2603adfde5f6dda3ab1befc7.1601798520.git.mchehab+huawei@kernel.org>
         <20201005101736.7adf4f46@lwn.net> <20201006084207.125c88d5@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-10-06 at 08:42 +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 5 Oct 2020 10:17:36 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
[]
> Sure. It should be easy to make the third argument optional, although
> the regex will be a little more harder to understand.
> 
> Something like this should do the trick:
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
[]
> @@ -466,12 +466,16 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
>  	$show_not_found = 1;  # A no-op but don't fail
>      } elsif ($cmd eq "sphinx-version") {
>  	my $ver_string = shift @ARGV;
> -	if ($ver_string =~ m/^(\d+)\.(\d+)\.(\d+)/) {
> +	if ($ver_string =~ m/^(\d+)\.(\d+)(?:\.?(\d+)?)/) {

trivia: perhaps more readable as

	if ($ver_string =~ m/^(\d+)\.(\d+)(\.\d+)?/) {
	    $sphinx_major = $1;
	    $sphinx_minor = $2;
	    if (defined($3)) {
		$sphinx_patch = substr($3,1);
	    } else {
		$sphinx_patch = 0;
	    }


