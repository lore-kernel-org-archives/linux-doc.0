Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C23EBE
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616062; cv=none; b=e+4h1PM5U/cHv5m3jhTG3yg3f7gjzbO6VGZj5RoxkBdvACrG7IrveTOlCPM3BNJd44+NwnX5SrGwDpbltWBL5DF7TBUHNbrAj1QMg9hAPyu3j+fW5jBs1rVfz3fNxyhvGHO46EIsEF2rdf1qcnO9R/0vISxcb+NP3277zFu8Lk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616062; c=relaxed/simple;
	bh=Q4biByWkA/G17ooY1FJzdKkXEQinree0d+phIb6DSi8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LAjoVei6V3dNoL90gz1A533QklO6BHrTWPfP0rpUA58ZraaqwViPEwevzmWBhO3gr7s8rtLrJ3wbCqUPadPIqH61j3v5E+7vKoUxeHexlgKn5fXSdaq66r5L9H2aW6/WolW2efNLOD2+UbSOJhzmUsSWLef/FsOGNaX/I1R5RPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tb+F0Nk5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tb+F0Nk5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7Gcc17nAMKL7NkHaTFv2PCk7GlXg42Rpw8c4m6KlVnw=; b=Tb+F0Nk5p0NfCkXMu8KrHoZxj3
	YjeUGiS2giO+vAFRCMVoGADcX4WuHgpmUwNtOoyOaNZ8LEcpWtFuLqNE6fvtiFWhP7+icr0u+SMXL
	cszgN4JdICmYu1rQSmxQD00vg/ML46koi7byzcV1aFdrcoGLhzth+y/0ttMHP7Xmg5U9qf5z3eMMZ
	vPQJvLS0BfHz2CQc2ZZGPRHaqlypaVU5hmOxXP+bo+z6r5ve11Qw5Fk0/x0zk3gk70jjbnUZEJGX4
	g3wgcNpUTT4rkmvFVPffTUNgZ+R6BGR7qVnAuePxamx02WGUTqWFkK8Pk7eouLbbyFZV9q1O6ephl
	Psn6Mi6A==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sz5zm-00000005nfV-1g0i;
	Fri, 11 Oct 2024 03:07:17 +0000
Message-ID: <eef0d9af-4d04-46b1-b132-1213fa97b97b@infradead.org>
Date: Thu, 10 Oct 2024 20:07:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [partial fix] Re: [PATCH] mm, slab: add kerneldocs for common
 SLAB_ flags
From: Randy Dunlap <rdunlap@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Horia Geanta <horia.geanta@freescale.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20241009142936.56092-2-vbabka@suse.cz>
 <878quxe2kw.fsf@trenco.lwn.net>
 <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
 <878quxb4rm.fsf@trenco.lwn.net>
 <8b0c1bb9-4a9a-4f8e-87df-275994df739d@infradead.org>
 <1406d498-84bf-49aa-9efd-6480ad618582@infradead.org>
 <46c52676-c402-4b39-b634-a401f7a7a571@infradead.org>
 <5b16b00f-749c-431b-baeb-7accb76b492b@infradead.org>
Content-Language: en-US
In-Reply-To: <5b16b00f-749c-431b-baeb-7accb76b492b@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/24 4:54 PM, Randy Dunlap wrote:
> 
> 
> On 10/10/24 4:43 PM, Randy Dunlap wrote:
>>
>>
>> On 10/9/24 10:06 PM, Randy Dunlap wrote:
>>>
>>>
>>> On 10/9/24 3:02 PM, Randy Dunlap wrote:
>>>>
>>>>
>>>> On 10/9/24 9:49 AM, Jonathan Corbet wrote:
>>>>> Vlastimil Babka <vbabka@suse.cz> writes:
>>>>>
>>
>> The main problem is that output_function_rst() does not support object-like macros while
>> output_function_man() does.  There is still a bunch of sphinx_version handling that I know
>> nothing about, so the present output (after my trivial patch) leaves more to be done.
>>
>> Well, the *main* problem is that the output is not consistent. Sometimes my tests don't fail
>> as they did at first.
>>
>>
>> This patch drops the trailing "()" for object-like macros in output_function_rst()
>> but there is still more to be done.
>>
>> ---------------------

This one mostly works for me although I don't care for the second line
here. I guess it has something to do with cross-referencing(?), but IDK.


"""
SLAB_TYPESAFE_BY_RCU
``SLAB_TYPESAFE_BY_RCU ``

WARNING READ THIS!

Description
"""

---
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kernel-doc: allow object-like macros in ReST output

output_function_rst() does not handle object-like macros. It presents
a trailing "()" while output_function_man() handles these macros
correctly.

Fixes: cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Horia Geanta <horia.geanta@freescale.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Vlastimil Babka <vbabka@suse.cz>
---
 scripts/kernel-doc |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

--- linux-next-20241009.orig/scripts/kernel-doc
+++ linux-next-20241009/scripts/kernel-doc
@@ -822,10 +822,13 @@ sub output_function_rst(%) {
     my $oldprefix = $lineprefix;
 
     my $signature = "";
+    my $noret = 0;
+
     if ($args{'functiontype'} ne "") {
         $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
     } else {
-        $signature = $args{'function'} . " (";
+        $signature = $args{'function'} . " ";
+    	$noret = 1;
     }
 
     my $count = 0;
@@ -844,7 +847,9 @@ sub output_function_rst(%) {
         }
     }
 
-    $signature .= ")";
+    if (!$noret) {
+    	$signature .= ")";
+    }
 
     if ($sphinx_major < 3) {
         if ($args{'typedef'}) {
@@ -890,7 +895,9 @@ sub output_function_rst(%) {
     #
     print ".. container:: kernelindent\n\n";
     $lineprefix = "  ";
-    print $lineprefix . "**Parameters**\n\n";
+	if (!$noret) {
+   		print $lineprefix . "**Parameters**\n\n";
+    }
     foreach $parameter (@{$args{'parameterlist'}}) {
         my $parameter_name = $parameter;
         $parameter_name =~ s/\[.*//;

