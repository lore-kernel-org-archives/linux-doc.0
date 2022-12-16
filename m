Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6749C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 16 Dec 2022 14:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiLPOfL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Dec 2022 09:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiLPOfK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 09:35:10 -0500
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BA958BE3
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 06:35:07 -0800 (PST)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2BGEYmNH019640
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 09:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
        t=1671201290; bh=qd3CPexx4EUOMso6Z7mE0NS6yD0eZn69+xWu/wpfgB4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=d9QHqr6rItAHBfk0jT1BIr6bhb/uHk0r0DL1bWaTQKJN02nezpYEA5vgQPmDzVk+i
         3fMMpzfU8t+naj+iQ0R3ZdaE9JbzZSnaAJ5McAbE1l3tow6/18iTt5PVBfdD6JDOAz
         WukdoV7XCas7N2tMqC/5OHQJ7UJ1VTAi4fDXNu9R14r0Uixh03xeULthJHhVYvhjIr
         F+eXeQp9s7AV1OMeUtmy4JCATQ423g1EnGPAMdGVA8SHImerznMabYAE2VDsv+AIqB
         vPbjyc+fjIzK11FE0DX+SdD6d90aSrQxqP7J29prKxE1nK4mUYsXepvbOEz+42alF1
         5I6V5BAUeGQ0w==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id 11E7D15C40A2; Fri, 16 Dec 2022 09:34:48 -0500 (EST)
Date:   Fri, 16 Dec 2022 09:34:48 -0500
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
Message-ID: <Y5yCCN0W/P97hLU3@mit.edu>
References: <20221214185714.868374-1-tytso@mit.edu>
 <Y5wo2WblrsHpM8sH@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5wo2WblrsHpM8sH@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 16, 2022 at 03:14:17PM +0700, Bagas Sanjaya wrote:
> On Wed, Dec 14, 2022 at 01:57:14PM -0500, Theodore Ts'o wrote:
> > +* Software Engineers are not allowed to contribute patches to the Linux
> > +  kernel.
> 
> Software engineers turned product manager or support desk people?

Actually, what we were thinking of companies that were paranoid about
the GPL.  For example, there is a particular major hardware supplier
used by many in the Linux ecosystem where the senior management tends
to be mostly composed of patent lawyers....

(In the United States, most companies have employment contracts which
means that all intellectual output, either on or off work.  Which
means that some companies can prohibit their employees from
contributing anything to any open source project, even if the work is
done after hours on their own time.  So while "Level 0" may seem
horrific, there are software engineers in the US who are constrained
in this way.  If we can encourage those companies to move from Level 0
to Level 1, that's at least a step in the right direction.)

> > +  * The time interval between kernels used in the organization’s servers
> > +    and/or products, and the publication date of the upstream kernel
> > +    upon which the internal kernel is based.
> 
> I.e. the time for rebasing internal kernel against upstream one? For
> example rebasing against several stable minor releases (x.y.z) is easier
> than forward porting out-of-tree commits into new upstream release
> (x.y).

It's not necessarily the time to rebase the kernel.  It might take
less than, say, six years to rebase a product kernel based on 4.9 to
6.1.  But the company might decide not to expend the engineering
resources to do the work, but instead to continue shipping product or
using a data center kernel based on an antediluvian upstream release.
After all, there are many companies using RHEL/CentOS 7, whose kernel
is based on 3.10.  Yeah, with of tons of backports and (hopefully) all
of the necessary security patches, but is that really the best way to
run a railroad?

But, yes, if your point is that this metric doesn't distinguish
between an organization which is regularly keeping itself with the
very latest 4.9.336 kernel, as opposed to reguarly jumping to the most
recent LTS kernel (i.e., every year or every other years going from
5.4 to 5.10 to 5.15 to 6.1), yes that's true.

However, it may be that it's better to encourage companies to adopt an
"upstream-first" development model.  I attempted to capture this in
the metric, "number of out-of-tree commits present in internal
kernels".

						- Ted
