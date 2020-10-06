Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4820CC41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 06:42:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C468E20797
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 06:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601966533;
	bh=IEl0kKuVJ/RD+zUKJf/fDMYwBEIERa3g9HxZNp7xstU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=W2efUuakfwkgnHGVXCU4N8InVXW8wsDLqBIpVkK5E5VxeO7kbVuVjMraQ70Eoh7ka
	 Z+ktzQrJvLK4kJMcdEwXXPxB5T0bwQXnsnYC9E1zMrnBKlYHAaTfP9bh1QYjlXeVtM
	 e9j5RctVqrgrSTii5TXyU4QHMIsRx29qrcLMCD7M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgJFGmN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 02:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726769AbgJFGmN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 02:42:13 -0400
Received: from coco.lan (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C055320757;
        Tue,  6 Oct 2020 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601966532;
        bh=IEl0kKuVJ/RD+zUKJf/fDMYwBEIERa3g9HxZNp7xstU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MRCX853GuJjy9gYrG+JBO6vBt1Um5qvYezrgSpCTHfT2EyUD1hRdzBi1xFh8anm2A
         9M/WEk4v3R6XrmexZi3AvM5vZkV/cVh6nQ1cR711vsDo6N9SuzWJw0FpYYJTmHKwR+
         IKfuVMeer6XJ4ucr+Se01Q4Gj5iYIH7DvgI/evp8=
Date:   Tue, 6 Oct 2020 08:42:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        linux-kernel@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
Message-ID: <20201006084207.125c88d5@coco.lan>
In-Reply-To: <20201005101736.7adf4f46@lwn.net>
References: <ee1f16453ad40eae2603adfde5f6dda3ab1befc7.1601798520.git.mchehab+huawei@kernel.org>
        <20201005101736.7adf4f46@lwn.net>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 5 Oct 2020 10:17:36 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Sun,  4 Oct 2020 10:02:03 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > When kernel-doc is called via kerneldoc.py, there's no need to
> > auto-detect the Sphinx version, as the Sphinx module already
> > knows it. So, add an optional parameter to allow changing the
> > Sphinx dialect.
> > 
> > As kernel-doc can also be manually called, keep the auto-detection
> > logic if the parameter was not specified. On such case, emit
> > a warning if sphinx-build can't be found at PATH.
> > 
> > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/sphinx/kerneldoc.py |  5 ++++
> >  scripts/kernel-doc                | 40 ++++++++++++++++++++++++-------
> >  2 files changed, 37 insertions(+), 8 deletions(-)  
> 
> So I'm glad to see this.  Still not fully sold on the autodetection, but if
> we don't actually use it, maybe I can live with it :)
> 
> One little nit:
> 
> > diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> > index 233f610539f0..e9857ab904f1 100644
> > --- a/Documentation/sphinx/kerneldoc.py
> > +++ b/Documentation/sphinx/kerneldoc.py
> > +    } elsif ($cmd eq "sphinx-version") {
> > +	my $ver_string = shift @ARGV;
> > +	if ($ver_string =~ m/^(\d+)\.(\d+)\.(\d+)/) {
> > +	    $sphinx_major = $1;
> > +	    $sphinx_minor = $2;
> > +	    $sphinx_patch = $3;
> > +	} else {
> > +	    die "Sphinx version should be at major.minor.patch format\n";
> > +	}  
> 
> Can we allow just major.minor, with patch defaulting to zero?  People
> passing this by hand may not want to look up their patch version every
> time, and I doubt it will ever matter...

Sure. It should be easy to make the third argument optional, although
the regex will be a little more harder to understand.

Something like this should do the trick:

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 01efb0afb8c2..104d79949a8a 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -466,12 +466,16 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 	$show_not_found = 1;  # A no-op but don't fail
     } elsif ($cmd eq "sphinx-version") {
 	my $ver_string = shift @ARGV;
-	if ($ver_string =~ m/^(\d+)\.(\d+)\.(\d+)/) {
+	if ($ver_string =~ m/^(\d+)\.(\d+)(?:\.?(\d+)?)/) {
 	    $sphinx_major = $1;
 	    $sphinx_minor = $2;
-	    $sphinx_patch = $3;
+	    if ($3) {
+		$sphinx_patch = $3;
+	    } else {
+		$sphinx_patch = 0;
+	    }
 	} else {
-	    die "Sphinx version should be at major.minor.patch format\n";
+	    die "Sphinx version should either major.minor or major.minor.patch format\n";
 	}
     } else {
 	# Unknown argument

As right now we don't support Sphinx version 3.0[1], we're actually using just
$sphinx_major. So, I'm wonder if it would make sense to also make <minor>
optional.

The change would be trivial, although the regex will become even more
harder to read ;-)

[1] not sure how valuable would be adding support for Sphinx 3.0. While
I didn't make any tests, I'm strongly suspecting that, with the approach
we took for backward/forward compatibility, adding support for it
would mean to just do a trivial change at cdomain.py by applying a
patch that Markus did replacing a regex function that doesn't exist
anymore at Sphinx API and emulating C namespace with the logic I
already implemented. 

I guess I'll give it a try anyway, as it seems weird to have a gap
in the middle of the supported versions.


Thanks,
Mauro
