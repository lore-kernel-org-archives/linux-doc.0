Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1632C7E3B8
	for <lwn-linux-doc@archive.lwn.net>; Sun,  5 Aug 2018 16:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbeHES0a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 5 Aug 2018 14:26:30 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38598 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726207AbeHES0a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Aug 2018 14:26:30 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fmLmT-0004GN-RV; Sun, 05 Aug 2018 17:21:22 +0100
Date:   Sun, 5 Aug 2018 17:21:21 +0100
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, 905116@bugs.debian.org
Message-ID: <20180805162121.GB18030@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@decadent.org.uk
Subject: [PATCH] scripts/kernel-doc: Escape all literal braces in regexes
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on shadbolt.decadent.org.uk)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Braces are usually metacharacters in regexes, used to specify a
number of repetitions or as part of an escape sequence.  If this
interpretation is not possible then Perl currently treats them
as literal characters.

Perl 5.28 has deprecated the literal interpretation of left braces,
and Perl 5.32 will remove it (resulting in a fatal error).

Escape all left braces that are treated as literal characters.  Also
escape literal right braces, for consistency and to avoid confusing
bracket-matching in text editors.

References: https://bugs.debian.org/905116
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
I tested that the output of "make xmldocs" is identical before and
after this change, whether using Perl 5.26 or 5.28.

Ben.

 scripts/kernel-doc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0057d8eafcc1..8f0f508a78e9 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1062,7 +1062,7 @@ sub dump_struct($$) {
     my $x =3D shift;
     my $file =3D shift;
=20
-    if ($x =3D~ /(struct|union)\s+(\w+)\s*{(.*)}/) {
+    if ($x =3D~ /(struct|union)\s+(\w+)\s*\{(.*)\}/) {
 	my $decl_type =3D $1;
 	$declaration_name =3D $2;
 	my $members =3D $3;
@@ -1148,20 +1148,20 @@ sub dump_struct($$) {
 				}
 			}
 		}
-		$members =3D~ s/(struct|union)([^\{\};]+)\{([^\{\}]*)}([^\{\}\;]*)\;/$ne=
wmember/;
+		$members =3D~ s/(struct|union)([^\{\};]+)\{([^\{\}]*)\}([^\{\}\;]*)\;/$n=
ewmember/;
 	}
=20
 	# Ignore other nested elements, like enums
-	$members =3D~ s/({[^\{\}]*})//g;
+	$members =3D~ s/(\{[^\{\}]*\})//g;
=20
 	create_parameterlist($members, ';', $file, $declaration_name);
 	check_sections($file, $declaration_name, $decl_type, $sectcheck, $struct_=
actual);
=20
 	# Adjust declaration for better display
-	$declaration =3D~ s/([{;])/$1\n/g;
-	$declaration =3D~ s/}\s+;/};/g;
+	$declaration =3D~ s/([\{;])/$1\n/g;
+	$declaration =3D~ s/\}\s+;/};/g;
 	# Better handle inlined enums
-	do {} while ($declaration =3D~ s/(enum\s+{[^}]+),([^\n])/$1,\n$2/);
+	do {} while ($declaration =3D~ s/(enum\s+\{[^\}]+),([^\n])/$1,\n$2/);
=20
 	my @def_args =3D split /\n/, $declaration;
 	my $level =3D 1;
@@ -1171,12 +1171,12 @@ sub dump_struct($$) {
 		$clause =3D~ s/\s+$//;
 		$clause =3D~ s/\s+/ /;
 		next if (!$clause);
-		$level-- if ($clause =3D~ m/(})/ && $level > 1);
+		$level-- if ($clause =3D~ m/(\})/ && $level > 1);
 		if (!($clause =3D~ m/^\s*#/)) {
 			$declaration .=3D "\t" x $level;
 		}
 		$declaration .=3D "\t" . $clause . "\n";
-		$level++ if ($clause =3D~ m/({)/ && !($clause =3D~m/}/));
+		$level++ if ($clause =3D~ m/(\{)/ && !($clause =3D~m/\}/));
 	}
 	output_declaration($declaration_name,
 			   'struct',
@@ -1244,7 +1244,7 @@ sub dump_enum($$) {
     # strip #define macros inside enums
     $x =3D~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
=20
-    if ($x =3D~ /enum\s+(\w+)\s*{(.*)}/) {
+    if ($x =3D~ /enum\s+(\w+)\s*\{(.*)\}/) {
 	$declaration_name =3D $1;
 	my $members =3D $2;
 	my %_members;
@@ -1785,7 +1785,7 @@ sub process_proto_type($$) {
     }
=20
     while (1) {
-	if ( $x =3D~ /([^{};]*)([{};])(.*)/ ) {
+	if ( $x =3D~ /([^\{\};]*)([\{\};])(.*)/ ) {
             if( length $prototype ) {
                 $prototype .=3D " "
             }

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW2ckAee/yOyVhhEJAQpYrRAAx0/9oi05ckqE3yjxqeu84Nk+etxBjn7a
zNM084srLgdv9pgQOvHhEAQu5AHrFR23UyL1ffZueSVBF8Tbyy+IV+bSSqkUlOZI
aKRe1ZNwqizxcqo/T4g4o3zXwccuJsvjjZjQL4YgMMWdkpDOwVwpLaYXlW97Bpcw
z2YVgOQ3sR7eSpJvyJZx7LLCoi+/bq0H26FGYtinfdI0lodoy8c7T/xCo0nIDA63
Py6WpFFHbZ4hyhNcLwwIy6skXqoRUIqtWtFgM7TuIrVnuYgkXHhpbPq5+3R7lN4V
PVOb77RFIXBlcmMnjaZupxJCwO1FENzYHy6fO5NloVXq4f1Z8Jt8RAf2JewWibqG
xfsDGCQYjfLADm5059DpeURf0XlkL+qFfGV5M4giW8lM5orp8CXY9sMlsQieEQGO
I5c47QY9Ox+OnnMe/rQXLeAvhGU44oRF/4LSinnYMuSsldn/l59whjEYMNpAQt/B
y4131glRS0cDCAiwkdC33yii1pYO0NHgWl/rkGG+xMWV71SeXZvGPB4wdoHS7KCY
/es/PvQSIwR3qVG1eZNS1tyEu4JSIA8vZ2RkJQeahmWZQ6IH29pwMTmWPZib76Qu
8JOmD2ghnfgKRkLa7MwnDbCGQmETs/r19a3yl2f5zcN0oZzyaBvk5nbalVSHQJOU
xVLE9mPDqJE=
=Y5cQ
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
