Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9037C7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 05:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752308AbeFSFEH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 01:04:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45952 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751777AbeFSFEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 01:04:06 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w5J543Pa102809
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 01:04:06 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2jptjrsms3-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 01:04:05 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 19 Jun 2018 06:03:56 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 19 Jun 2018 06:03:53 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w5J53qJC34996370
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Jun 2018 05:03:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 00F7E42047;
        Tue, 19 Jun 2018 05:53:54 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8FFBB42041;
        Tue, 19 Jun 2018 05:53:53 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.236])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 19 Jun 2018 05:53:53 +0100 (BST)
Date:   Tue, 19 Jun 2018 08:03:50 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/sphinx: add "nodocs" directive
References: <1529328996-16247-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1529328996-16247-2-git-send-email-rppt@linux.vnet.ibm.com>
 <87h8lzyicj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h8lzyicj.fsf@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18061905-0028-0000-0000-000002D2588F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18061905-0029-0000-0000-000023899506
Message-Id: <20180619050349.GA19099@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-19_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806190058
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 11:01:32PM +0300, Jani Nikula wrote:
> On Mon, 18 Jun 2018, Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> > When kernel-doc:: specified in .rst document without explicit directives,
> > it outputs both comment and DOC: sections. If a DOC: section was explictly
> > included in the same document it will be duplicated. For example, the
> > output generated for Documentation/core-api/idr.rst [1] has "IDA
> > description" in the "IDA usage" section and in the middle of the API
> > reference.
> >
> > Addition of "nodocs" directive prevents the duplication without the need to
> > explicitly define what functions should be include in the API reference.
> >
> > [1] https://www.kernel.org/doc/html/v4.17/core-api/idr.html
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> > ---
> >  Documentation/sphinx/kerneldoc.py | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> > index fbedcc3..bc5dd05 100644
> > --- a/Documentation/sphinx/kerneldoc.py
> > +++ b/Documentation/sphinx/kerneldoc.py
> > @@ -50,6 +50,7 @@ class KernelDocDirective(Directive):
> >          'functions': directives.unchanged_required,
> >          'export': directives.unchanged,
> >          'internal': directives.unchanged,
> > +        'nodocs': directives.unchanged,
> 
> I'm not convinved this is the prettiest way to achieve what you
> want. 'nodocs' seems kind of clunky.
> 
> I'd suggest supporting 'functions' without option arguments, and turning
> that into kernel-doc -no-doc-sections.

Do you mean something like this:

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index fbedcc3..9d0a7f0 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -47,7 +47,7 @@ class KernelDocDirective(Directive):
     optional_arguments = 4
     option_spec = {
         'doc': directives.unchanged_required,
-        'functions': directives.unchanged_required,
+        'functions': directives.unchanged,
         'export': directives.unchanged,
         'internal': directives.unchanged,
     }
@@ -75,8 +75,12 @@ class KernelDocDirective(Directive):
         elif 'doc' in self.options:
             cmd += ['-function', str(self.options.get('doc'))]
         elif 'functions' in self.options:
-            for f in str(self.options.get('functions')).split():
-                cmd += ['-function', f]
+            functions = self.options.get('functions').split()
+            if functions:
+                for f in functions:
+                    cmd += ['-function', f]
+            else:
+                cmd += ['-no-doc-sections']
 
         for pattern in export_file_patterns:
             for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):

> The usage in patch 2/2 would turn into:
> 
> .. kernel-doc:: include/linux/idr.h
>    :functions:
> 
> which I think is much better overall in the rst source, complementing
> the places where you use :doc:.
> 
> BR,
> Jani.
> 
> >      }
> >      has_content = False
> >  
> > @@ -77,6 +78,8 @@ class KernelDocDirective(Directive):
> >          elif 'functions' in self.options:
> >              for f in str(self.options.get('functions')).split():
> >                  cmd += ['-function', f]
> > +        elif 'nodocs' in self.options:
> > +            cmd += ['-no-doc-sections']
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
