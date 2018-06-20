Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C54117D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 08:49:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932411AbeFTItY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 04:49:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33538 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754575AbeFTItU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 04:49:20 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5K8hpr3023173
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 04:49:19 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2jqkc9rw84-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 04:49:19 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 20 Jun 2018 09:49:17 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 20 Jun 2018 09:49:15 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w5K8nEDM36176066
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 Jun 2018 08:49:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 331CDA405B;
        Wed, 20 Jun 2018 09:39:55 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C14A4A4053;
        Wed, 20 Jun 2018 09:39:54 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.73])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 20 Jun 2018 09:39:54 +0100 (BST)
Date:   Wed, 20 Jun 2018 11:49:12 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation/sphinx: allow "functions" with no
 parameters
References: <1529468469-10088-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1529468469-10088-2-git-send-email-rppt@linux.vnet.ibm.com>
 <878t79x6uv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878t79x6uv.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18062008-0020-0000-0000-0000029CDC30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18062008-0021-0000-0000-000020E92D3E
Message-Id: <20180620084911.GB11493@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-20_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806200100
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 20, 2018 at 10:19:36AM +0300, Jani Nikula wrote:
> On Wed, 20 Jun 2018, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> > When kernel-doc:: specified in .rst document without explicit directives,
> > it outputs both comment and DOC: sections. If a DOC: section was explicitly
> > included in the same document it will be duplicated. For example, the
> > output generated for Documentation/core-api/idr.rst [1] has "IDA
> > description" in the "IDA usage" section and in the middle of the API
> > reference.
> >
> > This patch enables using "functions" directive without parameters to output
> > all the documentation excluding DOC: sections.
> >
> > [1] https://www.kernel.org/doc/html/v4.17/core-api/idr.html
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> > Acked-by: Matthew Wilcox <willy@infradead.org>
> 
> Looks good to me. Though I do realize now that I overlooked that this
> applies to not only functions, but also to other non-DOC documentation
> comments. I guess up to Jon to decide.
 
We can name it "everything-except-doc-sections" ;-)

> Please do give the cobbler's children some shoes, and document this in
> Documentation/doc-guide/kernel-doc.rst.

Sure. I'd just wait until there's consensus on the name :)

> Thanks,
> Jani.
> 
> > ---
> >  Documentation/sphinx/kerneldoc.py | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> > index fbedcc3..9d0a7f0 100644
> > --- a/Documentation/sphinx/kerneldoc.py
> > +++ b/Documentation/sphinx/kerneldoc.py
> > @@ -47,7 +47,7 @@ class KernelDocDirective(Directive):
> >      optional_arguments = 4
> >      option_spec = {
> >          'doc': directives.unchanged_required,
> > -        'functions': directives.unchanged_required,
> > +        'functions': directives.unchanged,
> >          'export': directives.unchanged,
> >          'internal': directives.unchanged,
> >      }
> > @@ -75,8 +75,12 @@ class KernelDocDirective(Directive):
> >          elif 'doc' in self.options:
> >              cmd += ['-function', str(self.options.get('doc'))]
> >          elif 'functions' in self.options:
> > -            for f in str(self.options.get('functions')).split():
> > -                cmd += ['-function', f]
> > +            functions = self.options.get('functions').split()
> > +            if functions:
> > +                for f in functions:
> > +                    cmd += ['-function', f]
> > +            else:
> > +                cmd += ['-no-doc-sections']
> >  
> >          for pattern in export_file_patterns:
> >              for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> 

-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
