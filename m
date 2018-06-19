Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B4E27D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 14:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965504AbeFSOtN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 10:49:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38726 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S964999AbeFSOtM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 10:49:12 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5JEcrZS056953
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 10:49:12 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2jq3fksbcm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 10:49:11 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 19 Jun 2018 15:49:09 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 19 Jun 2018 15:49:07 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w5JEn6i335717162
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Jun 2018 14:49:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A105E42049;
        Tue, 19 Jun 2018 15:39:07 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2AA9842041;
        Tue, 19 Jun 2018 15:39:07 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.236])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 19 Jun 2018 15:39:07 +0100 (BST)
Date:   Tue, 19 Jun 2018 17:49:04 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] Documentation/sphinx: add "nodocs" directive
References: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com>
 <20180618171028.GD28748@bombadil.infradead.org>
 <20180619141156.GC1438@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180619141156.GC1438@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18061914-0008-0000-0000-00000249745C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18061914-0009-0000-0000-000021AFC162
Message-Id: <20180619144903.GE19099@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-19_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806190165
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 19, 2018 at 07:11:56AM -0700, Matthew Wilcox wrote:
> On Mon, Jun 18, 2018 at 10:10:28AM -0700, Matthew Wilcox wrote:
> > On Mon, Jun 18, 2018 at 04:36:34PM +0300, Mike Rapoport wrote:
> > > Hi,
> > > 
> > > These patches allow passing "-no-doc-sections" option to scripts/kernel-doc
> > > from the sphinx generator.
> > > 
> > > This allows to avoid duplicated DOC: sections when "kernel-doc:" directive
> > > is used without explicit selection of functions or function types. For
> > > instance, [1] has "IDA description" and "idr synchronization" twice.
> > 
> > Hah, I just found an abandoned patch for this in a disused git tree.
> > I was wondering whether I needed to resurrect it.  Enthusiastically,
> > 
> > Acked-by: Matthew Wilcox <willy@infradead.org>
> 
> Here's the patch I found (I couldn't refind it at the time):
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index d15e07f36881..d86d88da1d75 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -47,6 +47,7 @@ class KernelDocDirective(Directive):
>      optional_arguments = 4
>      option_spec = {
>          'doc': directives.unchanged_required,
> +        'nodoc': directives.unchanged,
>          'functions': directives.unchanged_required,
>          'export': directives.unchanged,
>          'internal': directives.unchanged,
> @@ -74,6 +75,8 @@ class KernelDocDirective(Directive):
>              export_file_patterns = str(self.options.get('internal')).split()
>          elif 'doc' in self.options:
>              cmd += ['-function', str(self.options.get('doc'))]
> +        elif 'nodoc' in self.options:
> +            cmd += ['-no-doc-sections']
>          elif 'functions' in self.options:
>              for f in str(self.options.get('functions')).split():
>                  cmd += ['-function', f]
> 
> I did it while I was trying to create good radix tree documentation,
> which led to me realising that was a Herculean task (specifically: the
> stables).
> 
> I ended up doing this instead:
> 
> +The Public API
> +==============
> +
> +The public API can be found in ``<linux/radix-tree.h>``.  To use a
> +radix tree in your data structure, embed a :c:type:`struct radix_tree_root`
> +in it, and initialise it using ``INIT_RADIX_TREE``.  You can also use
> +a file-local or global radix tree by defining a :c:type:`RADIX_TREE` as you
> +would a :c:type:`LIST_HEAD`.
> +
> +.. Not actually "internal", but I need to exclude the 'doc' paragraph, and
> +   this is the best way to do it.
> +.. kernel-doc:: include/linux/radix-tree.h
> +   :internal:
> +
> +.. kernel-doc:: lib/radix-tree.c
> +   :export:
> 
> I'm not sure if I agree with me-of-January-2017 that this is the "best"
> way to do it, but maybe that'll point to another way of achieving the
> same thing.
> 

Actually, in the IDR case the same trick would work.

In more general case it's even possible to use

.. kernel-doc:: path/to/file.c
   :export:

.. kernel-doc: path/to/file.c
   :internal:

and get all the functions without the docs sections :)

But IMHO having a directive for this would be nicer. If there are no
objections to Jani's  suggestion to use empty :functions: instead of
:nodoc: I'm going to send v2.

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
