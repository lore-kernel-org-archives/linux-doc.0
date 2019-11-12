Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 34C4F7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Nov 2019 14:17:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfKLORj convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Nov 2019 09:17:39 -0500
Received: from mga18.intel.com ([134.134.136.126]:41257 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727310AbfKLORi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Nov 2019 09:17:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 06:17:37 -0800
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="198091316"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 06:17:35 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
In-Reply-To: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
Date:   Tue, 12 Nov 2019 16:17:32 +0200
Message-ID: <87a79141s3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Nov 2019, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> Hi Jonathan, Federico,
>
> While I was writing some new docs for something else, I found that
> given that citations are global, some translations are overriding the
> normal citations.
>
> For instance, on:
>
>   https://www.kernel.org/doc/html/latest/process/programming-language.html
>
> We have the first link pointing to:
>
>   https://www.kernel.org/doc/html/latest/translations/it_IT/process/programming-language.html#c-language
>
> i.e. the Italian translation; which is clearly not intended. Rather,
> it should point to the URL the citation points to.
>
> This may have been my mistake originally, since I wrote the original
> file and used citations. Checking now other files around in Docs/, I
> see almost nobody uses citations and simply put raw URLs, have a
> bottom section on References/Bibliography or use inline hyperlinks.
>
> To be honest, after seeing how citations look in the rendered output,
> and given they are global, I think it may be simpler to just use
> inline hyperlinks. On the other hand, it is nice to have a common set
> of citations (to keep up to date both translations and other
> documents). However, if we do this, I guess we need to encourage
> people to deal with the Sphinx WARNINGs.
>
> How should we handle this? What should be encouraged for new docs?

Fix the references in both places to actually make them cross
references. See below.

BR,
Jani.


diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index e5f5f065dc24..59efa6d7a053 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -3,7 +3,7 @@
 Programming Language
 ====================
 
-The kernel is written in the C programming language [c-language]_.
+The kernel is written in the C programming language `[c-language]`_.
 More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
 under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
 (including some C99 features).
@@ -34,7 +34,7 @@ in order to feature detect which ones can be used and/or to shorten the code.
 
 Please refer to ``include/linux/compiler_attributes.h`` for more information.
 
-.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. _[c-language]: http://www.open-std.org/jtc1/sc22/wg14/www/standards
 .. [gcc] https://gcc.gnu.org
 .. [clang] https://clang.llvm.org
 .. [icc] https://software.intel.com/en-us/c-compilers
diff --git a/Documentation/translations/it_IT/process/programming-language.rst b/Documentation/translations/it_IT/process/programming-language.rst
index f4b006395849..b30661731911 100644
--- a/Documentation/translations/it_IT/process/programming-language.rst
+++ b/Documentation/translations/it_IT/process/programming-language.rst
@@ -8,7 +8,7 @@
 Linguaggio di programmazione
 ============================
 
-Il kernel è scritto nel linguaggio di programmazione C [c-language]_.
+Il kernel è scritto nel linguaggio di programmazione C `[c-language]`_.
 Più precisamente, il kernel viene compilato con ``gcc`` [gcc]_ usando
 l'opzione ``-std=gnu89`` [gcc-c-dialect-options]_: il dialetto GNU
 dello standard ISO C90 (con l'aggiunta di alcune funzionalità da C99)
@@ -41,7 +41,7 @@ possono usare e/o per accorciare il codice.
 Per maggiori informazioni consultate il file d'intestazione
 ``include/linux/compiler_attributes.h``.
 
-.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. _[c-language]: http://www.open-std.org/jtc1/sc22/wg14/www/standards
 .. [gcc] https://gcc.gnu.org
 .. [clang] https://clang.llvm.org
 .. [icc] https://software.intel.com/en-us/c-compilers



-- 
Jani Nikula, Intel Open Source Graphics Center
