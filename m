Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_TVD_MIME_EPI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 000197E3B8
	for <lwn-linux-doc@archive.lwn.net>; Sun,  5 Aug 2018 16:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbeHESqU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 5 Aug 2018 14:46:20 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38662 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726233AbeHESqU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Aug 2018 14:46:20 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fmM5d-0005Et-19; Sun, 05 Aug 2018 17:41:10 +0100
Date:   Sun, 5 Aug 2018 17:41:09 +0100
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, valdis.kletnieks@vt.edu,
        905116@bugs.debian.org
Message-ID: <20180805164108.GC18030@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="S1BNGpv0yoYahz37"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@decadent.org.uk
Subject: [PATCH v2] scripts/kernel-doc: Escape all literal braces in regexes
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on shadbolt.decadent.org.uk)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--S1BNGpv0yoYahz37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Commit 720ac2ef479d ("PATCH scripts/kernel-doc") fixed the two
instances of literal braces that Perl 5.28 warns about, but there are
still more than it doesn't warn about.

Escape all left braces that are treated as literal characters.  Also
escape literal right braces, for consistency and to avoid confusing
bracket-matching in text editors.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
v2: Rebase on top of commit 720ac2ef479d; reword accordingly

 scripts/kernel-doc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 31a34ced55a3..8f0f508a78e9 100755
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
-	$members =3D~ s/(\{[^\{\}]*})//g;
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
-		$level++ if ($clause =3D~ m/(\{)/ && !($clause =3D~m/}/));
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

--S1BNGpv0yoYahz37
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBW2copOe/yOyVhhEJAQpgpA/9EiwPoSSi0TWzBp/G3eh1/PXQLy6G4m8k
2ZJc6O1T1bufC8K+3ECo0ccDzp+jk9970fTBDeu9DFViL3H8LYwfYktqESY2hVOk
C5lUCY9EQnPqAxzPFEC4iOmlzw281v/iI8qe4MKJSvGHz/SJFViiJuRG7ZXq2soU
b6HKAXhCmQKkVYaIQOajoUiNLkSH6foOtE37QnYtHdAbJk/7kOZJm+AOdUHsPL/1
PlWuUnb5OWLuoT8MzhjsJYuGyOJgRrlw5UCKNJ4OSd1DTwrBjVDevgqVSZbweKN7
jX1zW9Ta5QnaMzu22lGQMOCiytiLLR+gBfNUqSEsZKT5gTRWeC9a/QwaJhkWaDzc
kemLSZ3UmAMfLWbDJCiKiG066Pu5bGJSxa53kC3SwAyu8G3ZCFN5ga6+tod3qKms
ldiY0Uk1mq0K+2ixiBcmM0FylxQXl0yJmqjzuMZBDL1CRNuRbarcraaemg6rzGnB
hme1y0a/hfAKFFXgNNQVsymtkiwIcO7yCJvFgXHUi6hB0ed7Kv70eBMmtCAFm1bQ
IErm0INFqdJyxJ00FoBQhIIAzVmSH4DFA15Zr/Z8vTDeX/RqdT+wcou9avxHuURf
zeGT1oWamVrD3H6DsOwnF0vLHkHsD3/W39NJWxguwNuu/PW6/gcAo0RDuzZzgXA4
i3u/vBHYM0w=
=Jjno
-----END PGP SIGNATURE-----

--S1BNGpv0yoYahz37--
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
